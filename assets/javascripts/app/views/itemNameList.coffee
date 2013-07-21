define ['jquery', 'underscore', 'backbone', 'app/views/itemNameListItem'], ($, _, Backbone, ItemNameListItem)->
	class ItemNameList extends Backbone.View
		tagName : 'ul'

		id : 'itemnames'

		className : 'itemdata'

		initialize: ->
			@model.on 'add', @addNameItem, @
			@model.on 'destroy', @render, @
			@model.on 'queryOccurred', @render, @
			0

		addNewItem: (newItem)->
			@$el.append new ItemNameListItem( model:newItem ).render()
			0

		addNameItems: (name)=>
			@addNewItem name
			0

		addModels: (models)->
			if @model
				_.each models, @addNameItems, @
			0

		render: ->
			@$el.find('li').remove()

			models = if @model.queriedModels then @model.queriedModels else @model.models

			@addModels(models)

			@$el