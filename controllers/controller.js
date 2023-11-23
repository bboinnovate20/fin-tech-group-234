const userModel = require("../models/user");
const jwt = require("jsonwebtoken");


const createUser = async (req, res) => {
    const { fullName, email, password, country } = req.body;
    try {
      const existingUser = await userModel.findOne({
        email: email,
      });
  
      if (existingUser) {
        return res.redirect("/existinguser");
      }
  
      const user = await userModel.create({
        fullName: fullName,
        email: email,
        password: password,
        country: country
      });
  
      const JWT_SECRET = process.env.JWT_SECRET;
      const token = await jwt.sign(
        { fullName: user.fullName, email: user.email, _id: user._id },
        JWT_SECRET
      );
      res.status(200)
    } catch (error) {
      console.log(error);
      res.status(500).message("Internal Server Error");
    }
};
  

const login = async (req, res) => {
    const { email, password } = req.body;
  
    try {
      const user = await userModel.findOne({
        email: email,
      });
      // console.log(user)
  
      if (!user) {
        return  res.status(404).redirect("/signup");
  
      }
  
      const validPassword = await user.isValidPassword(password);
      console.log(email);
  
      if (!validPassword) {
         return res.status(302).redirect("/unknown");
  
      }
  
      const token = await jwt.sign({ user: user }, process.env.JWT_SECRET, {
        expiresIn: "1h",
      });
  
      res.cookie("token", token, { httpOnly: true }, { maxAge: 60 * 60 * 1000 });
      res.status(200)
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
  