const StaffSchema= require('../model/staff')
const ProductSchema = require('../model/product')


//add new product entry in the product table
const addproduct= async(req,res)=>{
    const {productname,description,productID,date,category,costperunit,totalstock,totalamount}=req.body;
    const product= ProductSchema({
      productname,
      description,
      productID,
      date,
      category,
      costperunit,
      totalstock,
      totalamount
    })
    try {
       await product.save()
       res.status(200).json({ message: 'success'});
    } catch (error) {
      return res.status(500).json({ error: 'Internal server error' });
    }

}

//get the product entries from the product table
const getproduct= async(req,res)=>{
  try {
    const products = await ProductSchema.find().sort({createdAT:-1});
        if (products.length > 0) {
            res.status(200).json(products);
        } else {
            res.status(401).json({ error: 'Empty products' });
        }
  } catch (error) {
    return res.status(500).json({ error: 'Internal server error' });
  }

}


//add new staff entry in the staff table
const addstaff= async(req,res)=>{
  const {staffname,staffID,age,gender,contact}=req.body;
  const staff=StaffSchema({
    staffname,
    staffID,
    age,
    gender,
    contact
  })
  try {
    await staff.save()
    res.status(200).json({ message: 'success'});
  } catch (error) {
    return res.status(500).json({ error: 'Internal server error' });
  }

}


//get the staff entries from the product table
const getstaff= async(req,res)=>{
  try {
    const products = await StaffSchema.find();
        if (products.length > 0) {
            res.status(200).json(products);
        } else {
            res.status(401).json({ error: 'Empty staffs' });
        }
  } catch (error) {
    return res.status(500).json({ error: 'Internal server error' });
  }

}

const deletestaff=async(req,res)=>{
  const {id}=req.params;
  try {
    StaffSchema.findByIdAndDelete(id)
       .then((income)=>{
        res.status(200).json({message:"Staff Deleted"})
       })
       .catch((err)=>{
        res.status(500).json({message:"Server error!"})
       }) 
  } catch (error) {
    return res.status(500).json({ error: 'Internal server error' });
  }
}

const deleteproduct=async(req,res)=>{
  const {id}=req.params;
  try {
    ProductSchema.findByIdAndDelete(id)
       .then((income)=>{
        res.status(200).json({message:"Product Deleted"})
       })
       .catch((err)=>{
        res.status(500).json({message:"Server error!"})
       }) 
  } catch (error) {
    return res.status(500).json({ error: 'Internal server error' });
  }
}




module.exports={addproduct,getproduct,addstaff,getstaff,deletestaff,deleteproduct};