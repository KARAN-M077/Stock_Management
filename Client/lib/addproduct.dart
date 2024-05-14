import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class AddProductListPage extends StatefulWidget {
  const AddProductListPage({Key? key}) : super(key: key);

  @override
  _AddProductListPageState createState() => _AddProductListPageState();
}

class _AddProductListPageState extends State<AddProductListPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _productIDController = TextEditingController();
  TextEditingController _costPerUnitController = TextEditingController();
  TextEditingController _totalStockController = TextEditingController();
  TextEditingController _totalAmountPaidController = TextEditingController();
  String? _selectedCategory;
  String? _selectedProductName;

  void _addProduct(productName, description, productID, date, costPerUnit,
      totalStock, totalAmountPaid, selectedCategory) async {
    final dio = Dio();
    try {
      var bodyValues = {
        "productname": productName,
        "description": description,
        "productID": productID,
        "date": date,
        "category": selectedCategory,
        "costperunit": costPerUnit,
        "totalstock": totalStock,
        "totalamount": totalAmountPaid
      };

      final response = await dio.post(
          'https://consultancy-server.onrender.com/addproduct',
          data: bodyValues);
      if (response.statusCode == 200) {
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Product added successfully!'),
            duration: Duration(seconds: 3),
          ),
        );
        _formKey.currentState?.reset();
      }
    } catch (e) {
      print('Error connecting to the server: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Products"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DropdownButtonFormField<String>(
                  value: _selectedProductName,
                  decoration: InputDecoration(
                    labelText: 'Product Name',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectedProductName = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a Name';
                    }
                    return null;
                  },
                  items: ['Shirt', 'T-shirt', 'Shorts', 'Pant']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the description';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _productIDController,
                  decoration: InputDecoration(
                    labelText: 'ProductID',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Product ID';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  decoration: InputDecoration(
                    labelText: 'Date',
                  ),
                  controller: _selectedDate != null
                      ? TextEditingController(
                          text:
                              '${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}')
                      : null,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please choose the date';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  decoration: InputDecoration(
                    labelText: 'Category',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a category';
                    }
                    return null;
                  },
                  items: ['Kids', 'Mens']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _costPerUnitController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Cost Per Unit',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter cost per unit';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _totalStockController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Total Stock',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter total stock';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _totalAmountPaidController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Total Amount Paid',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter total amount paid';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      String productName = _selectedProductName!;
                      String description = _descriptionController.text;
                      String productID = _productIDController.text;
                      String? date = _selectedDate != null
                          ? '${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}'
                          : null;
                      String costPerUnit = _costPerUnitController.text;
                      String totalStock = _totalStockController.text;
                      String totalAmountPaid = _totalAmountPaidController.text;

                      print('Product Name: $productName');
                      print('Description: $description');
                      print('ProductID: $productID');
                      print('Date: $date');
                      print('Cost Per Unit: $costPerUnit');
                      print('Total Stock: $totalStock');
                      print('Total Amount Paid: $totalAmountPaid');
                      print('Category: $_selectedCategory');
                      _addProduct(
                          productName,
                          description,
                          productID,
                          date,
                          costPerUnit,
                          totalStock,
                          totalAmountPaid,
                          _selectedCategory);
                      setState(() {
                        _selectedProductName = null;
                        _selectedCategory = null;
                      });
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000), // Adjust the start date as needed
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _costPerUnitController.dispose();
    _totalStockController.dispose();
    _totalAmountPaidController.dispose();
    super.dispose();
  }
}
