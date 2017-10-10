package com.tradeshift.ups.rest;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.core.Response;

import org.springframework.stereotype.Component;

import com.tradeshift.commons.documentation.Description;

@Path("/external/ups")
@Component("UPSResource")
public class UPSResource {

    @GET
    @Path("test")
    @Description("First api")
    public Response firstAPI() {
        return Response.ok("hello ups!").build();
    }
}
