const express = require("express");
const controller = require("../controllers/controller")
const middlewear = require("../middlewear/middlewear")
const cookieParser = require("cookie-parser");
const auth = middlewear.auth;

const userModel = require("../models/user");

const userRouter = express.Router();
userRouter.use(cookieParser())


userRouter.post("/api/signup", middlewear.validateCreateUser, controller.createUser) 


userRouter.post("/api/login",  controller.login)

userRouter.post("/api/customer", auth,  controller.createCustomer)
userRouter.get("/api/customer", auth,  controller.getCustomer)

userRouter.post("/api/invoice", auth, controller.createInvoice)
userRouter.get("/api/invoice", auth, controller.verifyInvoice)

module.exports = userRouter