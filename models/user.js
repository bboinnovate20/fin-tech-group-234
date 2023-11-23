const mongoose = require("mongoose");
const shortid = require("shortid");
const bcrypt = require("bcrypt");

const schema = mongoose.Schema;
const ObjectId = schema.ObjectId;

const userSchema = new schema({
  _id: {
    type: String,
    default: shortid.generate,
  },
  firstName: { type: String, required: true },
  lastName: { type: String, required: true },
  businessName: { type: String, required: true },
  email: {
    type: String,
    required: true,
    unique: true,
  },
  phoneNumber: { type: String, required: true },
  password: { type: String, required: true },
  image: { type: String },
  balance: { type: String},
});

//before save

userSchema.pre("save", async function (next) {
  const user = this;
  const hash = await bcrypt.hash(user.password, 10);

  this.password = hash;
  next();
});

userSchema.methods.isValidPassword = async function (password) {
  const user = this;
  const compare = await bcrypt.compare(password, user.password);

  return compare;
};

const userModel = mongoose.model("users", userSchema);
module.exports = userModel;
