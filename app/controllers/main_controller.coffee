Spine = require 'spine'
$ = Spine.$

User = require 'models/user_model'

HeaderController = require 'controllers/header_controller'
LoginController = require 'controllers/login_controller'
StartController = require 'controllers/start_controller'
EmployeesController = require 'controllers/employees_controller'
#SettingsController = require 'controllers/settings_controller'


###
	MainController to of the app
	It instantiates the needed Controller for the main-view
	and handles the "main" routes to show or hides views
###
class MainController extends Spine.Controller

	className: 'main-view'

	constructor: ->
		super

		mainViewStack = new MainViewStack()
		header = new HeaderController()
		footer = require('views/footer')()
    
		###
			defining routes
		###
		@routes
			'/': ->
				# change height of MainViewStack's @elem
				$('div .main-view-content').height(400)
				mainViewStack.login.active()
				header.deactivate()
			'/employees': ->
				# change height of MainViewStack's @elem
				$('div .main-view-content').height(530)
				mainViewStack.employees.active()
				header.activate()
			'/start': ->
        #$('div .main-view-content').height(930)
        header.activate()
        mainViewStack.login.deactivate()
        mainViewStack.start.activate()

			#'/settings': ->
        # change height of MainViewStack's @elem
       # $('div .main-view-content').height(400)
       # mainViewStack.settings.active()
       # header.activate()

		@append header, mainViewStack, footer


module.exports = MainController

###
	MainViewStack for handling login- and employees view
	Note: All subviews for employees will be handled within EmployeesController
###
class MainViewStack extends Spine.Stack

	className: 'main-view-content stack'

	controllers:
		login: LoginController
		start: StartController
		employees: EmployeesController
    #settings: SettingsController

	default: 'login'