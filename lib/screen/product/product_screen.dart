import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled2/screen/invoice/invoice_screen.dart';
import 'package:untitled2/util/color.dart';
import 'package:untitled2/util/global.dart';
class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<String>dataList=[];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: primary,
          title: const Text("Product view",
          style: TextStyle(
            color: Colors.white
          )),
          actions: [
            IconButton(onPressed: () {
              Navigator.pushNamed(context, 'invoice',arguments: const InvoiceScreen());
            },
                icon: Icon(Icons.save_alt))
          ],
        ),
        body: Column(
          children: [
        Container(
          child: Column(
          children: List.generate(productList.length, (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text("${productList[index]['image']}"),
                ),
                const SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${productList[index]['name']}",
                      style:const  TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "₹${productList[index]['price']}",
                      style:const  TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${productList[index]['Quality']}",
                      style:const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    InkWell(
                        onTap: (){
                          setState(() {
                            productList.removeAt(index);
                          });
                        },
                        child:const  Icon(Icons.delete)),
                    SizedBox(height: 5,),
                    Text(
                      "${productList[index]['total']}",
                      style:const  TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),)
              ),
        ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(onPressed: () {
                setState(() {
                Navigator.pushNamed(context,'create',arguments: Map).then((value) {
                  setState(() {
                  });
                });
                });
              },style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  backgroundColor: MaterialStatePropertyAll(Color(0xff112F61))
                ),
                  child: const Text("+Invoice"),),
            ),
          ],
        )
      ),
    );
  }
}
