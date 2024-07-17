package dev.thriving.poc.social.platform.feed.backend.api

import io.smallrye.mutiny.uni
import jakarta.ws.rs.GET
import jakarta.ws.rs.Path
import jakarta.ws.rs.Produces
import jakarta.ws.rs.core.MediaType

@Path("/hello")
class GreetingResource {

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    fun hello() = uni { "Hello RESTEasy" }
}
