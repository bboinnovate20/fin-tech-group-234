const mongoose = require("mongoose");
const shortid = require("shortid");
const schema = mongoose.Schema;
const ObjectId = schema.ObjectId;


const invoiceSchema = new schema({

 _id: {
        type: String,
     default: shortid.generate
    },
    productName: { type: String, required: false },
    quantity: { type: String, required: true },
    amount: { type: String, required: true },
    description: { type: String, required: true },
    createdAt: { type: Date, required: true, default:Date.now },
    ownerId: { type: String, required: true },

})




const invoiceModel = mongoose.model("invoice", invoiceSchema);

module.exports =invoiceModel;