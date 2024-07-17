package dev.thriving.poc.social.platform.feed.backend.api

import dev.thriving.poc.social.platform.feed.backend.data.Feed
import dev.thriving.poc.social.platform.feed.backend.data.User

fun Feed.toFeedDto() =
    FeedDto(
        feedId = this.feedId,
        feedname = this.feedname,
        description = this.description,
        createdAt = this.createdAt,
        updatedAt = this.updatedAt,
    )

fun User.toUserLightDto() =
    UserLightDto(
        userId = this.userId,
        username = this.username,
        name = this.name,
        avatarUrl = this.avatarUrl,
    )
