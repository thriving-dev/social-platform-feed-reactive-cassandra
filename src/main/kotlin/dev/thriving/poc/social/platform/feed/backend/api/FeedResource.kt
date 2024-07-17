package dev.thriving.poc.social.platform.feed.backend.api

import dev.thriving.poc.social.platform.feed.backend.data.*
import io.smallrye.mutiny.Multi
import io.smallrye.mutiny.Uni
import io.smallrye.mutiny.groups.UniOnItem
import io.smallrye.mutiny.tuples.Tuple3
import jakarta.ws.rs.*
import jakarta.ws.rs.core.MediaType
import org.jboss.resteasy.reactive.RestResponse
import org.jboss.resteasy.reactive.RestResponse.notFound
import org.jboss.resteasy.reactive.RestResponse.ok
import java.util.stream.Collectors

@Path("/")
@Produces(MediaType.APPLICATION_JSON)
class FeedResource(
    private val feedDao: FeedDao,
    private val postDao: PostDao,
    private val userDao: UserDao,
    private val userXPostRelDao: UserXPostRelDao,
) {

    @GET
    @Path("/feeds/{feedId}/posts")
    fun posts(
        feedId: String,
        @QueryParam("ltPostId") ltPostId: String,
        @QueryParam("pageSize") @DefaultValue("10") pageSize: Int,
    ): Uni<RestResponse<PostsResponseDto>> =
        getPostsByFeedIdLtPostId(feedId, ltPostId, pageSize)
            .transformToUni { posts: MutableList<Post> ->
                Uni.combine().all().unis(
                    getPostStatsListByFeed(feedId, posts),
                    getUserRelationsByPostIdsAsMap(STATIC_SESSION_USER_ID, posts),
                    getUsersByIdsAsMap(posts),
                ).asTuple().map { tuple3 -> ok(toPostsResponseDto(feedId, ltPostId, pageSize, posts, tuple3)) }
            }.onFailure(NotFoundException::class.java).recoverWithItem(notFound())

    @GET
    @Path("/feeds/{feedId}")
    fun feed(feedId: String) =
        feedDao.findById(feedId)
            .onItem().ifNotNull().transform { ok(it.toFeedDto()) }
            .onItem().ifNull().continueWith(notFound())
            .onFailure().recoverWithItem(notFound())

    @GET
    @Path("/feeds/{feedId}/posts/count")
    fun feed(
        feedId: String,
        @QueryParam("gtePostId") gtePostId: String,
        @QueryParam("limit") @DefaultValue("1000") limit: Int,
    ): Uni<RestResponse<NumPostsResponseDto>> =
        postDao.getPostIdsByFeedIdGtePostId(feedId, gtePostId, limit)
            .collect().with(Collectors.counting())
            .map { ok(NumPostsResponseDto(it)) }
            .onFailure().invoke { e -> println(e) }
            .onFailure().recoverWithItem(notFound())

    private fun toPostsResponseDto(
        feedId: String,
        ltPostId: String,
        pageSize: Int,
        posts: MutableList<Post>,
        tuple3: Tuple3<MutableList<PostStats>, Map<String, Set<UserPostRelTypes>>, MutableMap<String, User>>
    ) = PostsResponseDto(
        toMeta(feedId, ltPostId, pageSize),
        toPostDtos(posts, tuple3),
    )

    private fun toMeta(
        feedId: String,
        ltPostId: String,
        pageSize: Int,
    ) = PostsResponseDto.Meta(feedId, ltPostId, STATIC_SESSION_USER_ID, pageSize)

    private fun toPostDtos(
        posts: MutableList<Post>,
        tuple3: Tuple3<MutableList<PostStats>, Map<String, Set<UserPostRelTypes>>, MutableMap<String, User>>,
    ) = posts.mapIndexed { index, post ->
        val stats = tuple3.item1[index]
        val sessionUserRel = tuple3.item2[post.postId] ?: emptySet()
        val author = tuple3.item3[post.userId] ?: GHOST_USER
        toPostDto(post, author, stats, sessionUserRel)
    }

    private fun getUserRelationsByPostIdsAsMap(
        userId: String,
        posts: MutableList<Post>,
    ): Uni<Map<String, Set<UserPostRelTypes>>> =
        userXPostRelDao.getRelationsByUserIdAndPostIdsAndRelTypes(userId, posts.map(Post::postId))
            .collect().asList()
            .map { relations ->
                relations.groupBy(UserXPostRel::postId)
                    .mapValues { entry ->
                        entry.value.map { UserPostRelTypes.valueOf(it.rel_type) }.toSet()
                    }
            }

    private fun getPostStatsListByFeed(
        feedId: String,
        posts: MutableList<Post>,
    ): Uni<MutableList<PostStats>> = postDao.getStatsByFeedIdAndPostIds(feedId, posts.map(Post::postId)).collect().asList()

    private fun getPostsByFeedIdLtPostId(
        feedId: String,
        ltPostId: String,
        pageSize: Int,
    ): UniOnItem<MutableList<Post>> =
        postDao.getPostsByFeedIdLtPostId(feedId, ltPostId, pageSize)
            .collect().asList()
            .onItem()

    private fun getUsersByIdsAsMap(posts: MutableList<Post>) =
        Multi.createFrom().iterable(posts.map(Post::userId).toSet())
            .onItem().transformToUni(userDao::findById)
            .merge().collect().asMap(User::userId)

    private fun toPostDto(
        post: Post,
        author: User,
        postStats: PostStats,
        sessionUserRel: Set<UserPostRelTypes>,
    ) = PostDto(
        feedId = post.feedId,
        postId = post.postId,
        author = UserLightDto(post.userId, author.username, author.name, author.avatarUrl),
        text = post.text,
        impressions = postStats.impressions,
        bookmarked = postStats.bookmarked,
        likes = postStats.likes,
        replies = postStats.replies,
        sessionUserRel = sessionUserRel,
        createdAt = post.createdAt,
    )
}
