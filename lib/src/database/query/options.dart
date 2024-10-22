class QueryOptions{
  int? limit;
  int? skip;
  MapEntry<String, bool>? sort;

  QueryOptions({
    this.limit,
    this.skip,
    this.sort,
  });
}