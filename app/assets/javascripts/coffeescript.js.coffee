# Coffeescript for Maylogs

#$ ->
#  $('#log_in_button').click -> 
#    $('footer').toggle()

$ ->
	delete_on = false
	$('.dropdown').css 'opacity', '0'
	$('.dropdown').slideUp()
	$('.dropdown_trigger').hover ->
		$('.dropdown').css 'opacity', '1'
		$('.dropdown').slideDown('fast')
	$('nav').mouseleave -> 
		$('.dropdown').slideUp('fast')
		
	
	$('#delete_button').click ->
		if delete_on
			delete_on = false
			$('.page_image').css 'background', '#fff'
			$('.ex_line').css 'background', '#9F3'
		else
			delete_on = true
			$('.page_image').css 'background', '#aa0000'
			$('.ex_line').css 'background', 'black'
		
		
	$('.page_thumb').click ->
		if delete_on == true
			$(this).hide()
			$('.page_image').css 'background', '#fff'
			page_id = $(this).attr('id')
			page_id = page_id.replace /^page_/, ''
			$.get "/pages/#{page_id}/delete"
			delete_on = false