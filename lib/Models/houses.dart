class House {
  String id;
  final String name;
  final String location;
  final String cost;
  final String imageUrl;
  final String bedrooms;
  final String bathrooms;
  final String propertyowner;
  final String plotsize;
  final String contact;
  final String description;

  House({
    this.id = '',
    required this.name,
    required this.location,
    required this.cost,
    required this.imageUrl,
    required this.bedrooms,
    required this.bathrooms,
    required this.propertyowner,
    required this.plotsize,
    required this.contact,
    required this.description,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "location": location,
        "cost": cost,
        "imageUrl": imageUrl,
        "bedrooms": bedrooms,
        "bathrooms": bathrooms,
        "propertyowner": propertyowner,
        "plotsize": plotsize,
        "contact": contact,
        "description": description,
      };

  static House fromJson(Map<String, dynamic> json) => House(
        id: json['id'],
        name: json['name'],
        location: json['location'],
        cost: json['cost'],
        imageUrl: json['imageUrl'],
        bedrooms: json['bedrooms'],
        bathrooms: json['bathrooms'],
        propertyowner: json['propertyowner'],
        plotsize: json['plotsize'],
        contact: json['contact'],
        description: json['description'],
      );
}
