import 'package:e_commers_app/database_service/database_services.dart';
import 'package:e_commers_app/database_service/sharedpreference.dart';
import 'package:flutter/material.dart';

import '../widgets/app_widget.dart';

class DetailScreen extends StatefulWidget {
  final String detail, name,image,price;

   const DetailScreen({super.key,
     required this.name,
     required this.image,
     required this.detail,
     required this.price});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int a = 1, total = 0;
  String? id;

  onTheLoad ()async{
    id  = await SharedPreferenceHelper().getUserId();
  }
  @override
  void initState() {
    total = int.parse(widget.price);
    onTheLoad();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: const EdgeInsets.only(top: 60, right: 20, left: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
              ),
              Image.network(
                widget.image,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        widget.name,
                        style: AppWidget.boldTextFieldStyle(),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      if (a > 1) {
                        --a;
                        total = total - int.parse(widget.price);
                      }
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    a.toString(),
                    style: AppWidget.semiBoldTextFieldStyle(),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  GestureDetector(
                    onTap: () {
                     // total = total + int.parse(widget.price);
                      setState(() {
                        total = total + int.parse(widget.price);
                        ++a;

                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
                  const SizedBox(height: 20,),
                  Text(
                    widget.detail,
                    maxLines: 4,
                    style: AppWidget.lightTextFieldStyle(),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "Delivery Time",
                        style: AppWidget.semiBoldTextFieldStyle(),
                      ),
                      const SizedBox(
                        width: 25.0,
                      ),
                      const Icon(
                        Icons.alarm,
                        color: Colors.black54,
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        "30 min",
                        style: AppWidget.semiBoldTextFieldStyle(),
                      )
                    ],
                  ),
        Spacer(),
        Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Price",
                        style: AppWidget.semiBoldTextFieldStyle(),
                      ),
                      Text(
                        '\$'+total.toString(),
                        style: AppWidget.headlineTextFieldStyle(),
                      )
                    ],
                  ),
            GestureDetector(
                onTap: () async {
                  Map<String, dynamic> addFoodToCart = {
                    "Name": widget.name,
                    "Quantity": a.toString(),
                    "Total": total.toString(),
                    "Image": widget.image
                  };
                 await DatabaseServices().addFoodItemToCard(addFoodToCart, id!);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.orangeAccent,
                      content: Text(
                        "Food Added to Cart",
                        style: TextStyle(fontSize: 18.0),
                      )));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "Add to cart",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontFamily: 'Poppins'),
                      ),
                      const SizedBox(
                        width: 30.0,
                      ),
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                    ],
                  ),
                )
            ),
              ]
            )
        )
                ]
                )
        )
    );
  }
}
