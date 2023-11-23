const userModel = require("../models/user");
const jwt = require("jsonwebtoken");


const createUser = async (req, res) => {
    let { firstName, lastName, businessName, email, phoneNumber, password} = req.body;
    console.log(req.body)
    email = email.toLowerCase();
    try {
      const existingUser = await userModel.findOne({
        email: email,
      });
  
      if (existingUser) {
        res.status(401).json({
          status: 'error',
          message: 'User Already Exist'
      })
      }
  
      const user = await userModel.create({
        firstName: firstName,
        lastName: lastName,
        businessName: businessName,
        email: email,
        phoneNumber: phoneNumber,
        password: password
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
      res.status(500).message("Internal Server Error");
    }
};
  
const login = async (req, res) => {
    let { email, password } = req.body;
    email = email.toLowerCase();
  
    try {
      const user = await userModel.findOne({
        email: email,
      });
      // console.log(user)
  
      if (!user) {
          res.status(401).json({
            status: 'error',
            message: 'Please Provide a Valid Email'
          }) 
      }
  
      const validPassword = await user.isValidPassword(password);
      // console.log(email);
  
      if (!validPassword) {
        res.status(401).json({
          status: 'error',
          message: 'Please Provide a Valid Password'
        }) 
      }
  
      const token = await jwt.sign({ user: user }, process.env.JWT_SECRET, {
        expiresIn: "1h",
      });
  
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
  
const invoiceData = async (req, res) => {
    
}
  
  module.exports = {
    createUser,
      login,
      invoiceData
  };