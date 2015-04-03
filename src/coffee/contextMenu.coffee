React = require "react"

ContextMenu = React.createClass
  styles:
    contextBtnStyles:
      display: "flex"
      justifyContent: "center"
      alignItems: "center"
      margin: 0
      padding: "5px"
      borderRadius: "50%"
      
    iconStyles:
      width: "24px"
      height: "24px"
      
  handleClick: (e) ->
    e.stopPropagation()
    
  bindKey: (e) ->
    e.stopPropagation()
    
  componentDidMount: ->
    @refs.testref.getDOMNode().onclick = @bindKey
    
    $(@refs.dropdownBtn.getDOMNode()).dropdown
      hover: false
      constrain_width: no
    
  render: ->
    <div>
      <div ref="dropdownBtn" className="waves-effect" style={@styles.contextBtnStyles} onClick={@handleClick} data-activates="dropdown1">
        <div className="svg-ic_more_vert_24px" style={@styles.iconStyles}></div>
      </div>
      <ul id="dropdown1" className="dropdown-content">
        <li><a href="#!" ref="testref">Bind key</a></li>
        <li><a href="#!">two</a></li>
      </ul>
    </div>
      
module.exports = ContextMenu