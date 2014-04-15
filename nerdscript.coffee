#http://www.html5rocks.com/en/tutorials/webcomponents/imports/

class Object
  constructor: ->
    @actions = []

class Action
  constructor: ->
    @params = []

class Change
  constructor: ->
    @object = {}
    
if @File && @FileReader && @FileList && @Blob

  @NerdScript = {objects: [], changes: []}
  

  $(document).ready =>  
    canvas = $('#canvas')
    editor_buttons = $('ul#editor')
    @console.log editor_buttons
  
    dom_object = $('#dom-object')
    
    $('#add_object').click =>
      @console.log 'kjhg'
      $('#canvas').append(dom_object)
    
    object = new Object({})
    object.actions = new Action()
    @console.log object
    @console.log object.actions