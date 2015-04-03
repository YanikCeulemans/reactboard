React = require "react"
HowlFactory = require "howler"
ContextMenu = require "./contextMenu.coffee"

SoundCard = React.createClass
  styles:
    soundcardStyles:
      display: "flex"
      flexDirection: "column"
      marginRight: "10px"
      
    topbarStyles:
      display: "flex"
      flexDirection: "row-reverse"
      
  getInitialState: ->
    clickCount: 0
    howl: new HowlFactory.Howl
      urls: [@props.initialAudiosrc]
    
  handleClick: ->
    @setState clickCount: @state.clickCount + 1
    @state.howl.play()
    
  componentDidMount: ->
    console.log "componentDidMount", @state
    
  render: ->
    <div className="card waves-effect" style={@styles.soundcardStyles} onClick={@handleClick}>
      <div className="card-image" style={@styles.topbarStyles}>
        <ContextMenu />
      </div>
      <div className="card-content">
        {@props.name}
      </div>
    </div>


module.exports = SoundCard