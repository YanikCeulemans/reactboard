React = require "react"
SoundBoard = require "./soundboard.coffee"
requestQ = require "./superagentQ.coffee"
ContextMenu = require "./contextMenu.coffee"

requestQ.get("/data/samples.json").then (response) ->
  React.render <SoundBoard samples={response.data} />, document.getElementById "react-anchor"
, (err) ->
  console.log "error occurred while trying to fetch data: ", err