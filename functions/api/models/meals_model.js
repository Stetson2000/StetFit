const database = require("../database");

// Here, we are implementing the class with Singleton design pattern

class MealModel {
    constructor() {
        if (this.instance) return this.instance;
        MealModel.instance = this;
    }

    get() {
        return database.getList("meals");
    }

    getById(id) {
        return database.get("meals", id);
    }

    create(todo) {
        return database.create("meals", todo);
    }

    delete(id) {
        return database.delete("meals", id);
    }

    update(id, todo) {
        return database.set("meals", id, todo);
    }
}

module.exports = new MealModel();