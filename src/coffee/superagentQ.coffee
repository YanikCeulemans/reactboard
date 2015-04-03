superagent = require "superagent"
Q = require "q"
    
module.exports =
  get: (url) ->
    defer = Q.defer()
    superagent.get(url).end (err, res)->
      if err? then defer.reject err else defer.resolve
        data: res.body
        status: res.status
    
    defer.promise