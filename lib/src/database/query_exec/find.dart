import 'package:lineup/src/core/exceptions/lineup_exception.dart';
import 'package:lineup/src/database/query/query_builder_impl.dart';
import 'package:lineup/src/database/schema/lineup_schema.dart';
import 'interface.dart';

final class FindExec<Schema extends LineupSchema>
    extends LineupDBQueryBuilder<Schema> implements QueryExecuteInterface {

  //
  const FindExec(super.schema);

  @override
  Future<List<Schema>> exec(
      [void Function(List<Schema> data, LineupException? err)?
          callback]) async {
    callback?.call([], null);
    return [];
  }
}
