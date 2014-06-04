# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ -> 
	
	# Animating Color Beam
	#$('#drag').draggable()
	#offset = $(this).offset().left
	#offset0 = $('#current_page_link').offset().left
	temp_width = $('#current_page_link').width() + 38
	proper_left = $('#current_page_link').offset().left - $(window).width() * 6 / 100
	proper_top = $('#current_page_link').offset().top - 90
	
	$('#color_beam').css 'top', proper_top
	$('#color_beam').css 'width', temp_width
	$('#color_beam').css 'left', proper_left - 2
	$('#current_page_link').children('a').css 'color', 'black'
	$('#text_field_pages').css 'opacity', 0
	$('.edit_text_area').css 'height', '130px'
	
	
	
	# Flash Animation
	
	$('.flash').css 'left', '-1000px'
	
	$('.flash').animate {
		left: 0
	}, 1500, 'easeOutElastic'
	
	
	# Dynamic New Post Form
	
	$('#text_area_pages').focus ->
		$(this).animate {
				height: 130
			}, 200
		$('#text_field_pages').animate {
			opacity: 1
		}
		
	$('#text_area_pages').focusout ->
		$(this).animate {
				height: 49
			}, 200, 'easeInExpo'

	
	# Color Beam
	
	$('nav li').mouseenter ->
		temp_width = $(this).width() + 38
		proper_left = $(this).offset().left - $(window).width() * 6 / 100
		offsetx = $(this).offset().left
		offsety = $(this).offset().top
		$(this).parent().children('li').children('a').css 'color', 'white'
		$(this).children('a').css 'color', 'black'
		$('#color_beam').animate {
			width: temp_width
			left: proper_left - 2
			top: offsety - 90
			}, 700, 'easeOutElastic'#, ->  #use that for callback
		$('#color_beam').clearQueue()
			
	$('header').mouseleave ->
		proper_left = $('#current_page_link').offset().left - $(window).width() * 6 / 100
		$(this).children('nav').children('li').children('a').css "color", 'white'
		$('#current_page_link').children('a').css "color", 'black'
		$('#color_beam').animate {
			width: $('#current_page_link').width() + 38
			left: proper_left - 2
			top: $('#current_page_link').offset().top - 90
			}, 700, 'easeOutElastic', ->  #use that for callback
		$('#color_beam').clearQueue()
		
		
		
	
	# Deleting Posts
	
	$('.delete_post_link').click ->
		certainty = confirm 'Are you sure?'
		if certainty
			post_id = $(this).attr('id')
			post_id = post_id.replace /delete_post_/, ''
			$(this).parent().parent().parent().parent().hide()
			$('.flash').css 'opacity', '0'
			$.get "/pages/delete_post?post_id=#{post_id}"
			
			
	# Editing Posts
	
	$('.edit_post_link').click ->
		$(this).parents('.post').children('p').css 'display', 'none'
		$(this).parents('h2').children('span').css 'display', 'none'
		$(this).parents('.post').children('form').css 'display', 'block'
		
	$('.edit_submit_button').click ->
		this_var = $(this)
		id_var = $(this).siblings('.edit_hidden_field').val()
		title_var = $(this).siblings('.edit_text_field').val()
		content_var = $(this).siblings('.edit_text_area').val()
		content_var = content_var.replace /[\r\n]/g, ' ()NEWLINE() '
		$.get "/pages/edit_post?id=#{id_var}&title=#{title_var}&content=#{content_var}", (data) ->
			this_var.parents('.post').before(data)
			this_var.parents('.post').hide()