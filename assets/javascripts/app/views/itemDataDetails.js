// Generated by CoffeeScript 1.6.2
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['jquery', 'underscore', 'backbone', 'app/views/mainItemDetailsView'], function($, _, Backbone, MainItemDetailsView) {
  var ItemDataDetails, _ref;
  return ItemDataDetails = (function(_super) {
    __extends(ItemDataDetails, _super);

    function ItemDataDetails() {
      _ref = ItemDataDetails.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    ItemDataDetails.prototype.initialize = function() {
      this.htmlText = 'itemDataDetails';
      this.jsonModel = this.model.toJSON();
      return 0;
    };

    return ItemDataDetails;

  })(MainItemDetailsView);
});