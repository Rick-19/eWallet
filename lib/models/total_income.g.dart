// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_income.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TotalIncomeAdapter extends TypeAdapter<TotalIncome> {
  @override
  final int typeId = 0;

  @override
  TotalIncome read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TotalIncome(
      title: fields[0] as String,
      creditDebitAmount: fields[1] as int,
      date: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, TotalIncome obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.creditDebitAmount)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TotalIncomeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
