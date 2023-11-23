const express = require("express");
const controller = require("../controllers/controller")
const middlewear = require("../middlewear/middlewear")

const userModel = require("../models/user");

const userRouter = express.Router();
userRouter.use(cookieParser())


userRouter.post("/signup", middlewear.validateCreateUser, controller.createUser) 


userRouter.post("/login",  controller.login)



module.exports = userRouter