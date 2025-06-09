// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';



class GetInfromation {
  String? title;
  int? pageid;
  String? text;
  GetInfromation({
    this.title,
    this.pageid,
    this.text,
  });

  

  GetInfromation copyWith({
    String? title,
    int? pageid,
    String? text,
  }) {
    return GetInfromation(
      title: title ?? this.title,
      pageid: pageid ?? this.pageid,
      text: text ?? this.text,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'pageid': pageid,
      'text': text,
    };
  }

  factory GetInfromation.fromMap(Map<String, dynamic> map) {
    return GetInfromation(
      title: map['title'] != null ? map['title'] as String : null,
      pageid: map['pageid'] != null ? map['pageid'] as int : null,
      text: map['text'] != null ? map['text'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetInfromation.fromJson(String source) => GetInfromation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GetInfromation(title: $title, pageid: $pageid, text: $text)';

  @override
  bool operator ==(covariant GetInfromation other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.pageid == pageid &&
      other.text == text;
  }

  @override
  int get hashCode => title.hashCode ^ pageid.hashCode ^ text.hashCode;
}
