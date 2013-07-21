// Generated by CoffeeScript 1.6.2
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['jquery', 'underscore', 'backbone', 'templates'], function($, _, Backbone, templates) {
  var MainItemDetailsView, _ref;
  return MainItemDetailsView = (function(_super) {
    __extends(MainItemDetailsView, _super);

    function MainItemDetailsView() {
      this.detailsTemplateCallback = __bind(this.detailsTemplateCallback, this);
      _ref = MainItemDetailsView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    MainItemDetailsView.prototype.el = 'div.rightside';

    MainItemDetailsView.prototype.detailsTemplateCallback = function(err, out) {
      this.$el.html(out);
      return 0;
    };

    MainItemDetailsView.prototype.render = function() {
      var el;
      templates.render(this.htmlText, {
        item_name: this.jsonModel.item_name,
        item_type: this.jsonModel.item_type,
        item_description: this.jsonModel.item_description
      }, this.detailsTemplateCallback);
      if (this.htmlText === 'itemFormDetails') {
        el = this.$el.find('#item_name_text');
        el.focus();
      }
      return 0;
    };

    return MainItemDetailsView;

  })(Backbone.View);
});