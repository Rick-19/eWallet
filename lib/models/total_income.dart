import 'package:hive/hive.dart';
part 'total_income.g.dart';

@HiveType(typeId: 0)
class TotalIncome {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final int creditDebitAmount;
  @HiveField(2)
  final DateTime date;

  TotalIncome(
      {required this.title,
      required this.creditDebitAmount,
      required this.date});
}
