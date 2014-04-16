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
      this.new_object = __bind(this.new_object, this);

    }

    UI.prototype.new_object = function(dom, type) {
      var new_dom_object, new_object, object_type;
      new_dom_object = $('#dom-object').clone();
      new_dom_object.appendTo($('#canvas'));
      if (type) {
        object_type = $('.object-type', new_dom_object);
        object_type.removeClass();
        object_type.addClass('object-type ' + type);
      }
      new_object = new Object({});
      new_object.actions = new Action();
      return NerdScript.objects.push(new Object({}));
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
        var dom;
        dom = $(event.target);
        return _this.NerdScript.ui.new_object(dom, dom.attr('id'));
      });
      $('input').on('change', function(event) {
        return _this.console.log('event');
      });
      $('#canvas').on('click', function(event) {
        if ($(event.target).attr('id') === 'canvas') {
          return $('#buttons #thing').click();
        }
      });
      $("input").keyup(function(event) {
        if (event.keyCode === 13) {
          $(this).trigger("enterKey");
        }
      });
      return $("input").on("enterKey", function(event) {
        var dom;
        dom = $(event.target);
        return _this.console.log(dom);
      });
    });
  }

}).call(this);
