define ['jquery', 'underscore', 'backbone', 'templates', 'app/views/itemDataDetails'], ($, _, Backbone, templates, ItemDataDetails)->
	class ItemNameListItem extends Backbone.View
		tagName: 'li'

		className: 'listItem'

		events:
			'click' : 'renderDataItem'

		renderDataItem: ->
			textValue = @$el.find('span').text()

			if textValue
				button = $.find('#saveItem')[0]

				if button.innerText isnt 'Update Item'
					button.innerHTML = 'Update Item'

				new ItemDataDetails( model: @model ).render()

				app.setItemDetailsModel(@model)
			0

		renderListItemCallback: (err, out)=>
			@$el.html out

		render: ->
			templates.render 'itemName', { item_name : @model.toJSON().item_name }, @renderListItemCallback
			@$el
