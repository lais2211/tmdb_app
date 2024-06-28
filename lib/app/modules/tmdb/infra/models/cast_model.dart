import '../../domain/entities/cast_entity.dart';

class CastModel extends CastEntity {
  CastModel({required super.name, required super.profilePath});

  factory CastModel.fromMap(Map<String, dynamic> map) {
    return CastModel(name: map['name'], profilePath: map['profile_path']);
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'profile_path': profilePath};
  }
}
