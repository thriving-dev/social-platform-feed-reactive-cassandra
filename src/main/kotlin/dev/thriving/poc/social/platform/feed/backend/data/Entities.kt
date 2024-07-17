package dev.thriving.poc.social.platform.feed.backend.data

import com.datastax.oss.driver.api.mapper.annotations.ClusteringColumn
import com.datastax.oss.driver.api.mapper.annotations.CqlName
import com.datastax.oss.driver.api.mapper.annotations.Entity
import com.datastax.oss.driver.api.mapper.annotations.PartitionKey
import java.time.Instant

@Entity
@CqlName("feed")
data class Feed(
    @PartitionKey
    val feedId: String,
    var feedname: String,
    var description: String?,
    val createdAt: Instant,
    var updatedAt: Instant,
)

@Entity
@CqlName("user")
data class User(
    @PartitionKey
    var userId: String,
    val username: String,
    val passwordHash: String,
    var name: String,
    var avatarUrl: String,
    val createdAt: Instant,
    var updatedAt: Instant,
)

@Entity
@CqlName("post")
data class Post(
    @PartitionKey
    val feedId: String,
    @ClusteringColumn
    val postId: String,
    var userId: String,
    var text: String,
    val createdAt: Instant,
)

@Entity
@CqlName("post_by_user_mview")
data class PostByUserMView(
    @PartitionKey
    var userId: String,
    @ClusteringColumn(1)
    val postId: String,
    @ClusteringColumn(2)
    val feedId: String,
    var text: String,
    val createdAt: Instant,
)

@Entity
@CqlName("post_by_user_feed_mview")
data class PostByUserFeedMView(
    @PartitionKey(0)
    var userId: String,
    @PartitionKey(1)
    val feedId: String,
    @ClusteringColumn(1)
    val postId: String,
    var text: String,
    val createdAt: Instant,
)

@Entity
@CqlName("post_stats")
data class PostStats(
    @PartitionKey
    val feedId: String,
    @ClusteringColumn
    val postId: String,
    val impressions: Long,
    val bookmarked: Long,
    val likes: Long,
    val replies: Long,
)

@Entity
@CqlName("user_x_post_rel")
data class UserXPostRel(
    @PartitionKey
    val user_id: String,
    @ClusteringColumn(1)
    val rel_type: String,
    @ClusteringColumn(2)
    val postId: String,
    val createdAt: Instant,
)

@Entity
@CqlName("post_x_user_rel_mview")
data class PostXUserRelMView(
    @PartitionKey
    val postId: String,
    @ClusteringColumn(1)
    val rel_type: String,
    @ClusteringColumn(2)
    val user_id: String,
    val createdAt: Instant,
)
