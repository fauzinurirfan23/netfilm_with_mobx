// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Movies';

  @override
  String get searchHint => 'Search movie...';

  @override
  String get filterYear => 'Filter by Year';

  @override
  String get sortByPopularity => 'Sort by Popularity';

  @override
  String get defaultLabel => 'Default';

  @override
  String get highToLow => 'High to Low';

  @override
  String get lowToHigh => 'Low to High';

  @override
  String get allYears => 'All Years';

  @override
  String get bookmark => 'Bookmark';

  @override
  String get noBookmark => 'Belum ada favorit';

  @override
  String get successAddBookmark => 'Successfully added ';

  @override
  String get successRemoveBookmark => 'Successfully deleted ';
}
