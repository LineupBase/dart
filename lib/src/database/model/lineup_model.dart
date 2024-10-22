import 'package:lineup/src/database/model/model_interface.dart';
import 'package:lineup/src/database/schema/lineup_schema.dart';
import '../query_exec/find.dart';
import 'creator.dart';

class LineupModel<Schema extends LineupSchema> implements LineupModelInterface<Schema>{

  LineupModel(LineupModelCreator<Schema> creator) : schema = creator();

  @override
  Future<Schema> save([Schema? set]) {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  Future<bool> delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  FindExec<Schema> find() {
    return FindExec<Schema>(schema);
  }

  @override
  Future<Schema?> findById(int id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Future<Schema?> findOne({Map<String, dynamic>? where}) {
    // TODO: implement findOne
    throw UnimplementedError();
  }

  @override
  Schema schema;
}