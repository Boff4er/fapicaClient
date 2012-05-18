
Spine = require 'spine'
$ = Spine.$

class StartController extends Spine.Controller

  className: 'start'

  constructor: ->
    super
    
    @active @render

  render: ->
    @html require 'views/start_view'

module.exports = StartController
