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
  
    # CONFIG
    
    canvas = $('#canvas')
    editor_buttons = $('ul#editor')

    # BEHAVIORS

    $('#new_object').on 'click', (event) =>
      dom = $(event.target)
      
      $('#canvas').append($('#dom-object'))

      new_object = new Object({})
      new_object.actions = new Action()
      
      @NerdScript.objects.push new Object({})

      @console.log @NerdScript.objects
      @console.log dom
         
            
    $('#canvas').click =>
      $('#new_object').click()