import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReviewsRecord extends FirestoreRecord {
  ReviewsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Author" field.
  DocumentReference? _author;
  DocumentReference? get author => _author;
  bool hasAuthor() => _author != null;

  // "Guide" field.
  DocumentReference? _guide;
  DocumentReference? get guide => _guide;
  bool hasGuide() => _guide != null;

  // "TextReview" field.
  String? _textReview;
  String get textReview => _textReview ?? '';
  bool hasTextReview() => _textReview != null;

  // "Date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "Grade" field.
  int? _grade;
  int get grade => _grade ?? 0;
  bool hasGrade() => _grade != null;

  void _initializeFields() {
    _author = snapshotData['Author'] as DocumentReference?;
    _guide = snapshotData['Guide'] as DocumentReference?;
    _textReview = snapshotData['TextReview'] as String?;
    _date = snapshotData['Date'] as DateTime?;
    _grade = castToType<int>(snapshotData['Grade']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Reviews');

  static Stream<ReviewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReviewsRecord.fromSnapshot(s));

  static Future<ReviewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReviewsRecord.fromSnapshot(s));

  static ReviewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReviewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReviewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReviewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReviewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReviewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReviewsRecordData({
  DocumentReference? author,
  DocumentReference? guide,
  String? textReview,
  DateTime? date,
  int? grade,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Author': author,
      'Guide': guide,
      'TextReview': textReview,
      'Date': date,
      'Grade': grade,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReviewsRecordDocumentEquality implements Equality<ReviewsRecord> {
  const ReviewsRecordDocumentEquality();

  @override
  bool equals(ReviewsRecord? e1, ReviewsRecord? e2) {
    return e1?.author == e2?.author &&
        e1?.guide == e2?.guide &&
        e1?.textReview == e2?.textReview &&
        e1?.date == e2?.date &&
        e1?.grade == e2?.grade;
  }

  @override
  int hash(ReviewsRecord? e) => const ListEquality()
      .hash([e?.author, e?.guide, e?.textReview, e?.date, e?.grade]);

  @override
  bool isValidKey(Object? o) => o is ReviewsRecord;
}
