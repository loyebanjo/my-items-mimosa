// Generated by CoffeeScript 1.6.2
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['jquery', 'underscore', 'backbone', 'app/views/itemTypeListItem'], function($, _, Backbone, ItemTypeListItem) {
  var ItemTypeList, _ref;
  return ItemTypeList = (function(_super) {
    __extends(ItemTypeList, _super);

    function ItemTypeList() {
      this.addTypeItems = __bind(this.addTypeItems, this);
      _ref = ItemTypeList.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    ItemTypeList.prototype.tagName = 'ul';

    ItemTypeList.prototype.id = 'itemtypes';

    ItemTypeList.prototype.className = 'itemdata';

    ItemTypeList.prototype.addNewItem = function(newItem) {
      this.$el.append(new ItemTypeListItem({
        model: newItem
      }).render());
      return 0;
    };

    ItemTypeList.prototype.addTypeItems = function(type) {
      this.addNewItem(type);
      return 0;
    };

    ItemTypeList.prototype.render = function() {
      this.$el.find('li').remove();
      if (this.model) {
        _.each(this.model.models, this.addTypeItems, this);
      }
      return this.$el;
    };

    return ItemTypeList;

  })(Backbone.View);
});
