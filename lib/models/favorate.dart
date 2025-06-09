// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'favorate.g.dart'; // auto-generated file

@HiveType(typeId: 0)
class Favorate extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String text;
  @HiveField(2)
  final int pageID;
  @HiveField(3)
  final int id;
  Favorate({
    required this.title,
    required this.text,
    required this.pageID,
    required this.id,
  });

  Favorate copyWith({
    String? title,
    String? text,
    int? pageID,
    int? id,
  }) {
    return Favorate(
      title: title ?? this.title,
      text: text ?? this.text,
      pageID: pageID ?? this.pageID,
      id: id ?? this.id,
    );
  }
}
