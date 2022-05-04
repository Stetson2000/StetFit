const functions = require("firebase-functions");
const express = require("express");
const app = express();
const userRouter = require("./api/controllers/users_controller");
const mealRouter = require("./api/controllers/meals_controller");

app.use(express.json());
app.use("/users", userRouter);
app.use("/meals", mealRouter);

exports.api = functions.https.onRequest(app);

// To handle "Function Timeout" exception
exports.functionsTimeOut = functions.runWith({
    timeoutSeconds: 540,
});

exports.setupDatabase = functions.https.onRequest(require('./setup_database'));