import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/util/color.dart';
import 'package:untitled2/util/global.dart';
import 'package:untitled2/util/pdf_helper.dart';
class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Invoice"),
        backgroundColor: primary,
        foregroundColor: Colors.white,
        actions: [
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton.filledTonal(onPressed: () {
              createPdf();
            },
                icon:const Icon(Icons.picture_as_pdf,color: Colors.black,)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            Row(
              children: [
                Text("$name",style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black
                ),),
                const Spacer(),
                const Text("DesignMNL\nStudio",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black
                ),),
              ],
            ),
            Row(
              children: [
                Text("$address",style: const TextStyle(
                    fontSize: 25,
                    color: Colors.grey
                ),),
                const Spacer(),
                Text("$phone",style: const TextStyle(
                    fontSize: 25,
                    color: Colors.grey
                ),),
              ],
            ),
            const SizedBox(height: 10,),
            const Divider(thickness: 2,),
            const Row(
              children: [
                Text("Bill To",style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
                Spacer(),
                Text("Please Make Payable To:",style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
                Spacer(),
                Text("Invoice",style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),

              ],
            ),
            const Row(
              children: [
                Text("LogoMNL \nStudio",style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),),
                Spacer(),
                Text("DesignMNL \nStudio",style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),),
                Spacer(),
                Text("Invoice No :001",style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),),

              ],
            ),
            Text("$address",style: const TextStyle(
                fontSize: 15,
                color: Colors.grey
            ),),
            const SizedBox(height: 10,),
            Container(
              height: 50,
              width: 400,
              decoration: const BoxDecoration(
                color: Colors.blue
              ),
              child: const Center(
                child: Text("INVOICE",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),),
              ),
            ),
            const SizedBox(height: 10,),
            const Row
              (
              children: [
                Text("Quality",style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),),
                Spacer(),
                Text("Product",style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),),
                Spacer(),
                Text("Price",style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),),
                Spacer(),
                Text("Total Price",style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),),
              ],
            ),
            Column(
              children: [
                Column(
                  children: List.generate(productList.length, (index) =>
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("${productList[index]['Quality']}",style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),),
                            const SizedBox(width: 100,),
                            Text("${productList[index]['name']}",style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),),
                            const SizedBox(width: 50,),
                            Text("${productList[index]['price']}",style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),),
                            const SizedBox(width: 50,),
                            Text("${productList[index]['total']}",style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),),
                          ],
                        ),
                      ),),
                ),

                    ],
                  ),
              ],
            ),
        ),
    );
  }
}
