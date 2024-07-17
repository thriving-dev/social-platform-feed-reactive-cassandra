package dev.thriving.poc.social.platform.feed.backend.api

import java.time.Instant

data class FeedDto(
    val feedId: String,
    val feedname: String,
    val description: String?,
    val createdAt: Instant,
    val updatedAt: Instant,
)

data class PostsResponseDto(
    val meta: Meta,
    val posts: List<PostDto>,
) {
    data class Meta(
        val feedId: String,
        val ltPostId: String,
        val sessionUserId: String,
        val pageSize: Int,
    )
}

data class PostDto(
    val feedId: String,
    val postId: String,
    val author: UserLightDto,
    val text: String,
    val impressions: Long,
    val bookmarked: Long,
    val likes: Long,
    val replies: Long,
    val sessionUserRel: Set<UserPostRelTypes>,
    val createdAt: Instant,
)

data class UserLightDto(
    val userId: String,
    val username: String,
    val name: String,
    val avatarUrl: String,
)

enum class UserPostRelTypes {
    LIKE,
    BOOKMARK,
}

data class NumPostsResponseDto(
    val count: Long,
)
