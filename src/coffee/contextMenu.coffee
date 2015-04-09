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
      
    containerStyles:
      position: "relative"
    
    popupStyles:
      position: "absolute"
      width: "100px"
      height: "50px"
      border: "1px solid black"
      
  template: (styles) ->
    <div style={styles.popupStyles}>Hi, i'm a popup!</div>
    
  compileTemplate: (container) ->
    template = @template @styles
    React.render template, container
    
  handleClick: (e) ->
    e.stopPropagation()
    container = document.querySelector ".popup-container"
    @compileTemplate container
    
  componentDidMount: ->
    bodyContainer = document.querySelector("body")
    if !bodyContainer.querySelector ".popup-container"
      popupContainer = document.createElement "div"
      popupContainer.setAttribute "class", "popup-container"
      bodyContainer.appendChild(popupContainer)
        
  render: ->
    <div style={@styles.containerStyles}>
      <div ref="dropdownBtn" className="waves-effect" style={@styles.contextBtnStyles} onClick={@handleClick}>
        <div className="svg-ic_more_vert_24px" style={@styles.iconStyles}></div>
      </div>
      <ul id="dropdown1" className="dropdown-content">
        <li><a href="#!" ref="testref">Bind key</a></li>
        <li><a href="#!">two</a></li>
      </ul>
    </div>
      
module.exports = ContextMenu