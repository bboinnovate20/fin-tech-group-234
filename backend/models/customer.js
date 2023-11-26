const mongoose = require("mongoose");
const shortid = require("shortid");
const schema = mongoose.Schema;
const ObjectId = schema.ObjectId;

const customerSchema = new schema({
  _id: {
    type: String,
    default: shortid.generate,
  },
  firstName: { type: String, required: true },
  lastName: { type: String, required: true },
  email: {
    type: String,
    required: true,
    unique: true,
  },
  phoneNumber: { type: String, required: true },
  address: { type: String, required: true },
  image: { type: String },
  ownerId: { type: String },
});

const customerModel = mongoose.model("customer", customerSchema);

module.exports = customerModel;
