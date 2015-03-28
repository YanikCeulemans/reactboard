React = require "react"
HowlFactory = require "howler"

class Audier
  constructor: (audiofile) ->
    @loaded = false
    @audioBuffer = null
    try 
      AudioContext = window.AudioContext || window.webkitAudioContext
      @context = new AudioContext()
      @load audiofile
    catch e
      alert "Web Audio API is not supported in this browser"
      
  load: (url) ->
    request = new XMLHttpRequest()
    request.open "GET", url, true
    request.responseType = "arraybuffer"
    
    request.onload = =>
      @context.decodeAudioData request.response, (buffer) =>
        @loaded = true
        @audioBuffer = buffer;
      , (err) -> console.log "error occurred", err
      
    request.send()
      
  play: ->
    source = @context.createBufferSource()
    source.buffer = @audioBuffer
    source.connect @context.destination
    source.start 0
    
###

function loadDogSound(url) {
  var request = new XMLHttpRequest();
  request.open('GET', url, true);
  request.responseType = 'arraybuffer';

  // Decode asynchronously
  request.onload = function() {
    context.decodeAudioData(request.response, function(buffer) {
      dogBarkingBuffer = buffer;
    }, onError);
  }
  request.send();
}

function playSound(buffer) {
  var source = context.createBufferSource(); // creates a sound source
  source.buffer = buffer;                    // tell the source which sound to play
  source.connect(context.destination);       // connect the source to the context's destination (the speakers)
  source.start(0);                           // play the source now
                                             // note: on older systems, may have to use deprecated noteOn(time);
}###

SoundCard = React.createClass
  getInitialState: ->
    clickCount: 0
    howl: new HowlFactory.Howl
      urls: [@props.audiosrc]
    audier: new Audier @props.audiosrc
    
  handleClick: ->
    @setState clickCount: @state.clickCount + 1
    # @state.howl.play()
    @state.audier.play()
    
  componentDidMount: ->
    console.log "componentDidMount", @state
    
  render: ->
    <div className="card-panel waves-effect soundcard" onClick={@handleClick}>
      You clicked {@state.clickCount} times.
    </div>


module.exports = SoundCard