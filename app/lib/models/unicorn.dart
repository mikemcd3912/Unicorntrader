class Unicorn {
  final String postid;
  String? price;
  String? imageURL;
  String? name;
  String? description;

  Unicorn(
      {required this.postid,
      this.price,
      this.imageURL,
      this.description,
      this.name});

  factory Unicorn.fromMap(Map<String, dynamic> table) {
    return Unicorn(
        postid: table['imageURL'],
        price: table['price'],
        imageURL: table['imageURL'],
        description: table['description'],
        name: table['name']);
  }
}
