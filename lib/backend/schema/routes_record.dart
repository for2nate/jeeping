import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoutesRecord extends FirestoreRecord {
  RoutesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "MainImage" field.
  String? _mainImage;
  String get mainImage => _mainImage ?? '';
  bool hasMainImage() => _mainImage != null;

  // "OtherImages" field.
  List<String>? _otherImages;
  List<String> get otherImages => _otherImages ?? const [];
  bool hasOtherImages() => _otherImages != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "CategoriesRef" field.
  List<DocumentReference>? _categoriesRef;
  List<DocumentReference> get categoriesRef => _categoriesRef ?? const [];
  bool hasCategoriesRef() => _categoriesRef != null;

  // "Services" field.
  List<DocumentReference>? _services;
  List<DocumentReference> get services => _services ?? const [];
  bool hasServices() => _services != null;

  // "Duration" field.
  double? _duration;
  double get duration => _duration ?? 0.0;
  bool hasDuration() => _duration != null;

  // "Published" field.
  bool? _published;
  bool get published => _published ?? false;
  bool hasPublished() => _published != null;

  void _initializeFields() {
    _mainImage = snapshotData['MainImage'] as String?;
    _otherImages = getDataList(snapshotData['OtherImages']);
    _name = snapshotData['Name'] as String?;
    _description = snapshotData['Description'] as String?;
    _categoriesRef = getDataList(snapshotData['CategoriesRef']);
    _services = getDataList(snapshotData['Services']);
    _duration = castToType<double>(snapshotData['Duration']);
    _published = snapshotData['Published'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Routes');

  static Stream<RoutesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RoutesRecord.fromSnapshot(s));

  static Future<RoutesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RoutesRecord.fromSnapshot(s));

  static RoutesRecord fromSnapshot(DocumentSnapshot snapshot) => RoutesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RoutesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RoutesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RoutesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RoutesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRoutesRecordData({
  String? mainImage,
  String? name,
  String? description,
  double? duration,
  bool? published,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'MainImage': mainImage,
      'Name': name,
      'Description': description,
      'Duration': duration,
      'Published': published,
    }.withoutNulls,
  );

  return firestoreData;
}

class RoutesRecordDocumentEquality implements Equality<RoutesRecord> {
  const RoutesRecordDocumentEquality();

  @override
  bool equals(RoutesRecord? e1, RoutesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.mainImage == e2?.mainImage &&
        listEquality.equals(e1?.otherImages, e2?.otherImages) &&
        e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.categoriesRef, e2?.categoriesRef) &&
        listEquality.equals(e1?.services, e2?.services) &&
        e1?.duration == e2?.duration &&
        e1?.published == e2?.published;
  }

  @override
  int hash(RoutesRecord? e) => const ListEquality().hash([
        e?.mainImage,
        e?.otherImages,
        e?.name,
        e?.description,
        e?.categoriesRef,
        e?.services,
        e?.duration,
        e?.published
      ]);

  @override
  bool isValidKey(Object? o) => o is RoutesRecord;
}
