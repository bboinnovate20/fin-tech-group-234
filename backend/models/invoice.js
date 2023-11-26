const mongoose = require("mongoose");
const shortid = require("shortid");
const schema = mongoose.Schema;
const ObjectId = schema.ObjectId;

const invoiceSchema = new schema({
  _id: {
    type: String,
    default: shortid.generate,
  },
  productName: { type: String, required: false },
  quantity: { type: String, required: true },
  amount: { type: Number, required: true },
  description: { type: String, required: true },
  customerName: { type: String, required: false },
  customerAddress: { type: String, required: false },
  customerEmail: { type: String, required: false },
  customerPhoneNumber: { type: String, required: false },
  createdAt: { type: Date, required: true, default: Date.now },
  ownerId: { type: String, required: true },
  url: { type: String },
  reference: { type: String },
  paid: {type: Boolean, default: false},
  status: {
    type: String,
    enum: {
      values: ["overDue", "paid"],
      message: "status is either paid or overDue",
    },
    default: "overDue",
  },
});

const invoiceModel = mongoose.model("invoice", invoiceSchema);

module.exports = invoiceModel;
