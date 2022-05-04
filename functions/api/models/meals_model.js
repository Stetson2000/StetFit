const Model = require('./model')

// Here, we are implementing the class with Singleton design pattern

class MealModel extends Model {
    constructor() {
        super('meals')
        if (this.instance) return this.instance
        MealModel.instance = this
    }
}

module.exports = new MealModel()