define ['jquery', 'underscore', 'backbone', 'templates'], ($, _, Backbone, templates)->
	class MainItemDetailsView extends Backbone.View
		el: 'div.rightside'

		detailsTemplateCallback: (err, out)=>
			@$el.html(out)
			0

		render: ->
			templates.render @htmlText, { item_name:@jsonModel.item_name, item_type:@jsonModel.item_type, item_description:@jsonModel.item_description }, @detailsTemplateCallback
			if @htmlText is 'itemFormDetails'
				el = @$el.find '#item_name_text';
				el.focus()
			0