define ['jquery', 'underscore', 'backbone', 'app/views/mainItemDetailsView'], ($, _, Backbone, MainItemDetailsView)->
	class ItemFormDetails extends MainItemDetailsView
		initialize: ->
			@htmlText ='itemFormDetails'
			@jsonModel = @model.toJSON()
			0