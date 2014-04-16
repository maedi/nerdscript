#https://gist.github.com/maedi/9e9ca8792136fc150472
#https://gist.github.com/maedi/5d94db146570eab3a6bb
#http://www.html5rocks.com/en/tutorials/webcomponents/imports/

# CONFIG

@NerdScript = {ui: {}, objects: [], changes: []}

# OBJECT MODEL

class Object
  constructor: ->
    @actions = []

class Thing extends Object
  constructor: ->
    @actions = []

class Action extends Object
  constructor: ->
    @params = []

class Change
  constructor: ->
    @object = {}
    
# UI

# Singelton UI Actions
class UI

  new_object: (dom, type) =>

    # copy dom object
    new_dom_object = $('#dom-object').clone()
    new_dom_object.appendTo($('#canvas'))
    
    if type
      object_type = $('.object-type', new_dom_object)
      object_type.removeClass()
      object_type.addClass('object-type ' + type)
              
    # define js object
    new_object = new Object({})
    new_object.actions = new Action()
    
    # add object to history
    NerdScript.objects.push new Object({})
         
if @File && @FileReader && @FileList && @Blob

  $(document).ready =>
  
    # CONFIG
    
    @NerdScript.ui = new UI()
    canvas = $('#canvas')
    editor_buttons = $('ul#editor')

    # BEHAVIORS

    # New Object
    $('#buttons .button').on 'click', (event) =>
      dom = $(event.target)
      @NerdScript.ui.new_object(dom, dom.attr('id'))
          
    # UI
    
    # UI Events
    $('input').on 'change', (event) =>
      @console.log 'event'
    
    
    # Keyboard Events

    # new object if cursor clicks in canvas      
    $('#canvas').on 'click', (event) =>
      $('#buttons #thing').click() if $(event.target).attr('id') == 'canvas'
    
    # on enter create new line
    $("input").keyup (event) ->
      $(this).trigger "enterKey" if event.keyCode is 13
      return
    $("input").on "enterKey", (event) =>
      dom = $(event.target)
      @console.log dom
   
   
#    # event handlers      
#    dom.on 'change', (event) =>
#      dom = $(event.target)
#      true   