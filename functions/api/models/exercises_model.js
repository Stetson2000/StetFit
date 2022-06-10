const Model = require('./model')

// Here, we are implementing the class with Singleton design pattern

class ExercisesModel extends Model {
    constructor() {
        super('exercises')
        if (this.instance) return this.instance
        ExercisesModel.instance = this
    }
}

module.exports = new ExercisesModel()