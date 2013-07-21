define ['jquery', 'underscore', 'templates', 'backbone', 'app/models/itemModel', 'app/views/itemFormDetails', 'app/views/itemDataDetails'], ($, _, templates, Backbone, ItemModel, ItemFormDetails, ItemDataDetails) ->
	class ButtonsView extends Backbone.View
		el : 'div.bottomside'

		events : 
			'click #newItem'     : 'createNewItem',
			'click #saveItem'    : 'saveItem',
			'click #deleteItem'  : 'deleteItem'

		createItemFormDetails: (model)->
			@itemFormDetails = new ItemFormDetails model:model
			@itemFormDetails.render()
			@saveButton.text 'Save Item'
			0

		createNewItem: ->
			@createItemFormDetails new ItemModel()
			false

		saveItem: ->
			if @saveButton.text() is 'Update Item'
				@createItemFormDetails app.getItemDetailsModel()
				0
			else
				@saveButton.text 'Update Item'

		deleteItem: ->

		templatesCallback: (err, out)=>
			@$el.html(out)

		render : ->
			templates.render 'buttons', {}, @templatesCallback
			@saveButton = @$el.find '#saveItem'
			@$el
