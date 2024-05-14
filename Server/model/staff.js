const mongoose=require('mongoose')

const StaffSchema=new mongoose.Schema({
  staffname:{
    type:String,
    required:true,
    trim:true,
    maxLength:50
  },
  staffID:{
    type:String,
    required:true,
    maxLength:10
  },
  age:{
    type:String,
    required:true,
    maxLength:20,
    trim:true
  },
  gender:{
    type:String,
    required:true
  },
  contact:{
    type:String,
    required:true,
    trim:true,
    maxLength:10,
  }
})
module.exports=mongoose.model('staffs',StaffSchema);

