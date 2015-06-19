SliderizeView = require './sliderize-view'
{CompositeDisposable} = require 'atom'

module.exports = Sliderize =
  sliderizeView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @sliderizeView = new SliderizeView(state.sliderizeViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @sliderizeView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'sliderize:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @sliderizeView.destroy()

  serialize: ->
    sliderizeViewState: @sliderizeView.serialize()

  toggle: ->
    console.log 'Sliderize was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
