React = require "react"
TestComponent = require "./test.coffee"
SoundCard = require "./soundcard.coffee"

SimpleComponent = React.createClass
  render: ->
    <div className="simple-component">
      {<h1>A Component is I</h1> if @props.showTitle}
      <hr />
      {<p key={n}>This line has been printed {n} times</p> for n in [1..5]}
    </div>
    
React.render(<SoundCard audiosrc="/media/samples/kick.mp3" />, document.getElementById('react-anchor'))