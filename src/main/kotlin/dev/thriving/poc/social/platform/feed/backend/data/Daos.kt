package dev.thriving.poc.social.platform.feed.backend.data

import com.datastax.oss.driver.api.mapper.annotations.*
import com.datastax.oss.quarkus.runtime.api.reactive.MutinyReactiveResultSet
import com.datastax.oss.quarkus.runtime.api.reactive.mapper.MutinyMappedReactiveResultSet
import dev.thriving.poc.social.platform.feed.backend.api.UserPostRelTypes
import io.smallrye.mutiny.Uni

@Mapper
interface DaoMapper {
    @DaoFactory
    fun feedDao(): FeedDao

    @DaoFactory
    fun userDao(): UserDao

    @DaoFactory
    fun postDao(): PostDao

    @DaoFactory
    fun userXPostRelDao(): UserXPostRelDao
}

@Dao
interface FeedDao {
    @Select
    fun findById(feedId: String): Uni<Feed>
}

@Dao
interface PostDao {
    @Query(
        """
        SELECT * FROM post 
        WHERE feed_id=:feedId 
          AND post_id < :ltPostId 
        LIMIT :l
        """,
    )
    fun getPostsByFeedIdLtPostId(
        feedId: String,
        ltPostId: String,
        @CqlName("l") limit: Int = 4,
    ): MutinyMappedReactiveResultSet<Post>

    @Query(
        """
        SELECT * FROM post_stats 
        WHERE feed_id=:feedId 
          AND post_id IN :postIds
        """,
    )
    fun getStatsByFeedIdAndPostIds(
        feedId: String,
        postIds: List<String>,
    ): MutinyMappedReactiveResultSet<PostStats>

    @Query(
        """
        SELECT post_id FROM post 
        WHERE feed_id=:feedId 
          AND post_id >= :gtePostId 
        LIMIT :l
        """,
    )
    fun getPostIdsByFeedIdGtePostId(
        feedId: String,
        gtePostId: String,
        @CqlName("l") limit: Int = 4,
    ): MutinyReactiveResultSet
}

@Dao
interface UserXPostRelDao {
    @Query(
        """
        SELECT * FROM user_x_post_rel 
        WHERE user_id=:userId 
          AND rel_type IN :relTypes 
          AND post_id IN :postIds
        """,
    )
    fun getRelationsByUserIdAndPostIdsAndRelTypes(
        userId: String,
        postIds: List<String>,
        relTypes: List<String> = UserPostRelTypes.entries.map(UserPostRelTypes::toString),
    ): MutinyMappedReactiveResultSet<UserXPostRel>
}

@Dao
interface UserDao {
    @Select
    fun findById(userId: String): Uni<User>
}
