const userModel = require("../models/user");
const customerModel = require("../models/customer")
const jwt = require("jsonwebtoken");


const createUser = async (req, res, next) => {
    let { firstName, lastName, businessName, email, phoneNumber, password} = req.body;
    email = email.toLowerCase();
    try {
      const existingUser = await userModel.findOne({
        email: email,
      });
  
      if (existingUser) {
        return next(
        res.status(401).json({
          status: 'error',
          message: 'User Already Exist'
      }))
      }
  
      const user = await userModel.create({
        firstName: firstName,
        lastName: lastName,
        businessName: businessName,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
        role: 'businessOwner'
      });

      const JWT_SECRET = process.env.JWT_SECRET;
      const token = await jwt.sign(
        { fullName: user.fullName, email: user.email, _id: user._id },
        JWT_SECRET
      );

      res.status(201).json({
        status: 'success',
        message: 'Signup Was Successful',
        user: user,
        token
    })
    } catch (error) {
      console.log(error);
      res.status(500).json({message: "Internal Server Error"});
    }
};
  
const login = async (req, res, next) => {
    let { email, password } = req.body;
    email = email.toLowerCase();
  
    try {
      const user = await userModel.findOne({
        email: email,
      });
  
      if (!user) {
        return next(
          res.status(401).json({
            status: 'error',
            message: 'Please Provide a Valid Email'
          }) )
      }
  
      const validPassword = await user.isValidPassword(password);
      // console.log(email);
  
      if (!validPassword) {
        return next(
        res.status(401).json({
          status: 'error',
          message: 'Please Provide a Valid Password'
        }) )
      }
  
      const token = await jwt.sign({ user: user }, process.env.JWT_SECRET);
  
      res.cookie("token", token, { httpOnly: true }, { maxAge: 60 * 60 * 1000 });
      res.status(200).json({
        status: "success",
        user: user,
        token
      })
    } catch (error) {
      console.log(error); 
      res.status(500).send("Internal Server Error");
    }
};

const createCustomer = async (req, res, next) => {
  let { firstName, lastName, businessName, email, phoneNumber, address } = req.body;

  email = email.toLowerCase();
  try {
    const existingUser = await customerModel.findOne({
      email: email,
    });

    if (existingUser) {
      return next(
      res.status(401).json({
        status: 'error',
        message: 'Customer Already Exist'
    }))
    }

    const user = await customerModel.create({
      firstName: firstName,
      lastName: lastName,
      businessName: businessName,
      email: email,
      phoneNumber: phoneNumber,
      address: address,
      ownerId: req.user.userId
    });

    res.status(201).json({
      status: 'success',
      message: 'Customer Created Successful',
      customer: user
  })
  } catch (error) {
    console.log(error);
    res.status(500).json({message: "Internal Server Error"});
  }
};

const getCustomer = async (req,res,next) => {
  
}
  
const invoiceData = async (req, res) => {
    
}
  
  module.exports = {
    createUser,
      login,
      createCustomer,
      invoiceData
  };