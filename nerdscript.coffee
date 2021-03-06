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

  new_object: (parent = false, type = false) ->

    # copy dom object
    new_dom_object = $('#dom-object').clone()
    $('input', new_dom_object).attr('placeholder', type)
    
    # target dom object
    if parent and parent.hasClass('thing')
      new_dom_object.appendTo(parent)
    else if parent
      window.console.log parent.closest('thing')
      new_dom_object.appendTo(parent.closest('.thing'))      
    else
      new_dom_object.appendTo($('#canvas'))
    $('input', new_dom_object).focus()

    # type
    if type
      new_dom_object.removeClass()
      new_dom_object.addClass('dom-object ' + type)
      
    
    #ObjectMapping.define_object
              
    # define js object
    new_object = new Object({})
    new_object.actions = new Action()
    
    # add object to history
    
    # map objects
    NerdScript.objects.push new Object({})
    new_dom_object.attr('id', 'object-' + NerdScript.objects.length)
    
    # add event listeners
    @add_event_listeners(new_dom_object)

  add_event_listeners: (new_dom_object) =>

    #new_dom_object.on 'change', (event) =>
    #  dom = $(event.target)
    #  true  

    # on enter create new object
    new_dom_object.keyup (event) ->
      $(this).trigger "enterKey" if event.keyCode is 13
      false
      
    new_dom_object.on "enterKey", (event) =>
      parent = $(event.target)
      NerdScript.ui.new_object(parent)
      false
         
if @File && @FileReader && @FileList && @Blob

  $(document).ready =>
  
    # CONFIG
    
    @NerdScript.ui = new UI()
    canvas = $('#canvas')
    editor_buttons = $('ul#editor')

    # BEHAVIORS

          
    # UI
    
    # UI Events
    
    # new object from button
    $('#buttons .button').on 'click', (event) =>
      button = $(event.target)
      @NerdScript.ui.new_object(false, button.attr('id'))
    
    # Keyboard Events

    # new object if cursor clicks in canvas      
    $('#canvas').on 'click', (event) =>
      $('#buttons #thing').click() if $(event.target).attr('id') == 'canvas'  
 
    #link = document.importNode(document.querySelector('link[rel="import"]'), true)
    #@console.log link
    #`var template = link.import.querySelector("template")`
    #@console.log template
    #clone = document.importNode(link, true)
    #document.querySelector("#preview").appendChild link
	





