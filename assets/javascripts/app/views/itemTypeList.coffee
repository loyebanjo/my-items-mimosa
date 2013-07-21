define ['jquery', 'underscore', 'backbone', 'app/views/itemTypeListItem'], ($, _, Backbone, ItemTypeListItem)->
	class ItemTypeList extends Backbone.View
		tagName: 'ul'

		id: 'itemtypes'

		className: 'itemdata'

		addNewItem: (newItem)->
			@$el.append new ItemTypeListItem( model:newItem ).render()
			0

		addTypeItems: (type)=>
			@addNewItem type
			0

		render: ->
			@$el.find('li').remove()

			if @model
				_.each @model.models, @addTypeItems, @

			@$el
