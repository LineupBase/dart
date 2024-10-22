import 'package:lineup/lineup.dart';
import 'package:lineup/src/core/exceptions/lineup_exception.dart';

class LineupSchema {
  final int? id;
  final String collection;
  String? database;

  /// updates:
  /// index
  /// primary
  /// fields: [ createdAt, updatedAt ]

  LineupSchema(
    this.collection, {
    this.id,
    this.database,
  }) {
    if (LineupDatabase.databases == null ||
        (LineupDatabase.databases?.isEmpty ?? true)) {
      throw const LineupException(
          'Please add `await Lineup.localDatabase(\'YOUR_DATABASE_NAME\');` in the main function.');
    } else if (LineupDatabase.databases?.length == 1) {
      database ??= LineupDatabase.databases!.keys.first;

      if (database != LineupDatabase.databases!.keys.first) {
        throw LineupException('Database with ($database) name does not exist!');
      }
    } else if (database == null) {
      throw LineupException(
          'Please specify the database field where you define $collection Schema!\n'
          'like ** ```TodoSchema() : super("todos", database: "DATABASE_NAME");``` **');
    }
  }
}
