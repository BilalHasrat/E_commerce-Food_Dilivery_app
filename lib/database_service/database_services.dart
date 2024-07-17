import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {

  Future addUserInfo(Map<String, dynamic> userInfo, id)async{
    return await FirebaseFirestore.instance.collection('users').doc(id).set(userInfo);
}

  updateUserWallet(String id, String amount)async{
    return await FirebaseFirestore.instance.collection('users').doc(id).update({'Wallet':amount});
}

 Future addFoodItem(Map<String, dynamic>foodItem, String name)async{
    return await FirebaseFirestore.instance.collection(name).add(foodItem);
}

  Future<Stream<QuerySnapshot>> getFoodItem (String name)async{
    return  FirebaseFirestore.instance.collection(name).snapshots();
}

  Future addFoodItemToCard(Map<String, dynamic> foodItem, id)async{
    return await FirebaseFirestore.instance.collection('users').doc(id).collection('Cart').add(foodItem);
  }
  Future<Stream<QuerySnapshot>> getFoodCartItem(String id)async{
    return await FirebaseFirestore.instance.collection('users').doc(id).collection('Cart').snapshots();
  }
}