React = require "react"
SoundCard = require "./soundcard.coffee"

SoundBoard = React.createClass
  styles:
    display: "flex"
    flexDirection: "row"
    flexWrap: "wrap"
    justifyContent: "flex-start"
    
  propTypes:
    samples: React.PropTypes.array.isRequired
    
  render: ->
    <div style={@styles}>
      {<SoundCard key={i} initialAudiosrc={sample.path} name={sample.name} /> for sample, i in @props.samples}
    </div>
    
module.exports = SoundBoard