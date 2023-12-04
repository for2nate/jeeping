import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _adminRecipient = prefs
              .getStringList('ff_adminRecipient')
              ?.map((path) => path.ref)
              .toList() ??
          _adminRecipient;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<DocumentReference> _adminRecipient = [
    FirebaseFirestore.instance.doc('/users/twiuRFEDvHZkvn7uG6b0dys2RSJ2'),
    FirebaseFirestore.instance.doc('/users/EVgk0W5SQVNVaunmNQ0vUXmfGIP2')
  ];
  List<DocumentReference> get adminRecipient => _adminRecipient;
  set adminRecipient(List<DocumentReference> _value) {
    _adminRecipient = _value;
    prefs.setStringList(
        'ff_adminRecipient', _value.map((x) => x.path).toList());
  }

  void addToAdminRecipient(DocumentReference _value) {
    _adminRecipient.add(_value);
    prefs.setStringList(
        'ff_adminRecipient', _adminRecipient.map((x) => x.path).toList());
  }

  void removeFromAdminRecipient(DocumentReference _value) {
    _adminRecipient.remove(_value);
    prefs.setStringList(
        'ff_adminRecipient', _adminRecipient.map((x) => x.path).toList());
  }

  void removeAtIndexFromAdminRecipient(int _index) {
    _adminRecipient.removeAt(_index);
    prefs.setStringList(
        'ff_adminRecipient', _adminRecipient.map((x) => x.path).toList());
  }

  void updateAdminRecipientAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _adminRecipient[_index] = updateFn(_adminRecipient[_index]);
    prefs.setStringList(
        'ff_adminRecipient', _adminRecipient.map((x) => x.path).toList());
  }

  void insertAtIndexInAdminRecipient(int _index, DocumentReference _value) {
    _adminRecipient.insert(_index, _value);
    prefs.setStringList(
        'ff_adminRecipient', _adminRecipient.map((x) => x.path).toList());
  }

  String _NameRoute = '';
  String get NameRoute => _NameRoute;
  set NameRoute(String _value) {
    _NameRoute = _value;
  }

  DocumentReference? _DropDownRoutes;
  DocumentReference? get DropDownRoutes => _DropDownRoutes;
  set DropDownRoutes(DocumentReference? _value) {
    _DropDownRoutes = _value;
  }

  List<DocumentReference> _DropDownCategories = [];
  List<DocumentReference> get DropDownCategories => _DropDownCategories;
  set DropDownCategories(List<DocumentReference> _value) {
    _DropDownCategories = _value;
  }

  void addToDropDownCategories(DocumentReference _value) {
    _DropDownCategories.add(_value);
  }

  void removeFromDropDownCategories(DocumentReference _value) {
    _DropDownCategories.remove(_value);
  }

  void removeAtIndexFromDropDownCategories(int _index) {
    _DropDownCategories.removeAt(_index);
  }

  void updateDropDownCategoriesAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _DropDownCategories[_index] = updateFn(_DropDownCategories[_index]);
  }

  void insertAtIndexInDropDownCategories(int _index, DocumentReference _value) {
    _DropDownCategories.insert(_index, _value);
  }

  List<DocumentReference> _DropDownService = [];
  List<DocumentReference> get DropDownService => _DropDownService;
  set DropDownService(List<DocumentReference> _value) {
    _DropDownService = _value;
  }

  void addToDropDownService(DocumentReference _value) {
    _DropDownService.add(_value);
  }

  void removeFromDropDownService(DocumentReference _value) {
    _DropDownService.remove(_value);
  }

  void removeAtIndexFromDropDownService(int _index) {
    _DropDownService.removeAt(_index);
  }

  void updateDropDownServiceAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _DropDownService[_index] = updateFn(_DropDownService[_index]);
  }

  void insertAtIndexInDropDownService(int _index, DocumentReference _value) {
    _DropDownService.insert(_index, _value);
  }

  DocumentReference? _DropDownCategoryHike;
  DocumentReference? get DropDownCategoryHike => _DropDownCategoryHike;
  set DropDownCategoryHike(DocumentReference? _value) {
    _DropDownCategoryHike = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
