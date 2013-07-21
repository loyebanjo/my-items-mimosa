define ['jquery', 'underscore', 'backbone', 'app/views/mainItemDetailsView'], ($, _, Backbone, MainItemDetailsView)->
	class ItemDataDetails extends MainItemDetailsView
		initialize: ->
			@htmlText ='itemDataDetails'
			@jsonModel = @model.toJSON()
			0
