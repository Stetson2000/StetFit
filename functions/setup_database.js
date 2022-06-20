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
      description:
        "The bench press is a compound exercise that targets the muscles of the upper body. It involves lying on a bench and pressing weight upward using either a barbell or a pair of dumbbells. During a bench press, you lower the weight down to chest level and then press upwards while extending your arms. ",
    },
    {
      title: "Incline Dumbell Press",
      met: 5.0,
      imageUrl: "Dumbell-Incline-Press.gif",
      categories: [1, 6],
      description:
       "The purpose of the incline press is to focus more of the work on the upper pecs. The main benefit in performing incline presses is to develop the upper portion of the pectoral muscles. When the bench is set at an incline (15 to 30 degrees), you activate your shoulders more since it's comparable to a shoulder press.",
    },
    {
      title: "Tricep Skull Crushers",
      met: 3.5,
      imageUrl: "Tricep-skull-crushers.gif",
      categories: [2, 6],
      description:
        "A skull crusher, also known as a lying triceps extension, is an isolation exercise focused on your triceps muscles. Skull crushers are performed by lying on your back on a flat bench and lifting dumbbells from behind your head to full extension above you. ",
    },
    {
      title: "Bicep Curl",
      met: 3.5,
      imageUrl: "Bicep-Curl.gif",
      categories: [2],
      description:
        'A biceps curl usually starts with the arm in a fully extended position, holding a weight with a supinated (palms facing up) grip. A full repetition consists of bending or "curling" the elbow until it is fully flexed, then slowly lowering the weight to the starting position. ',
    },
    {
      title: "Arnold Shoulder Press",
      met: 5.0,
      imageUrl: "Shoulder-Arnold.gif",
      categories: [2, 6],
      description:
        " What Is the Arnold Press? Named after Arnold Schwarzenegger, the Arnold press is a variation on the conventional shoulder press. The Arnold presses is defined by a wrist rotation movement that ends when your palms face forward at the top of the press. ",
    },
    {
      title: "Lateral Raise",
      met: 3.5,
      imageUrl: "Lateral-Raise.gif",
      categories: [6],
      description:
        "A lateral raise is a strength training shoulder exercise characterized by lifting a pair of dumbbells away from your body in an external rotation. Lateral raises work the trapezius muscle in your upper back as well as the deltoid muscle group in your shoulders—particularly the anterior and lateral deltoids. ",
    },
    {
      title: "Squats",
      met: 5.0,
      imageUrl: "Squat.gif",
      categories: [3, 4],
      description:
        "A squat is a strength exercise in which the trainee lowers their hips from a standing position and then stands back up. During the descent of a squat, the hip and knee joints flex while the ankle joint dorsiflexes; conversely the hip and knee joints extend and the ankle joint plantarflexes when standing up. ",
    },
    {
      title: "Abdominal Crunches",
      met: 3.5,
      imageUrl: "Abdominal-Crunches.gif",
      categories: [4],
      description:
        "An abdominal crunch is an exercise to strengthen the abdomen by contracting it to flex your spine and pull your torso off the floor. To perform an abdominal crunch lie flat on the floor with your knees bent so that the soles of your feet are flat on the floor.",
    },
    {
      title: "Treadmill Running",
      met: 8.3,
      imageUrl: "Cardio.gif",
      categories: [5],
      description:
        "Rather than the user powering a mill, the device provides a moving platform with a wide conveyor belt driven by an electric motor or a flywheel. The belt moves to the rear, requiring the user to walk or run at a speed matching the belt. The rate at which the belt moves is the rate of walking or running",
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
      exercises:[]
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
      exercises:[]

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
