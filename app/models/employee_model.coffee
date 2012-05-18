Spine = require('spine')

class Employee extends Spine.Model
	@configure 'Employee', 'firstName', 'lastName', 'startDate', 'port'

module.exports = Employee