import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "paid" field.
  bool? _paid;
  bool get paid => _paid ?? false;
  bool hasPaid() => _paid != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "payment_id" field.
  String? _paymentId;
  String get paymentId => _paymentId ?? '';
  bool hasPaymentId() => _paymentId != null;

  // "Created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "buyer" field.
  DocumentReference? _buyer;
  DocumentReference? get buyer => _buyer;
  bool hasBuyer() => _buyer != null;

  // "route" field.
  DocumentReference? _route;
  DocumentReference? get route => _route;
  bool hasRoute() => _route != null;

  // "hike" field.
  DocumentReference? _hike;
  DocumentReference? get hike => _hike;
  bool hasHike() => _hike != null;

  void _initializeFields() {
    _paid = snapshotData['paid'] as bool?;
    _price = castToType<int>(snapshotData['price']);
    _paymentId = snapshotData['payment_id'] as String?;
    _createdAt = snapshotData['Created_at'] as DateTime?;
    _buyer = snapshotData['buyer'] as DocumentReference?;
    _route = snapshotData['route'] as DocumentReference?;
    _hike = snapshotData['hike'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  bool? paid,
  int? price,
  String? paymentId,
  DateTime? createdAt,
  DocumentReference? buyer,
  DocumentReference? route,
  DocumentReference? hike,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'paid': paid,
      'price': price,
      'payment_id': paymentId,
      'Created_at': createdAt,
      'buyer': buyer,
      'route': route,
      'hike': hike,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    return e1?.paid == e2?.paid &&
        e1?.price == e2?.price &&
        e1?.paymentId == e2?.paymentId &&
        e1?.createdAt == e2?.createdAt &&
        e1?.buyer == e2?.buyer &&
        e1?.route == e2?.route &&
        e1?.hike == e2?.hike;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.paid,
        e?.price,
        e?.paymentId,
        e?.createdAt,
        e?.buyer,
        e?.route,
        e?.hike
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
