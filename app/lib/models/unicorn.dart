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
        postid: table['imageURL']['S'],
        price: table['price']['S'],
        imageURL: table['imageURL']['S'],
        description: table['description']['S'],
        name: table['name']['S']);
  }
}
