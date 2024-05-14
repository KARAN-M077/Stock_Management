const mongoose=require('mongoose')

const ProductSchema=new mongoose.Schema({
  productname:{
    type:String,
    required:true,
    trim:true,
    maxLength:50
  },
  description:{
    type:String,
    required:true,
    maxLength:30,
    trim:true
  },
  productID:{
    type:String,
    required:true,
    maxLength:10
  },
  date:{
    type:String,
    required:true
  },
  category:{
    type:String,
    required:true,
  },
  costperunit:{
    type:String,
    required:true,
  },
  totalstock:{
    type:String,
    required:true,
   
  },
  totalamount:{
    type:String,
    required:true,
   
  }

},{timestamps:true})
module.exports=mongoose.model('products',ProductSchema);

