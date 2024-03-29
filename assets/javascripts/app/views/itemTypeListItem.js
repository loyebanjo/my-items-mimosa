// Generated by CoffeeScript 1.6.2
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['jquery', 'underscore', 'templates', 'backbone'], function($, _, templates, Backbone) {
  var ItemTypeListNameItem, _ref;
  return ItemTypeListNameItem = (function(_super) {
    __extends(ItemTypeListNameItem, _super);

    function ItemTypeListNameItem() {
      this.renderListTypeItems = __bind(this.renderListTypeItems, this);
      _ref = ItemTypeListNameItem.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    ItemTypeListNameItem.prototype.tagName = 'li';

    ItemTypeListNameItem.prototype.className = 'listItem';

    ItemTypeListNameItem.prototype.events = {
      'click': 'renderListNameItem'
    };

    ItemTypeListNameItem.prototype.renderListNameItem = function() {
      var itemCollection, textValue;
      textValue = this.$el.find('span').text();
      itemCollection = app.getItemsCollection();
      itemCollection.resetItemNameList(textValue);
      return false;
    };

    ItemTypeListNameItem.prototype.renderListTypeItems = function(err, out) {
      return this.$el.html(out);
    };

    ItemTypeListNameItem.prototype.render = function() {
      templates.render('itemType', {
        item_type: this.model.toJSON().item_type
      }, this.renderListTypeItems);
      return this.$el;
    };

    return ItemTypeListNameItem;

  })(Backbone.View);
});
