import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "GuideDescription" field.
  String? _guideDescription;
  String get guideDescription => _guideDescription ?? '';
  bool hasGuideDescription() => _guideDescription != null;

  // "GuideRating" field.
  double? _guideRating;
  double get guideRating => _guideRating ?? 0.0;
  bool hasGuideRating() => _guideRating != null;

  // "IsGuide" field.
  bool? _isGuide;
  bool get isGuide => _isGuide ?? false;
  bool hasIsGuide() => _isGuide != null;

  // "IsAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "GuideNumberOfGrades" field.
  int? _guideNumberOfGrades;
  int get guideNumberOfGrades => _guideNumberOfGrades ?? 0;
  bool hasGuideNumberOfGrades() => _guideNumberOfGrades != null;

  // "Reviews" field.
  List<DocumentReference>? _reviews;
  List<DocumentReference> get reviews => _reviews ?? const [];
  bool hasReviews() => _reviews != null;

  // "BookedHikes" field.
  List<DocumentReference>? _bookedHikes;
  List<DocumentReference> get bookedHikes => _bookedHikes ?? const [];
  bool hasBookedHikes() => _bookedHikes != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _guideDescription = snapshotData['GuideDescription'] as String?;
    _guideRating = castToType<double>(snapshotData['GuideRating']);
    _isGuide = snapshotData['IsGuide'] as bool?;
    _isAdmin = snapshotData['IsAdmin'] as bool?;
    _guideNumberOfGrades = castToType<int>(snapshotData['GuideNumberOfGrades']);
    _reviews = getDataList(snapshotData['Reviews']);
    _bookedHikes = getDataList(snapshotData['BookedHikes']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? guideDescription,
  double? guideRating,
  bool? isGuide,
  bool? isAdmin,
  int? guideNumberOfGrades,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'GuideDescription': guideDescription,
      'GuideRating': guideRating,
      'IsGuide': isGuide,
      'IsAdmin': isAdmin,
      'GuideNumberOfGrades': guideNumberOfGrades,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.guideDescription == e2?.guideDescription &&
        e1?.guideRating == e2?.guideRating &&
        e1?.isGuide == e2?.isGuide &&
        e1?.isAdmin == e2?.isAdmin &&
        e1?.guideNumberOfGrades == e2?.guideNumberOfGrades &&
        listEquality.equals(e1?.reviews, e2?.reviews) &&
        listEquality.equals(e1?.bookedHikes, e2?.bookedHikes);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.guideDescription,
        e?.guideRating,
        e?.isGuide,
        e?.isAdmin,
        e?.guideNumberOfGrades,
        e?.reviews,
        e?.bookedHikes
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
