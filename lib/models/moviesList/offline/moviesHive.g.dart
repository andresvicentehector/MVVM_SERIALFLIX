// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moviesHive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieHiveAdapter extends TypeAdapter<MovieHive> {
  @override
  final int typeId = 0;

  @override
  MovieHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieHive(
      results: (fields[0] as List?)?.cast<ResultsHive>(),
      totalPages: fields[2] as dynamic,
      totalResults: fields[3] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, MovieHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.results)
      ..writeByte(2)
      ..write(obj.totalPages)
      ..writeByte(3)
      ..write(obj.totalResults);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ResultsHiveAdapter extends TypeAdapter<ResultsHive> {
  @override
  final int typeId = 1;

  @override
  ResultsHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResultsHive(
      backdropPath: fields[0] as String?,
      firstAirDate: fields[1] as String?,
      genreIds: (fields[2] as List?)?.cast<dynamic>(),
      id: fields[3] as dynamic,
      name: fields[4] as String?,
      originCountry: (fields[5] as List?)?.cast<String>(),
      originalLanguage: fields[6] as String?,
      originalName: fields[7] as String?,
      overview: fields[8] as String?,
      popularity: fields[9] as dynamic,
      posterPath: fields[10] as String?,
      voteAverage: fields[11] as dynamic,
      voteCount: fields[12] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, ResultsHive obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.backdropPath)
      ..writeByte(1)
      ..write(obj.firstAirDate)
      ..writeByte(2)
      ..write(obj.genreIds)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.originCountry)
      ..writeByte(6)
      ..write(obj.originalLanguage)
      ..writeByte(7)
      ..write(obj.originalName)
      ..writeByte(8)
      ..write(obj.overview)
      ..writeByte(9)
      ..write(obj.popularity)
      ..writeByte(10)
      ..write(obj.posterPath)
      ..writeByte(11)
      ..write(obj.voteAverage)
      ..writeByte(12)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultsHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
