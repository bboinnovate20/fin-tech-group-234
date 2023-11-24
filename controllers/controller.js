const userModel = require("../models/user");
const customerModel = require("../models/customer");
const invoiceModel = require('../models/invoice');
const middlewear = require('../middlewear/middlewear')
const jwt = require("jsonwebtoken");
const shortid = require("shortid");

const createUser = async (req, res, next) => {
  let { firstName, lastName, businessName, email, phoneNumber, password } =
    req.body;
  email = email.toLowerCase();
  try {
    const existingUser = await userModel.findOne({
      email: email,
    });

    if (existingUser) {
      return next(
        res.status(401).json({
          status: "error",
          message: "User Already Exist",
        })
      );
    }

    const user = await userModel.create({
      firstName: firstName,
      lastName: lastName,
      businessName: businessName,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
      role: "businessOwner",
    });

    const JWT_SECRET = process.env.JWT_SECRET;
    const token = await jwt.sign(
      { fullName: user.fullName, email: user.email, _id: user._id },
      JWT_SECRET
    );

    res.status(201).json({
      status: "success",
      message: "Signup Was Successful",
      user: user,
      token,
    });
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Internal Server Error" });
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
          status: "error",
          message: "Please Provide a Valid Email",
        })
      );
    }

    const validPassword = await user.isValidPassword(password);
    // console.log(email);

    if (!validPassword) {
      return next(
        res.status(401).json({
          status: "error",
          message: "Please Provide a Valid Password",
        })
      );
    }

    const token = await jwt.sign({ user: user }, process.env.JWT_SECRET);

    res.cookie("token", token, { httpOnly: true }, { maxAge: 60 * 60 * 1000 });
    res.status(200).json({
      status: "success",
      user: user,
      token,
    });
  } catch (error) {
    console.log(error);
    res.status(500).send("Internal Server Error");
  }
};

const createCustomer = async (req, res, next) => {
  let { firstName, lastName, businessName, email, phoneNumber, address } =
    req.body;

  email = email.toLowerCase();
  try {
    const existingUser = await customerModel.findOne({
      email: email,
    });

    if (existingUser) {
      return next(
        res.status(401).json({
          status: "error",
          message: "Customer Already Exist",
        })
      );
    }

    const user = await customerModel.create({
      firstName: firstName,
      lastName: lastName,
      businessName: businessName,
      email: email,
      phoneNumber: phoneNumber,
      address: address,
      ownerId: req.user.userId,
    });

    res.status(201).json({
      status: "success",
      message: "Customer Created Successful",
      customer: user,
    });
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Internal Server Error" });
  }
};

const getCustomer = async (req, res, next) => {
  // const { page, limit, dateFrom, dateTo, ...rest } = req.query;
  const query = {
    ownerId: req.user.userId,
  };
  if (req.query._id) {
    const customer = await customerModel.findOne({
      _id: req.query,
      ownerId: req.user.userId,
    });

    if (!customer) {
      return next(
        res.status(401).json({
          status: "error",
          message:
            "We are currently unable to get this customer details. Please try again.",
        })
      );
    }

    res.status(200).json({
      status: "success",
      customer: customer,
    });
    return next()
  }

  let customers = await customerModel.find(query);
  res.status(200).json({
    status: "success",
    customers: customers,
  });
};

const createInvoice = async (req, res, next) => {
  let { productName, amount, quantity, description } = req.body;
  try {
    if (req.query._id) {
      let customer = await customerModel.findOne({
        _id: req.query,
        ownerId: req.user.userId,
      });
      if (!customer) {
        return next(
          res.status(401).json({
            status: "error",
            message:
              "We are currently unable to get this customer details. Please try again.",
          })
        );
      }
      const customerName = customer.firstName;
      const customerEmail = customer.email;
      const customerAddress = customer.address;
      const customerPhoneNumber = customer.address;
      const customerId = shortid.generate;

    middlewear.initiatePayment(amount, customerEmail, customerId).then(async(paymentData) => {
      let url = await paymentData.authorization_url;
      let reference = await paymentData.reference;
      // Redirect the user to paymentData.authorization_url to complete the payment
      ////////////////////////////////////////////////////////////////////////////
      const invoiceDetails = {
        productName: productName,
        amount: amount,
        quantity: quantity,
        description: description,
        customerName: customerName,
        customerEmail:  customerEmail,
        customerAddress:  customerAddress,
        customerPhoneNumber:  customerPhoneNumber,
        ownerId: req.user.userId,
        url:url,
        reference: reference
      }
      const invoice = await invoiceModel.create(invoiceDetails)
      
    res.status(201).json({
      status: "success",
      message: "Customer Invoice Successfully Created",
      invoice: invoice,
    });
      ///////////////////////////////////////////////////////////////////////////////
    })
    .catch((error) => {
      console.log(error)
    });
  }
  } catch(error) {
    console.log(error);
    res.status(500).json({ message: "Internal Server Error" });
  }
};

const verifyInvoice = async (req, res, next) => {
  try{
    const query = {
      ownerId: req.user.userId,
    };
    if (req.query._id) { 
      let invoice = await invoiceModel.findOne({
        _id: req.query._id,
        ownerId: req.user.userId,
      });
      if (!invoice) {
        return next(
          res.status(401).json({
            status: "error",
            message:
              "We are currently unable to get this invoice details. Please try again.",
          })
        );
      }

      res.status(200).json({
        status: "success",
        invoice: invoice,
      });
      return next()

    }

    let User = await userModel.findOne({
      _id: req.user.userId
    });
    let verificationData;
    let invoices = await invoiceModel.find(query);
    const filteredResponses = invoices.map(({_id,reference,status,ownerId,amount})=> ({
      _id,
      reference,
      status,
      ownerId,
      amount
    }))
    for (let response of filteredResponses) {

     verificationData = await middlewear.verifyPayment(response.reference)
     Amount = response.amount + User.balance;
     if (verificationData.status == "success") {
        await invoiceModel.findOneAndUpdate(
            { _id: response._id },
            { status: "paid", paid: true },
            { upsert: true, omitUndefined: true }
        );
        if (response.status == 'overDue') {
          await userModel.findOneAndUpdate(
            { _id: response.ownerId },
            { balance: Amount },
            { upsert: true, omitUndefined: true }
          );
        }
      }
     //////////////////////////////////////////////////////////////////
    }

    res.status(200).json({
      status: "success",
      invoices: invoices,
    });

  } catch(error) {
    console.log(error);
    res.status(500).json({ message: "Internal Server Error" });
  }
}

module.exports = {
  createUser,
  login,
  createCustomer,
  getCustomer,
  createInvoice,
  verifyInvoice
};
