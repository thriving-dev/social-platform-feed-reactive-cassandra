package dev.thriving.poc.social.platform.feed.backend

import dev.thriving.poc.social.platform.feed.backend.data.FeedDao
import dev.thriving.poc.social.platform.feed.backend.data.PostDao
import dev.thriving.poc.social.platform.feed.backend.data.UserDao
import dev.thriving.poc.social.platform.feed.backend.data.UserXPostRelDao
import io.quarkus.runtime.Startup
import jakarta.enterprise.context.ApplicationScoped

@ApplicationScoped
class BeanConfiguration(
    private val feedDao: FeedDao,
    private val postDao: PostDao,
    private val userDao: UserDao,
    private val userXPostRelDao: UserXPostRelDao,
) {
    @Startup
    fun init() {
        // note: force init beans to avoid quarkus crashing when trying to init beans from reactive context on first API access...
        println("init .. $feedDao $postDao $userDao $userXPostRelDao")
    }
}
