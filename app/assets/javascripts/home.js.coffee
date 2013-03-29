# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->

	$("#search_button").click ->
		$(this).hide()
		$(".search").fadeIn()
		$(".search").focus()

	# Function 'blur' is called when focus has been lost
	$(".search").blur ->
		$(this).fadeOut('fast', ->
			$("#search_button").show())

		
