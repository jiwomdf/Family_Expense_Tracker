List<Map<String, int>> ddMonths = [
  {"January": 1},
  {"February": 2},
  {"March": 3},
  {"April": 4},
  {"May": 5},
  {"June": 6},
  {"July": 7},
  {"August": 8},
  {"September": 9},
  {"October": 10},
  {"November": 11},
  {"December": 12}
];

List<int> generateLastFiveYear() {
  List<int> listYear = [];
  var curYear = DateTime.now().year;
  for (var year = curYear; year >= curYear - 5; year--) {
    listYear.add(year);
  }
  return listYear;
}
