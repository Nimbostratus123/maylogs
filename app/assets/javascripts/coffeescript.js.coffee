# Coffeescript for Maylogs

#$ ->
#  $('#log_in_button').click -> 
#    $('footer').toggle()

$ ->
	delete_on = false
	home_on = false
	links_on = true
	edit_on = false
	
	# The Dropdown Menu
	$('.dropdown').css 'opacity', '0'
	$('.dropdown').slideUp()
	$('.dropdown_trigger').hover ->
		$('.dropdown').css 'opacity', '1'
		$('.dropdown').slideDown('fast')
	$('nav').mouseleave -> 
		$('.dropdown').slideUp('fast')
		
	$('.flash').css 'left', '-1000px'
	
	$('.flash').animate {
		left: 0
	}, 500
	
	# Deleting Pages
	$('#delete_button').click ->
		if delete_on
			delete_on = false
			edit_on = false
			home_on = false
			$('.page_thumb').removeClass('delete_thumb')
			$('.page_thumb').addClass('normal_thumb')
			$('.page_link div').css 'z-index', '200'
		else
			delete_on = true
			edit_on = false
			home_on = false
			$('.page_thumb').removeClass('normal_thumb')
			$('.page_thumb').removeClass('edit_thumb')
			$('.page_thumb').removeClass('home_thumb')
			$('.page_thumb').addClass('delete_thumb')
			$('.page_link div').css 'z-index', '-2'
			
	# Ajax Requests
	$('.page_thumb').click ->
		if delete_on == true # Delete Page
			$(this).hide()
			$('.page_thumb').removeClass('delete_thumb')
			$('.page_thumb').addClass('normal_thumb')
			$('.page_link div').css 'z-index', '200'
			page_id = $(this).attr('id')
			page_id = page_id.replace /^page_/, ''
			$.get "/pages/#{page_id}/delete"
			$('body').addClass('ajax_completed')
			delete_on = false
		if home_on == true # Home Page
			$('.page_thumb').removeClass('home_thumb')
			$('.page_thumb').addClass('normal_thumb')
			$('.page_link div').css 'z-index', '200'
			$('.home_page_image').removeClass('home_page_image')
			$(this).children('.page_image').addClass('home_page_image')
			page_id = $(this).attr('id')
			page_id = page_id.replace /^page_/, ''
			$.get "/pages/#{page_id}/home_page"
			$('body').addClass('ajax_completed')
			home_on = false
		if edit_on == true
			$('.page_thumb').removeClass('edit_on')
			$('.page_thumb').addClass('normal_thumb')
			$('.page_link div').css 'z-index', '200' # Perhaps unecessary
			page_id = $(this).attr('id')
			page_id = page_id.replace /^page_/, ''
			window.location.href = "/pages/#{page_id}/edit"
			
	# Choosing a home page
	$('#home_button').click ->
		if home_on
			home_on = false
			delete_on = false
			edit_on = false
			$('.page_thumb').removeClass('home_thumb')
			$('.page_thumb').addClass('normal_thumb')
			$('.page_link div').css 'z-index', '200'
		else
			home_on = true
			delete_on = false
			edit_on = false
			$('.page_thumb').removeClass('normal_thumb')
			$('.page_thumb').removeClass('edit_thumb')
			$('.page_thumb').removeClass('delete_thumb')
			$('.page_thumb').addClass('home_thumb')
			$('.page_link div').css 'z-index', '-2'
			
		
	$('#edit_button').click ->
		if edit_on
			home_on = false
			delete_on = false
			edit_on = false
			$('.page_thumb').removeClass('edit_thumb')
			$('.page_thumb').addClass('normal_thumb')
			$('.page_link div').css 'z-index', '200'
		else
			home_on = false
			delete_on = false
			edit_on = true
			$('.page_thumb').removeClass('normal_thumb')
			$('.page_thumb').removeClass('home)thumb')
			$('.page_thumb').removeClass('delete_thumb')
			$('.page_thumb').addClass('edit_thumb')
			$('.page_link div').css 'z-index', '-2'
			

			
	# Page Titles
	$('.page_thumb').parent().children('.page_thumb').children('span').map ->
		title = $(this).text()
		if title.length > 19
			over = true
		title = title.substring(0,19) + '...' if over
		$(this).text title
	