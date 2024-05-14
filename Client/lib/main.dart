import 'package:flutter/material.dart';
import 'productlist.dart';
import 'addproduct.dart';
import 'staff.dart';
import 'addstaff.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFFFCD4E),
          width: MediaQuery.of(context).size.width,
          
          child: Column(
        
            children: [
              Image.asset("images/desgin.png",height: 360,width: 300,),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                
                  height: 473,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:20),
                        child: Row(
                          children: [
                            
                            Padding(
                              padding: const EdgeInsets.all(30),
                              child: GestureDetector(
                                onTap: ()=>{
                                  Navigator.push(
            context,MaterialPageRoute(builder: (context) => const AddProductListPage()),)
                                },
                                child: Container(
                                   width: MediaQuery.of(context).size.width*0.3,
                                   height: 150,
                                  decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 5,
                                      blurRadius: 10,
                                      offset: Offset(0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                   child: Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Column(children: [
                                      Image.asset("images/addproduct.png",height: 100,width:150,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Text("Add Product",style: TextStyle(fontWeight: FontWeight.bold),),
                                      )
                                     ],),
                                   )
                                
                                ),
                              ),
                            ),
                              Padding(
                              padding: const EdgeInsets.only(right:30),
                              child: GestureDetector(
                                onTap: () => {
                                    Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductListPage()),
          )
                                },
                                child: Container(
                                   width: MediaQuery.of(context).size.width*0.3,
                                   height: 150,
                                                      
                                  decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 5,
                                      blurRadius: 10,
                                      offset: Offset(0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                   child: Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Column(children: [
                                      Image.asset("images/productlist.png",height: 100,width:100,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Text("Product List",style: TextStyle(fontWeight: FontWeight.bold),),
                                      )
                                     ],),
                                   )
                                
                                ),
                              ),
                            ),
                            
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ),
                      Row(
                        children: [
                        
                          Padding(
                            padding: const EdgeInsets.all(30),
                            child : GestureDetector(
                              onTap: ()=>{
                                 Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddStaff()),
          )
                              },
                            child: Container(
                               width: MediaQuery.of(context).size.width*0.3,
                               height: 150,
                                               decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                  offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                               child: Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Column(children: [
                                    Image.asset("images/addstaff.png",height: 100,width:100,),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text("Add Staff",style: TextStyle(fontWeight: FontWeight.bold),),
                                    )
                                   ],),
                                 ),
                            
                            ),
                            ),
                          ),
                            Padding(
                            padding: const EdgeInsets.only(right:30),
                            child : GestureDetector(onTap: ()=>{
                                Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ViewStaff()),
          )
                            },
                            child: Container(
                               width: MediaQuery.of(context).size.width*0.3,
                               height: 150,
                      
                              decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                  offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                               child: Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Column(children: [
                                    Image.asset("images/viewstaff.png",height: 100,width:100,),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text("Staff List",style: TextStyle(fontWeight: FontWeight.bold),),
                                    )
                                   ],),
                                 ),
                            
                            ),
                            ),
                          ),
                          
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      )
                    ]
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                    color: Colors.white
                  ),
                )
              )
            ]
          ),
        ),
      ),
    );
  }
}