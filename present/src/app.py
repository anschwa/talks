#!/usr/bin/env python3
import bottle


@bottle.route("/")
def hello():
    return "<h1>What is six times nine?</h1>"


bottle.run(host="localhost", port=8080, debug=True)
