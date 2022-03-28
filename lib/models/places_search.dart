class PlaceSearch{
  final description;
  final placeId;

  PlaceSearch({this.description,this.placeId});

  factory PlaceSearch.fromJson(Map<String, dynamic> json) {
    return PlaceSearch(
      description: json["description"],
      placeId: json["place_ID"]
    );
  }
}
