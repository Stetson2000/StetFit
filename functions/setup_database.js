const db = require("../functions/api/database");

async function setupDatabase(req, res, next) {
    // To delete all the collections
    const collections = ["users", "meals"];
    collections.forEach(async(collection) => await deleteCollection(collection));

    // Add documents to the todos collection

    addDocuments("users", [{
            fullname: "ali hamed",
            username: "ali123",
            password: "123",
            gender: "Female",
            age: 22,
            height: 160,
            weight: 60,
            activitylevel: 3,
            targetweight: 61,
            meals: [2, 1, 2, 2, 2, 2],
        },
        {
            fullname: "samy ",
            username: "samy12",
            password: "123",
            gender: "Female",
            age: 18,
            height: 160,
            weight: 60,
            activitylevel: 3,
            targetweight: 61,
            meals: [2, 1],
        },
    ]);

    addDocuments("meals", [{

            title: "eggs",
            grade: "A",
            kcal: 120,
            protein: 6,
            carb: 2,
            fat: 1
        }, {
            title: "rice",
            grade: "B",
            kcal: 200,
            protein: 2,
            carb: 7,
            fat: 1
        }


    ]);

    res.send("Setting Up Database.... Done ");
}

async function deleteCollection(collection) {
    const cref = db.firestore.collection(collection);
    const docs = await cref.listDocuments();
    docs.forEach((doc) => doc.delete());
}

function addDocuments(collection, docs) {
    docs.forEach((doc) => db.create(collection, doc));
}

module.exports = setupDatabase;