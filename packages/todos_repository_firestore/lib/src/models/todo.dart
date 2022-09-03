import 'package:meta/meta.dart';
import '../todo_entity.dart';

@immutable
class Todo {
  final bool complete;
  final String id;
  final String description;
  final String title;

  Todo(this.title, {this.complete = false, String description = '', String id})
      : this.description = description ?? '',
        this.id = id;

  Todo copyWith({bool complete, String id, String description, String title}) {
    return Todo(
      title ?? this.title,
      complete: complete ?? this.complete,
      id: id ?? this.id,
      description: description ?? this.description,
    );
  }

  @override
  int get hashCode =>
      complete.hashCode ^ title.hashCode ^ description.hashCode ^ id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Todo &&
              runtimeType == other.runtimeType &&
              complete == other.complete &&
              title == other.title &&
              description == other.description &&
              id == other.id;

  @override
  String toString() {
    return 'Todo { complete: $complete, title: $title, description: '
        '$description, id: $id }';
  }

  TodoEntity toEntity() {
    return TodoEntity(title, id, description, complete);
  }

  static Todo fromEntity(TodoEntity entity) {
    return Todo(
      entity.title,
      complete: entity.complete ?? false,
      description: entity.description,
      id: entity.id,
    );
  }
}