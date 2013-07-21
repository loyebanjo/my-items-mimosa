
define ['jquery', 'underscore', 'backbone'], ($, _, Backbone)->
	class ItemModel extends Backbone.Model
		defaults:
			id: null,
			item_name:'',
			item_type:'',
			item_description:''
		urlRoot:
			'localhost/php-server/php/items.php'
		url: ->
			item_name = @get('item_name')
			item_type = @get('item_type')
			item_description = @get('item_description')

			if @isNew()
				@urlRoot + '?' + 'item_name=' + item_name + '&item_type=' + item_type + '&item_description=' + item_description
			else
				id = @get('id')
				@urlRoot + '?id' + id + 'item_name=' + item_name + '&item_type=' + item_type + '&item_description=' + item_description			
