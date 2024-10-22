import '../query_exec/find.dart';
import '../schema/lineup_schema.dart';

abstract interface class LineupModelInterface<Schema extends LineupSchema>{

  /// [save] function for models
  Future<Schema> save([Schema? set]);

  /// like mongodb [save] function for models
  Future<bool> delete();

  FindExec<Schema> find();

  Future<Schema?> findOne({Map<String, dynamic>? where});

  Future<Schema?> findById(int id);

  late final Schema schema;
}