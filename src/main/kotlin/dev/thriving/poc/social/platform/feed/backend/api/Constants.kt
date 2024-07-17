package dev.thriving.poc.social.platform.feed.backend.api

import dev.thriving.poc.social.platform.feed.backend.data.User
import java.time.Instant

val STATIC_SESSION_USER_ID = "01HPWGWY9C0K2YH7PZGC4XSBHZ"

val GHOST_USER = User(
    userId = "00HPWGWY9C0K2YH7PZGC4XSBHA",
    username = "ghost",
    passwordHash = "",
    name = "Deleted User",
    avatarUrl = "/avatars/ghost.webp",
    createdAt = Instant.MIN,
    updatedAt = Instant.MIN,
)
