const express = require("express");
const userRoute = require("./routes/userRouter");
const invoiceRoute = require("./routes/invoiceRouter");
const bodyParser = require('body-parser')
const userModel = require("./models/user");
const invoiceModel = require("./models/invoice");
require("dotenv").config();
const { connectionToMongodb } = require("./db/connect");


const PORT = process.env.PORT || 5000;
const app = express();


connectionToMongodb();


app.use(express.urlencoded({ extended: false }));
app.use(express.json());





app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
  });
  