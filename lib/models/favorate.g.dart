// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorate.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavorateAdapter extends TypeAdapter<Favorate> {
  @override
  final int typeId = 0;

  @override
  Favorate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Favorate(
      title: fields[0] as String,
      text: fields[1] as String,
      pageID: fields[2] as int,
      id: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Favorate obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.pageID)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavorateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
