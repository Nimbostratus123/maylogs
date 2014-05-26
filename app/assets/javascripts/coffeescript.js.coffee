# Coffeescript for Maylogs

#$ ->
#  $('#log_in_button').click -> 
#    $('footer').toggle()


$ ->
	$('.dropdown').css 'opacity', '0'
	$('.dropdown').slideUp()
	$('.dropdown_trigger').hover ->
		$('.dropdown').css 'opacity', '1'
		$('.dropdown').slideDown('normal')
	$('nav').mouseleave -> 
		$('.dropdown').slideUp('normal')