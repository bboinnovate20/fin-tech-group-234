const mongoose = require("mongoose");
require("dotenv").config();

const MONGODB_URL = process.env.MONGODB_URL;

function connectionToMongodb() {
  mongoose.connect(MONGODB_URL, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  });

  mongoose.connection.on("connected", () => {
    console.log("mongodb connection successful ");
  });

  mongoose.connection.on("error", (err) => {
    console.log(err);
    console.log("mongodb connection unsuccessful");
  });
}
module.exports = { connectionToMongodb };
