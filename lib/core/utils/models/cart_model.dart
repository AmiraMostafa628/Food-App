class CartModel {
   String? restaurantName;
   String? restaurantCategories;
   int? price;
   String? size;
   String? amount;

  CartModel({required this.restaurantName, required this.restaurantCategories,
    required this.price,required this.size,required this.amount});

  CartModel.fromJson(Map<String, dynamic>json)
  {
    restaurantName = json['restaurantName'];
    restaurantCategories = json['restaurantCategories'];
    price = json['price'];
    size = json['size'];
    amount = json['amount'];
  }

  Map<String, dynamic>? toMap() {
    return
      {
        'restaurantName': restaurantName,
        'restaurantCategories': restaurantCategories,
        'price': price,
        'size':size,
        'amount':amount,
      };
  }
}