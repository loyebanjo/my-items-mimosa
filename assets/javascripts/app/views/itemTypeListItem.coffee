define ['jquery', 'underscore', 'templates', 'backbone'], ($, _, templates, Backbone)->
	class ItemTypeListNameItem extends Backbone.View
		tagName: 'li'

		className: 'listItem'

		events:
			'click' : 'renderListNameItem'

		renderListNameItem: ->
			textValue = @$el.find('span').text()

			itemCollection = app.getItemsCollection()

			itemCollection.resetItemNameList( textValue );

			false

		renderListTypeItems: (err, out)=>
			@$el.html(out)

		render: ->
			templates.render 'itemType', { item_type : @model.toJSON().item_type }, @renderListTypeItems
			@$el