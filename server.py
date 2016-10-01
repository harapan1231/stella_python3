# -*- coding: utf-8 -*-

from bottle import route, run, response
from json import dumps
import urllib, urllib.request

@route("/<fromlang>/<tolang>/<words>")
def translate(fromlang, tolang, words):
    wl_params = urllib.parse.urlencode({"wl_srclang": fromlang, "wl_trglang": tolang, "wl_data": words, "wl_password": "secret", "wl_errorstyle": "1"})
    wl_url = "http://www.worldlingo.com/S000.1/api?%s" % wl_params
    wl_res = urllib.request.urlopen(wl_url).read().decode("utf-8")
    response.content_type = 'application/json'
    print(wl_res)
    return dumps(wl_res if wl_res and wl_res != words else "0o.l-_-lzzz")

run(host='localhost', port=8080, dubug=True)
