const express = require("express");
const controller = require("../controllers/controller")
const middlewear = require("../middlewear/middlewear")
const cookieParser = require("cookie-parser");
const auth = middlewear.auth;

const userModel = require("../models/user");

const userRouter = express.Router();
userRouter.use(cookieParser())


userRouter.post("/signup", middlewear.validateCreateUser, controller.createUser) 


userRouter.post("/login",  controller.login)

userRouter.post("/customer", auth,  controller.createCustomer)



module.exports = userRouter