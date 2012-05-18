Spine = require('spine')
$ = Spine.$

User = require 'models/user_model'

###
	Controller for the header view
###
class HeaderController extends Spine.Controller

	# overridden
	tag:
		'header'

	events:
		'click p.main-button': 'triggerLogout'
		'click p.settings': 'triggerSettings'

	constructor: ->
		super
		@render()

	render: ->
		@html require('views/header_view')()


	activate:()->
		# we do only have one user object after login
		# grab it and show its username
		user = User.first()
		$('#greetings').text('Hello ' + user.username + "!")
		# animate header to show
		$('header div').css({display: 'block'})

	deactivate:->
		# empty greetings text
		$('#greetings').text('')
		# animate header to hide
		$('header div').css({display: 'none'})

	triggerLogout: ->
		@navigate '/logout'
		
	triggerSettings: ->
	  @navigate '/employees'

    
module.exports = HeaderController