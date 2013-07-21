
require.config 
	baseUrl : '/javascripts'
	,
	shim : 
		backbone:
			deps: ['underscore', 'jquery'],
			exports: 'Backbone'
		underscore:
			exports: '_'
	,
	paths:
		jquery: 'vendor/jquery',
		underscore: 'vendor/underscore',
		backbone: 'vendor/backbone',
		templates: 'templates'

require ['jquery','underscore','templates','backbone','app/models/itemModel','app/collections/itemCollection','app/views/buttonsView','app/views/itemNameListItem','app/views/itemTypeListItem','app/views/itemNameList','app/views/itemTypeList','app/views/mainItemDetailsView','app/views/itemDataDetails','app/views/itemFormDetails'], ($, _, templates, Backbone, ItemModel, ItemCollection, ButtonsView, ItemNameListItem, ItemTypeListItem, ItemNameList, ItemTypeList, MainItemDetailsView, ItemDataDetails, ItemFormDetails)->
	window.app = (->
		_detailsModel = null
		_itemsCollection = null
		_router = null

		init = ->
			class Router extends Backbone.Router
				routes : 
					'items/:id' : 'showItem',
					'item/delete' : 'deleteItem'
				showItem : (id)->
					item = _itemsCollection.get(id)
					item.fetch
						success : (model, response)->
							itemDataDetails = new ItemDataDetails model:model
							itemDataDetail.render()
							_detailsModel = item
							window.history.start()
							0
						,
						error : (model, response)->
							alert 'Server was not able to return the model with id = ' + id
							0
				deleteItem : ->
					$('div.rightside').find('div.property-value').remove();
					$('div.rightside').find('div.property-description').remove();

					if not _itemsCollection.hasQueryOccurred 
						_itemsCollection.fetch reset : true

					window.history.back();

					0

				_router = new Router()
				Backbone.history.start()
				_itemsCollection = new ItemCollection();
				new ButtonsView().render()

		{
			initialize : -> 
				init()
			setItemDetailsModel : ( model )-> 
				_detailsModel = model
			getItemDetailsModel : -> 
				_detailsModel
			getItemsCollection : -> 
				_itemsCollection
			getRouter : -> 
				_router
			makeAjaxCall: (method, url, success, error)->
				$.ajax
					type:method
					url:url
					jsonpCallback:'callback'
					async:false
					contentType:'application/json'
					dataType:'jsonp'
					success: success
					error: error
				0
		}
	)()

	window.app.initialize()
