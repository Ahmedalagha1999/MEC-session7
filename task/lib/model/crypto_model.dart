class CryptoCurrency {
  final String _name;
  final String _imagePath;
  final String _abbreviation;
  final double _cost;
  final String _change;
  final String _trending;
  bool _mycoin;

  CryptoCurrency({
    required String name,
    required String imagePath,
    required String abbreviation,
    required double cost,
    required String change,
    required String trending,
    bool mycoin = false, // Add the bool field with default value
  })  : _name = name,
        _imagePath = imagePath,
        _abbreviation = abbreviation,
        _cost = cost,
        _change = change,
        _trending = trending,
        _mycoin = mycoin; // Initialize the mycoin field

  String get name => _name;
  String get imagePath => _imagePath;
  String get abbreviation => _abbreviation;
  double get cost => _cost;
  String get change => _change;
  String get trending => _trending;
  bool get mycoin => _mycoin; // Getter for mycoin field
}
