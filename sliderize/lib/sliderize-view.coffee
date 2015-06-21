module.exports =
class SliderizeView
  constructor: (serializedState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('sliderize')

    # Create message element
    message = document.createElement('div')
    message.textContent = "The Sliderize package is Alive! It's ALIVE!"
    message.classList.add('message')
    @element.appendChild(message)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element

  createHighlight: ->
    color = "red"
    editor = atom.workspace.getActiveTextEditor()
    range = editor.getSelectedBufferRange()
    console.log range
    # create a marker that never invalidates that folows the user's selection range
    marker = editor.markBufferRange(range, invalidate: 'never')
    #(?) marker.bufferMarker.setProperties('addy-highlight': color)

    # create a decoration that follows the marker. A Decoration object is returned which can be updated
    decoration = editor.decorateMarker(marker, type: 'highlight', class: "highlight-#{color}")
