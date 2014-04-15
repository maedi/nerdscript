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


    $('#add_object').click =>
      $('#canvas').append($('#dom-object'))
            
    $('#canvas').click =>
      $('#add_object').click()
    
    
    object = new Object({})
    object.actions = new Action()
    @console.log object
    @console.log object.actions