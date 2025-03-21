import 'package:equatable/equatable.dart';

import 'cast_model.dart';
import 'crew_model.dart';

class MovieCastModel extends Equatable {
  final int? id;
  final List<CastModel>? cast;
  final List<CrewModel>? crew;

  const MovieCastModel({this.id, this.cast, this.crew});

  factory MovieCastModel.fromJson(Map<String, dynamic> json) {
    return MovieCastModel(
      id: json['id'] as int?,
      cast: (json['cast'] as List<dynamic>?)
          ?.map((e) => CastModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>?)
          ?.map((e) => CrewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'cast': cast?.map((e) => e.toJson()).toList(),
        'crew': crew?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [id, cast, crew];
}
