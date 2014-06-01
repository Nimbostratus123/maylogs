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
	$('#text_area_pages').focus ->
		$(this).css 'height', '130px'
	$('#text_area_pages').focusout ->
		$(this).css 'height', '49px'
	
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