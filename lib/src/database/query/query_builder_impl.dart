import 'package:lineup/src/database/query/options.dart';
import 'package:lineup/src/database/query/interface.dart';

import '../schema/lineup_schema.dart';

base class LineupDBQueryBuilder<Schema extends LineupSchema> implements LineupDBQueryBuilderInterface<Schema>{

  final Schema schema;

  const LineupDBQueryBuilder(this.schema);

  @override
  QueryOptions get options => QueryOptions();

  @override
  LineupDBQueryBuilderInterface<Schema> limit(int number) {
    options.limit = number;
    return LineupDBQueryBuilder<Schema>(schema);
  }

  @override
  LineupDBQueryBuilderInterface<Schema> skip(int number) {
    options.skip = number;
    return LineupDBQueryBuilder<Schema>(schema);
  }
}