# Coffeescript for Maylogs

#$ ->
#  $('#log_in_button').click -> 
#    $('footer').toggle()

$ ->
	delete_on = false
	home_on = false
	links_on = true
	
	# The Dropdown Menu
	$('.dropdown').css 'opacity', '0'
	$('.dropdown').slideUp()
	$('.dropdown_trigger').hover ->
		$('.dropdown').css 'opacity', '1'
		$('.dropdown').slideDown('fast')
	$('nav').mouseleave -> 
		$('.dropdown').slideUp('fast')
	
	# Deleting Pages
	$('#delete_button').click ->
		if delete_on
			delete_on = false
			home_on = false
			$('.ex_line').css 'box-shadow', 'none'
			$('.page_image').css 'background', '#fff'
			$('.ex_line').css 'background', '#9F3'
			$('.page_link div').css 'z-index', '200'
		else
			delete_on = true
			home_on = false
			$('.ex_line').css 'box-shadow', 'none'
			$('.page_image').css 'background', '#aa0000'
			$('.ex_line').css 'background', 'black'
			$('.page_link div').css 'z-index', '-2'
			
	# Ajax Requests
	$('.page_thumb').click ->
		if delete_on == true # Delete Page
			$(this).hide()
			$('.page_link div').css 'z-index', '200'
			$('.page_image').css 'background', '#fff'
			page_id = $(this).attr('id')
			page_id = page_id.replace /^page_/, ''
			$.get "/pages/#{page_id}/delete"
			delete_on = false
		if home_on == true # Home Page
			$('.page_link div').css 'z-index', '200'
			$('.ex_line').css 'box-shadow', 'none'
			$('.page_image').css 'background', '#fff'
			page_id = $(this).attr('id')
			page_id = page_id.replace /^page_/, ''
			$.get "/pages/#{page_id}/home_page"
			home_on = false
			$('.page_image').css 'background', '#fff'
			$('.ex_line').css 'background', '#9F3'
			
	# Choosing a home page
	$('#home_button').click ->
		if home_on
			home_on = false
			delete_on = false
			$('.page_image').css 'background', '#fff'
			$('.ex_line').css 'background', '#9F3'
			$('.ex_line').css 'box-shadow', 'none'
			$('.page_link div').css 'z-index', '200'
		else
			home_on = true
			delete_on = false
			$('.page_image').css 'background', '#00aaaa'
			$('.ex_line').css 'background', 'white'
			$('.ex_line').css 'box-shadow', '0px 0px 3px #333'
			$('.page_link div').css 'z-index', '-2'

			
	# Page Titles
	$('.page_thumb').parent().children('.page_thumb').children('span').map ->
		title = $(this).text()
		if title.length > 19
			over = true
		title = title.substring(0,19) + '...' if over
		$(this).text title
	