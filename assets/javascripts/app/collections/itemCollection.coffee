define ['jquery', 'underscore', 'backbone', 'app/models/itemModel', 'app/views/itemNameList', 'app/views/itemTypeList'], ($, _, Backbone, ItemModel, ItemNameList, ItemListType)->
	class ItemCollection extends Backbone.Collection
		model: ItemModel

		url: 'http://localhost/php-server/php/items.php'

		itemCollectionCallback: (item, index, list)=>
			model = new ItemModel item
			@models.push model
			0

		successInitializeCallback: (response,status)=>
			if status
				@models = []
				@response = response
				_.each response, @itemCollectionCallback, @
				@itemNameList = new ItemNameList model:@

			$('div.leftside').append @itemNameList.render()
			@setItemTypeList();
			0

		errorInitializeCallback: (response)=>
			alert "There has been a problem retrieveing data from the server"
			0

		initialize: ->
			@modelTypeCollection				
			app.makeAjaxCall 'GET', @url, @successInitializeCallback, @errorInitializeCallback
			0

		resetItemNameList: (textValue)->
			if textValue isnt 'All'
				selectedItems = @where item_type:textValue
				@hasQueryOccurred = true
				@queriedModels = selectedItems
			else 
				@hasQueryOccurred = false
				@queriedModels = null

			@itemNameList.model = @
			@itemNameList.render()
			0

		itemTypeCollectionCallback: (model)=>
			type = model.toJSON().item_type
			if not _.contains @types, type
				@types.push type
				@modelTypeCollection.add [ new ItemModel item_type:type ]
				stop = null
			0

		setItemTypeList: ->
			if @modelTypeCollection
				@modelTypeCollection.reset()

			@types = []
			@modelTypeCollection = new Backbone.Collection()
			@modelTypeCollection.add [ new ItemModel(item_type:'All') ]

			_.each @models, @itemTypeCollectionCallback, @

			if not @itemTypeList
				@itemTypeList = new ItemListType model:@modelTypeCollection
				$('div.leftside').append @itemTypeList.render()
			else 
				@itemTypeList.model = @modelTypeCollection
				@itemTypeList.render()

			if @types.length > 7 
				@types = null
			0

		getModelTypeCollection: ->
			@modelTypeCollection
