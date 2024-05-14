const express=require('express');
const router= express.Router();

const {addproduct,getproduct,addstaff,getstaff,deleteproduct,deletestaff} = require('../controllers/controller');

router.post('/addproduct',addproduct)
router.get('/getproduct',getproduct)
router.post('/addstaff',addstaff)
router.get('/staffdetails',getstaff)
router.delete('/deleteproduct/:id',deleteproduct)
router.delete('/deletestaff/:id',deletestaff)

module.exports=router;