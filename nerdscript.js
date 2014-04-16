// Generated by CoffeeScript 1.3.3
(function() {
  var Action, Change, Object, Thing, UI,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    _this = this;

  this.NerdScript = {
    ui: {},
    objects: [],
    changes: []
  };

  Object = (function() {

    function Object() {
      this.actions = [];
    }

    return Object;

  })();

  Thing = (function(_super) {

    __extends(Thing, _super);

    function Thing() {
      this.actions = [];
    }

    return Thing;

  })(Object);

  Action = (function(_super) {

    __extends(Action, _super);

    function Action() {
      this.params = [];
    }

    return Action;

  })(Object);

  Change = (function() {

    function Change() {
      this.object = {};
    }

    return Change;

  })();

  UI = (function() {

    function UI() {
      this.add_event_listeners = __bind(this.add_event_listeners, this);

    }

    UI.prototype.new_object = function(parent, type) {
      var new_dom_object, new_object;
      if (parent == null) {
        parent = false;
      }
      if (type == null) {
        type = false;
      }
      new_dom_object = $('#dom-object').clone();
      if (parent) {
        new_dom_object.appendTo(parent);
        $('input', new_dom_object).focus();
        window.console.log(new_dom_object);
      } else {
        new_dom_object.appendTo($('#canvas'));
      }
      if (type) {
        new_dom_object.removeClass();
        new_dom_object.addClass('dom-object ' + type);
      }
      new_object = new Object({});
      new_object.actions = new Action();
      NerdScript.objects.push(new Object({}));
      new_dom_object.attr('id', 'object-' + NerdScript.objects.length);
      return this.add_event_listeners(new_dom_object);
    };

    UI.prototype.add_event_listeners = function(new_dom_object) {
      var _this = this;
      new_dom_object.keyup(function(event) {
        if (event.keyCode === 13) {
          $(this).trigger("enterKey");
        }
      });
      return new_dom_object.on("enterKey", function(event) {
        var parent;
        parent = $(event.target);
        return NerdScript.ui.new_object(parent);
      });
    };

    return UI;

  })();

  if (this.File && this.FileReader && this.FileList && this.Blob) {
    $(document).ready(function() {
      var canvas, editor_buttons;
      _this.NerdScript.ui = new UI();
      canvas = $('#canvas');
      editor_buttons = $('ul#editor');
      $('#buttons .button').on('click', function(event) {
        var button;
        button = $(event.target);
        return _this.NerdScript.ui.new_object(false, button.attr('id'));
      });
      return $('#canvas').on('click', function(event) {
        if ($(event.target).attr('id') === 'canvas') {
          return $('#buttons #thing').click();
        }
      });
    });
  }

}).call(this);
