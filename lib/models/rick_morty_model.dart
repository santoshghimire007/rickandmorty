import 'package:rick_morty_api/models/location_origin_model.dart';

class RickMortyModel {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  LocationOrigin? origin;
  LocationOrigin? location;
  String? image;
  List<String>? episode;
  String? url;
  String? created;

  RickMortyModel(
      {this.id,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.origin,
      this.location,
      this.image,
      this.episode,
      this.url,
      this.created});

  factory RickMortyModel.fromJson(Map<String, dynamic> json) => RickMortyModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      origin: LocationOrigin.fromJson(json['origin']),
      location: LocationOrigin.fromJson(json['location']),
      image: json['image'],
      episode: List<String>.from(json['episode'].map((x) => x)),
      url: json['url'],
      created: json['created']);
}
