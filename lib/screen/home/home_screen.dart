import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/util/color.dart';
import 'package:untitled2/util/global.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  GlobalKey<FormState>formKey=GlobalKey<FormState>();

  TextEditingController txtName =TextEditingController();
  TextEditingController txtPhone =TextEditingController();
  TextEditingController txtAddress =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User",
        style: TextStyle(
          fontSize: 25
        )),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50,),
                Container(
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 5
                      )
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10,),
                          const Center(
                            child: Text("User Details",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                            )),
                          ),
                          const SizedBox(height: 10,),
                          const Text("Name",style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: "Enter Name",
                              border: OutlineInputBorder(),
                            ),
                            textInputAction: TextInputAction.next,
                            controller: txtName,
                            validator: (value) {
                              if(value!.isEmpty)
                                {
                                  return "Fill the details";
                                }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10,),
                          const Text("Phone Number",style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                          ),),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: "Enter phone number",
                              border: OutlineInputBorder(),
                            ),
                            textInputAction: TextInputAction.next,
                            controller: txtPhone,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if(value!.isEmpty)
                                {
                                  return "Fill the detail";
                                }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10,),
                          const Text("Address",style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                          ),),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: "Address",
                              border: OutlineInputBorder(),
                            ),
                            controller: txtAddress,
                            textInputAction: TextInputAction.next,
                            maxLines: 2,
                            validator: (value) {
                              if(value!.isEmpty)
                                {
                                  return "Fill the detail";
                                }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10,),
                          Center(
                            child: ElevatedButton(onPressed: () {
                              setState(() {
                                if(formKey.currentState!.validate())
                                  {
                                    name=txtName.text;
                                    phone=txtPhone.text;
                                    address=txtAddress.text;
                                  }
                              });
                              Navigator.pushNamed(context,'product');
                            },
                            style: const ButtonStyle(
                                foregroundColor: MaterialStatePropertyAll(Colors.white),
                                backgroundColor: MaterialStatePropertyAll(Colors.blue),
                            ),
                                child: const Text("Save"),),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
