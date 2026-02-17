// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Film';

  @override
  String get searchHint => 'Cari film...';

  @override
  String get filterYear => 'Tahun';

  @override
  String get sortByPopularity => 'Popularitas';

  @override
  String get defaultLabel => 'Default';

  @override
  String get highToLow => 'Tinggi ke Rendah';

  @override
  String get lowToHigh => 'Rendah ke Tinggi';

  @override
  String get allYears => 'Semua Tahun';

  @override
  String get bookmark => 'Favorit';

  @override
  String get noBookmark => 'Belum ada favorit';

  @override
  String get successAddBookmark => 'Berhasil menambahkan';

  @override
  String get successRemoveBookmark => 'Berhasil menghapus';
}
