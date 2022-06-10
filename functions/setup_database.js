const db = require("../functions/api/database");

async function setupDatabase(req, res, next) {
  // To delete all the collections
  const collections = ["users", "meals", "exercises"];
  collections.forEach(async (collection) => await deleteCollection(collection));

  // Add documents to the todos collection
  addDocuments("exercises", [
    {
      title: "Bench Press",
      met: 6.0,
      imageUrl: "Bench-press.gif",
      categories: [1, 2],
    },
    {
      title: "Incline Dumbell Press",
      met: 5.0,
      imageUrl: "Dumbell-Incline-Press.gif",
      categories: [1, 6],
    },
    {
      title: "Tricep Skull Crushers",
      met: 3.5,
      imageUrl: "Tricep-skull-crushers.gif",
      categories: [2, 6],
    },
    {
      title: "Bicep Curl",
      met: 3.5,
      imageUrl: "Bicep-Curl.gif",
      categories: [2],
    },
    {
      title: "Arnold Shoulder Press",
      met: 5.0,
      imageUrl: "Shoulder-Arnold.gif",
      categories: [2, 6],
    },
    {
      title: "Lateral Raise",
      met: 3.5,
      imageUrl: "Lateral-Raise.gif",
      categories: [6],
    },
    {
      title: "Squats",
      met: 5.0,
      imageUrl: "Squat.gif",
      categories: [3, 4],
    },
    {
      title: "Abdominal Crunches",
      met: 3.5,
      imageUrl: "Abdominal-Crunches.gif",
      categories: [4],
    },
    {
      title: "Treadmill Running",
      met: 8.3,
      imageUrl: "Cardio.gif",
      categories: [5],
    },
  ]);
  addDocuments("users", [
    {
      fullname: "ali hamed",
      username: "ali123",
      password: "123",
      gender: "Male",
      age: 22,
      height: 160,
      weight: 60,
      activitylevel: 3,
      targetweight: 61,
      meals: [],
      favoritemeals: [],
    },
    {
      fullname: "samy ",
      username: "samy12",
      password: "123",
      gender: "Male",
      age: 18,
      height: 160,
      weight: 60,
      activitylevel: 3,
      targetweight: 61,
      meals: [],
      favoritemeals: [],
    },
  ]);

  addDocuments("meals", [
    {
      title: "EGGS",
      grams: 50,
      grade: "A",
      kcal: 78,
      protein: 6,
      carb: 0.6,
      fat: 5,
      imageUrl: "Eggs.jpg",
    },
    {
      title: "OREO",
      grams: 28.5,
      grade: "C",
      kcal: 140,
      protein: 1,
      carb: 20,
      fat: 6,
      imageUrl: "Oreo_28.5.jpg",
    },
    {
      title: "RICE",
      grams: 100,
      grade: "B",
      kcal: 130,
      protein: 2.7,
      carb: 28,
      fat: 0.3,
      imageUrl: "White_Rice.jpg",
    },
    {
      title: "TOAST",
      grams: 28.5,
      grade: "C",
      kcal: 313,
      protein: 13,
      carb: 56,
      fat: 4.3,
      imageUrl: "White_Bread.jpg",
    },
    {
      title: "SPAGHETTI",
      grams: 500,
      grade: "C",
      kcal: 790,
      protein: 30,
      carb: 56,
      fat: 4.3,
      imageUrl: "Spaghetti.jpg",
    },
    ,
    {
      title: "FETTUCCINE",
      grams: 454,
      grade: "B",
      kcal: 449.5,
      protein: 27.2,
      carb: 63.5,
      fat: 12.3,
      imageUrl: "Fettuccine.jpg",
    },
    {
      title: "CHICKEN BREAST",
      grams: 100,
      grade: "A",
      kcal: 165,
      protein: 31,
      carb: 0,
      fat: 3.6,
      imageUrl: "Chicken_Breast.jpeg",
    },
    {
      title: "GROUND BEEF",
      grams: 100,
      grade: "C",
      kcal: 332,
      protein: 14,
      carb: 0,
      fat: 30,
      imageUrl: "Ground_Beef.jpg",
    },
    {
      title: "LAMB",
      grams: 100,
      grade: "B",
      kcal: 294,
      protein: 25,
      carb: 0,
      fat: 21,
      imageUrl: "Lamb-Meat.jpg",
    },
    {
      title: "SNICKERS",
      grams: 47,
      grade: "C",
      kcal: 229,
      protein: 3.2,
      carb: 30,
      fat: 11,
      imageUrl: "Snickers.jpg",
    },
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
