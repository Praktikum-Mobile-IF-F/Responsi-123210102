// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jenis_kopi.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JenisKopiAdapter extends TypeAdapter<JenisKopi> {
  @override
  final int typeId = 0;

  @override
  JenisKopi read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JenisKopi(
      id: fields[0] as String?,
      internalId: fields[1] as int?,
      name: fields[2] as String?,
      description: fields[3] as String?,
      price: fields[4] as double?,
      region: fields[5] as String?,
      weight: fields[6] as int?,
      flavorProfile: (fields[7] as List?)?.cast<String>(),
      grindOption: (fields[8] as List?)?.cast<String>(),
      roastLevel: fields[9] as int?,
      imageUrl: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, JenisKopi obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.internalId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.region)
      ..writeByte(6)
      ..write(obj.weight)
      ..writeByte(7)
      ..write(obj.flavorProfile)
      ..writeByte(8)
      ..write(obj.grindOption)
      ..writeByte(9)
      ..write(obj.roastLevel)
      ..writeByte(10)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JenisKopiAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
