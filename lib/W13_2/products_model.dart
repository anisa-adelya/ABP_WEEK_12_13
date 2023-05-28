import 'dart:convert';
import 'dart:ffi';

class Products {
  final String name;
  final int price;

  const Products({
    required this.name,
    required this.price,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      name: json['name'],
      price: json['price'],
    );
  }
}

//list
List<Products> parseProducts(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Products>((json) => Products.fromJson(json)).toList();
}
