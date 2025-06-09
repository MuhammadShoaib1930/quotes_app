// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// jsonDecode(response.body)['query']['random'];
class RandomPageList {
  int? id;
  int? ns;
  String? title;

  RandomPageList({
    this.id,
    this.ns,
    this.title,
  });
  RandomPageList copyWith({
    int? id,
    int? ns,
    String? title,
  }) {
    return RandomPageList(
      id: id ?? this.id,
      ns: ns ?? this.ns,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'ns': ns,
      'title': title,
    };
  }

  factory RandomPageList.fromMap(Map<String, dynamic> map) {
    return RandomPageList(
      id: map['id'] != null ? map['id'] as int : null,
      ns: map['ns'] != null ? map['ns'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RandomPageList.fromJson(String source) => RandomPageList.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RandomPageList(id: $id, ns: $ns, title: $title)';

  @override
  bool operator ==(covariant RandomPageList other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.ns == ns &&
      other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ ns.hashCode ^ title.hashCode;
}
