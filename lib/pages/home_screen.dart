
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commers_app/database_service/database_services.dart';
import 'package:e_commers_app/widgets/app_widget.dart';
import 'package:flutter/material.dart';

import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool iceCream = true, pizza = false, salad = false, burger = false;
  Stream? foodItemStream;
  onLoad()async{
    foodItemStream = await DatabaseServices().getFoodItem('Ice-cream');
    setState(() {

    });
  }
  @override
  void initState() {
    onLoad();
    super.initState();
  }
  Widget allItemsHorizontally(){
    return StreamBuilder(
        stream: foodItemStream,
        builder: (context, AsyncSnapshot snapshot){
       return snapshot.hasData ?
       ListView.builder(
           padding: EdgeInsets.zero,
           shrinkWrap: true,
           scrollDirection: Axis.horizontal,
           itemCount: snapshot.data.docs.length,
           itemBuilder: (context, index){
             DocumentSnapshot docSnap = snapshot.data.docs[index];
         return  InkWell(
           onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>
                 DetailScreen(
                   name: docSnap['Name'],
                   image: docSnap['Image'],
                   detail: docSnap['Detail'],
                   price: docSnap['Price'],
                 )));
           },
           child: Padding(
             padding: const EdgeInsets.only(bottom: 10,left: 10),
             child: Material(
               elevation: 5,
               borderRadius: BorderRadius.circular(20),
               child: Container(
                 width: 200,
                 padding: const EdgeInsets.all(10),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     ClipRRect(
                         borderRadius: BorderRadius.circular(20),
                         child: Image.network(docSnap['Image'],height: 150,width: 150,fit: BoxFit.cover,)),
                     const SizedBox(height: 5,),
                     Text(docSnap['Name'],style: AppWidget.semiBoldTextFieldStyle(),),
                     const SizedBox(height: 5,),
                     Text(
                       overflow: TextOverflow.ellipsis,
                       docSnap['Detail'],style: AppWidget.lightTextFieldStyle(),),
                     const SizedBox(height: 5,),
                     Text('\$'+docSnap['Price'],style: AppWidget.semiBoldTextFieldStyle(),),

                   ],
                 ),
               ),
             ),
           ),
         );
       }):const Center(child: CircularProgressIndicator(),);
    });
  }
  Widget allItemsVertically(){
    return StreamBuilder(
        stream: foodItemStream,
        builder: (context, AsyncSnapshot snapshot){
          return snapshot.hasData ?
          ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index){
                DocumentSnapshot docSnap = snapshot.data.docs[index];
                return Container(
                  margin: const EdgeInsets.only(right: 15,bottom: 10),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                              child: Image.network(docSnap['Image'],height: 130,width: 130,fit: BoxFit.cover,)),
                          const SizedBox(width: 20,),
                          Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width /2,
                                child: Text(docSnap['Name'],style: AppWidget.semiBoldTextFieldStyle(),),
                              ),
                              const SizedBox(width: 5,),
                              SizedBox(
                                width: MediaQuery.of(context).size.width /2,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  docSnap['Detail'],style: AppWidget.lightTextFieldStyle(),),
                              ),
                              const SizedBox(width: 5,),
                              SizedBox(
                                width: MediaQuery.of(context).size.width /2,
                                child: Text('\$ '+docSnap['Price'],style: AppWidget.semiBoldTextFieldStyle(),),
                              ),
                            ],
                          )
                        ],),
                    ),
                  ),
                );

              }):const Center(child: CircularProgressIndicator(),);
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50,left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hello Hasrat,",
                  style: AppWidget.boldTextFieldStyle()
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                ),
              ],
            ),
            const SizedBox(height: 30,),

            Text("Delicious Food,", style: AppWidget.headlineTextFieldStyle()),
            Text("Discover and Get Great Food,", style: AppWidget.lightTextFieldStyle()),

            const SizedBox(height: 20,),

            // Show the Category Item
            Container(
                margin: const EdgeInsets.only(right: 20),
                child: showCategoryItem()),

            const SizedBox(height: 20,),

            // To Show the List of item according to category
           SizedBox(
               height: 305,
               child: allItemsHorizontally()),

            const SizedBox(height: 20,),

            Expanded(
                child: allItemsVertically()
            )


          ],
        ),
      ),
    );
  }
  Widget showCategoryItem(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: ()async{
            foodItemStream = await DatabaseServices().getFoodItem('Ice-cream');
            setState(() {
              iceCream = true;
              pizza = false;
              salad = false;
              burger = false;
            });
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: iceCream ? Colors.black : Colors.white
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset('images/ice-cream.png',height: 50,width: 50,fit: BoxFit.cover,color: iceCream ?Colors.white: Colors.black,),
            ),
          ),
        ),
        InkWell(
          onTap: ()async{
            foodItemStream = await DatabaseServices().getFoodItem('Pizza');
            setState(() {
              iceCream = false;
              pizza = true;
              salad = false;
              burger = false;
            });
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: pizza ? Colors.black : Colors.white
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset('images/pizza.png',height: 50,width: 50,fit: BoxFit.cover,color: pizza ?Colors.white: Colors.black,),
            ),
          ),
        ),
        InkWell(
          onTap: ()async{
            foodItemStream = await DatabaseServices().getFoodItem('Salad');
            setState(() {
              iceCream = false;
              pizza = false;
              salad = true;
              burger = false;
            });
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: salad ? Colors.black : Colors.white
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset('images/salad.png',height: 50,width: 50,fit: BoxFit.cover,color: salad ?Colors.white: Colors.black,),
            ),
          ),
        ),
        InkWell(
          onTap: ()async{
            foodItemStream = await DatabaseServices().getFoodItem('Burger');
            setState(() {
              iceCream = false;
              pizza = false;
              salad = false;
              burger = true;
            });
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: burger ? Colors.black : Colors.white
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset('images/burger.png',height: 50,width: 50,fit: BoxFit.cover,color: burger ?Colors.white: Colors.black,),
            ),
          ),
        ),


      ],
    );

  }
}
