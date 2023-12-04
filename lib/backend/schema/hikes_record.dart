import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HikesRecord extends FirestoreRecord {
  HikesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "NumberOfParticipants" field.
  int? _numberOfParticipants;
  int get numberOfParticipants => _numberOfParticipants ?? 0;
  bool hasNumberOfParticipants() => _numberOfParticipants != null;

  // "DeparturePlace" field.
  String? _departurePlace;
  String get departurePlace => _departurePlace ?? '';
  bool hasDeparturePlace() => _departurePlace != null;

  // "Guide" field.
  DocumentReference? _guide;
  DocumentReference? get guide => _guide;
  bool hasGuide() => _guide != null;

  // "Price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "Route" field.
  DocumentReference? _route;
  DocumentReference? get route => _route;
  bool hasRoute() => _route != null;

  // "Participants" field.
  List<DocumentReference>? _participants;
  List<DocumentReference> get participants => _participants ?? const [];
  bool hasParticipants() => _participants != null;

  // "Category" field.
  DocumentReference? _category;
  DocumentReference? get category => _category;
  bool hasCategory() => _category != null;

  void _initializeFields() {
    _date = snapshotData['Date'] as DateTime?;
    _numberOfParticipants =
        castToType<int>(snapshotData['NumberOfParticipants']);
    _departurePlace = snapshotData['DeparturePlace'] as String?;
    _guide = snapshotData['Guide'] as DocumentReference?;
    _price = castToType<int>(snapshotData['Price']);
    _route = snapshotData['Route'] as DocumentReference?;
    _participants = getDataList(snapshotData['Participants']);
    _category = snapshotData['Category'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Hikes');

  static Stream<HikesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HikesRecord.fromSnapshot(s));

  static Future<HikesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HikesRecord.fromSnapshot(s));

  static HikesRecord fromSnapshot(DocumentSnapshot snapshot) => HikesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HikesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HikesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HikesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HikesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHikesRecordData({
  DateTime? date,
  int? numberOfParticipants,
  String? departurePlace,
  DocumentReference? guide,
  int? price,
  DocumentReference? route,
  DocumentReference? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Date': date,
      'NumberOfParticipants': numberOfParticipants,
      'DeparturePlace': departurePlace,
      'Guide': guide,
      'Price': price,
      'Route': route,
      'Category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class HikesRecordDocumentEquality implements Equality<HikesRecord> {
  const HikesRecordDocumentEquality();

  @override
  bool equals(HikesRecord? e1, HikesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.date == e2?.date &&
        e1?.numberOfParticipants == e2?.numberOfParticipants &&
        e1?.departurePlace == e2?.departurePlace &&
        e1?.guide == e2?.guide &&
        e1?.price == e2?.price &&
        e1?.route == e2?.route &&
        listEquality.equals(e1?.participants, e2?.participants) &&
        e1?.category == e2?.category;
  }

  @override
  int hash(HikesRecord? e) => const ListEquality().hash([
        e?.date,
        e?.numberOfParticipants,
        e?.departurePlace,
        e?.guide,
        e?.price,
        e?.route,
        e?.participants,
        e?.category
      ]);

  @override
  bool isValidKey(Object? o) => o is HikesRecord;
}
