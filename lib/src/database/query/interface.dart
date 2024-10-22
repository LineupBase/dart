import '../schema/lineup_schema.dart';
import 'options.dart';

abstract interface class LineupDBQueryBuilderInterface<Schema extends LineupSchema>{
  /// search query _option using [option]
  final QueryOptions options;

  const LineupDBQueryBuilderInterface(this.options);

  /// option [limit]
  LineupDBQueryBuilderInterface<Schema> limit(int number);

  /// option [skip]
  LineupDBQueryBuilderInterface<Schema> skip(int number);
}