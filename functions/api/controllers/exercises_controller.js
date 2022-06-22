const Controller = require('./controller')
const exercisesModel = require('../models/exercises_model')

const exercisesController = new Controller(exercisesModel)
module.exports = exercisesController.router
