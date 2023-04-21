package com.example.vertx_starter

import io.vertx.core.AbstractVerticle
import io.vertx.core.Promise
import io.vertx.core.Vertx

fun main() {
  val vertx: Vertx = Vertx.vertx()
  vertx.deployVerticle(MainVerticle())
}

class MainVerticle : AbstractVerticle() {

  override fun start(startPromise: Promise<Void>) {
    vertx
      .createHttpServer()
      .requestHandler { req ->
        println("generating response")
        req.response()
          .putHeader("content-type", "text/plain")
          .end("Hello from Vert.x!............")
      }
      .listen() { http ->
        if (http.succeeded()) {
          startPromise.complete()
          println("HTTP server started on port 8888")
        } else {
          startPromise.fail(http.cause());
        }
      }
  }
}
