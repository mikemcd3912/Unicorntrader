class Unicorn {
  final String postid ;
  int? price;
  String? imageURL;
  String? name;
  String? description;

  Unicorn({
    required this.postid,
    this.price,
    this.imageURL,
    this.description,
    this.name

  });

  factory Unicorn.fromMap(Map<String, dynamic> entry) {
    return Unicorn(
      postid: entry['imageURL'],
      price: entry['price'],
      imageURL: entry['imageURL'],
      description: entry['description'],
      name: entry['name']
    );
  }
}
