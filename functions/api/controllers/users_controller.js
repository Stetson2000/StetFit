const Controller = require('./controller')
const userModel = require('../models/users_model')

const usersController = new Controller(userModel)
module.exports = usersController.router