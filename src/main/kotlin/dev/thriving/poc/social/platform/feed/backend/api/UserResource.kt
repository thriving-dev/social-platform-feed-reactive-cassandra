package dev.thriving.poc.social.platform.feed.backend.api

import dev.thriving.poc.social.platform.feed.backend.data.UserDao
import jakarta.ws.rs.GET
import jakarta.ws.rs.Path
import org.jboss.resteasy.reactive.RestResponse

@Path("/users")
class UserResource(
    private val userDao: UserDao,
) {
    @GET
    @Path("/{userId}")
    fun feed(userId: String) =
        userDao
            .findById(userId)
            .onItem()
            .ifNotNull()
            .transform { RestResponse.ok(it.toUserLightDto()) }
            .onItem()
            .ifNull()
            .continueWith(RestResponse.notFound())
            .onFailure()
            .recoverWithItem(RestResponse.notFound())
}
