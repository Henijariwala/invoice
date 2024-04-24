import 'package:flutter/material.dart';
import 'package:untitled2/screen/create/create_screen.dart';
import 'package:untitled2/screen/home/home_screen.dart';
import 'package:untitled2/screen/invoice/invoice_screen.dart';
import 'package:untitled2/screen/product/product_screen.dart';
import 'package:untitled2/screen/sphash/sphash_screen.dart';
void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) =>const SplashScreen(),
        'home':(context) =>const HomeScreen(),
        'product':(context)=>const ProductScreen(),
        'create':(context)=>const CreateScreen(),
        'invoice':(context)=>const InvoiceScreen()
      },
    ),
  );
}