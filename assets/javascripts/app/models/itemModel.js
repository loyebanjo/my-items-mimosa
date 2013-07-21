// Generated by CoffeeScript 1.6.2
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['jquery', 'underscore', 'backbone'], function($, _, Backbone) {
  var ItemModel, _ref;
  return ItemModel = (function(_super) {
    __extends(ItemModel, _super);

    function ItemModel() {
      _ref = ItemModel.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    ItemModel.prototype.defaults = {
      id: null,
      item_name: '',
      item_type: '',
      item_description: ''
    };

    ItemModel.prototype.urlRoot = 'localhost/php-server/php/items.php';

    ItemModel.prototype.url = function() {
      var id, item_description, item_name, item_type;
      item_name = this.get('item_name');
      item_type = this.get('item_type');
      item_description = this.get('item_description');
      if (this.isNew()) {
        return this.urlRoot + '?' + 'item_name=' + item_name + '&item_type=' + item_type + '&item_description=' + item_description;
      } else {
        id = this.get('id');
        return this.urlRoot + '?id' + id + 'item_name=' + item_name + '&item_type=' + item_type + '&item_description=' + item_description;
      }
    };

    return ItemModel;

  })(Backbone.Model);
});