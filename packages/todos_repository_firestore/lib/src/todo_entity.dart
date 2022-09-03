

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  final bool complete;
  final String id;
  final String description;
  final String title;

  TodoEntity(this.title, this.id, this.description, this.complete);

  Map<String, Object> toJson() {
    return {
      'complete': complete,
      'title': title,
      'description': description,
      'id': id,
    };
  }

  @override
  String toString() {
    return 'TodoEntity { complete: $complete, title: $title, description: '
        '$description, id: $id }';
  }

  static TodoEntity fromJson(Map<String, Object> json) {
    return TodoEntity(
      json['title'] as String,
      json['id'] as String,
      json['description'] as String,
      json['complete'] as bool,
    );
  }

  static TodoEntity fromSnapshot(DocumentSnapshot snap) {
    return TodoEntity(
      snap.data['title'],
      snap.documentID,
      snap.data['note'],
      snap.data['description'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'complete': complete,
      'title': title,
      'description': description,
    };
  }
}