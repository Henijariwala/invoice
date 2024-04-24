import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled2/util/color.dart';
import 'package:untitled2/util/global.dart';
class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {

  GlobalKey<FormState>formKey=GlobalKey<FormState>();

  TextEditingController txtProduct =TextEditingController();
  TextEditingController txtPrice =TextEditingController();
  TextEditingController txtQuality =TextEditingController();
  TextEditingController txtDis =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: primary,
        title: const Text("Product detail",
        style: TextStyle(
          color: Colors.white
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  height: 700,
                  width: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 120,
                                width: 120,
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                ),
                                child: Align(
                                  alignment: Alignment(0.9,0.9),
                                  child: IconButton.filledTonal(onPressed: () async{
                                    ImagePicker picker  =ImagePicker();
                                    XFile? image = await picker.pickImage(source: ImageSource.gallery);
                                    setState(() {
                                      path=image!.path;
                                    });
                                  },
                                      icon:const Icon(Icons.add)),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text("Product Name:-",style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: "Product Title",
                              border: OutlineInputBorder(),
                            ),
                            textInputAction: TextInputAction.next,
                            controller: txtProduct,
                          ),
                          const SizedBox(height: 10,),
                          const Text("Price :-",style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                          ),),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: "Price",
                              border: OutlineInputBorder(),
                            ),
                            controller: txtPrice,
                            textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(height: 10,),
                          const Text("Quality :-",style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                          ),),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: "Quality",
                              border: OutlineInputBorder(),
                            ),
                            controller: txtQuality,
                            textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(height: 10,),
                          const Text("Discount :-",style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                          ),),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: "Discount",
                              border: OutlineInputBorder(),
                            ),
                            textInputAction: TextInputAction.next,
                            controller: txtDis,
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: ElevatedButton(onPressed: () {
                                setState(() {
                                  if(formKey.currentState!.validate())
                                  {
                                    String? pName = txtProduct.text;
                                    String? Pprice = txtPrice.text;
                                    String? qa = txtQuality.text;
                                    String? dis = txtDis.text;
                                    String? pPath=path;

                                    Map product = {
                                      "name": pName,
                                      "price": Pprice,
                                      "Quality": qa,
                                      "discount": dis,
                                      "total": int.parse(qa)*int.parse(Pprice),
                                      "ptotal":int.parse(qa)*int.parse(Pprice),
                                      "path":pPath,
                                    };
                                    productList.add(product);

                                    Navigator.pop(context);
                                  }
                                });
                              },
                            style: const ButtonStyle(
                              foregroundColor: MaterialStatePropertyAll(Colors.blue),
                              backgroundColor: MaterialStatePropertyAll(Color(0xff112F61))
                            ),
                                child: const Text("Submit",
                                style: TextStyle(
                                  color: Colors.white,
                                ))),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
