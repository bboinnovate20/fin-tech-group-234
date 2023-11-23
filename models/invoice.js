const mongoose = require("mongoose");
const shortid = require("shortid");
const schema = mongoose.Schema;
const ObjectId = schema.ObjectId;


const invoiceSchema = new schema({

 _id: {
        type: String,
     default: shortid.generate
    },
    fullName: { type: String, required: false },
    email: { type: String, required: true },
    amount: { type: String, required: true },
    shortDescription: { type: String, required: true },
    createdAt: { type: Date, required: true, default:Date.now },
    user_id:{type:mongoose.Schema.Types.String,
        ref:"users"
        },
  

})




const invoiceModel = mongoose.model("invoice", invoiceSchema);

module.exports =invoiceModel;