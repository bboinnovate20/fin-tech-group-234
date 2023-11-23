const express = require("express");
const userRoute = require("./routes/userRouter");
const invoiceRoute = require("./routes/invoiceRouter");
const bodyParser = require("body-parser");
const userModel = require("./models/user");
const invoiceModel = require("./models/invoice");
const cookieParser = require("cookie-parser");

require("dotenv").config();
const { connectionToMongodb } = require("./db/connect");

const PORT = process.env.PORT || 5000;
const app = express();

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(cookieParser());

app.use("/users", userRoute);
// app.use("/invoice", invoiceRoute);

connectionToMongodb();

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});