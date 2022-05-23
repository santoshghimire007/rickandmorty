class LocationOrigin {
  String? name;
  String? url;

  LocationOrigin({
    this.name,
    this.url,
  });

  factory LocationOrigin.fromJson(Map<String, dynamic> json) =>
      LocationOrigin(name: json['name'], url: json['url']);
}
