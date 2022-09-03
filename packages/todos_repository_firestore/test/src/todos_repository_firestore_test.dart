// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';
import 'package:todos_repository_firestore/todos_repository_firestore.dart';

void main() {
  group('TodosRepositoryFirestore', () {
    test('can be instantiated', () {
      expect(TodosRepositoryFirestore(), isNotNull);
    });
  });
}
