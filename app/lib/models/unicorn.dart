class Unicorn {
  final DateTime datePosted;
  int? price;
  String? imageURL;
  String? name;
  String? description;

  Unicorn({
    required this.datePosted,
    this.price,
    this.imageURL,
    this.description,
    this.name

  });

  factory Unicorn.fromMapTimeStamp(Map<String, dynamic> entry) {
    return Unicorn(
      datePosted: entry['date'].toDate(),
      price: entry['price'],
      imageURL: entry['imageURL'],
      description: entry['description'],
      name: entry['name']
    );
  }

  factory Unicorn.fromMap(Map<String, dynamic> entry) {
    return Unicorn(
      datePosted: entry['date'],
      price: entry['price'],
      imageURL: entry['imageURL'],
      description: entry['description'],
      name: entry['name']
    );
  }
}
