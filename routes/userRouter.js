const express = require("express");
const controller = require("../controllers/controller")
const userModel = require("../models/user");

const userRouter = express.Router();




userRouter.post("/signup",  controller.createUser) 


userRouter.post("/login", controller.login)

module.exports = userRouter