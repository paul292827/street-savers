import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'shops_record.g.dart';

abstract class ShopsRecord implements Built<ShopsRecord, ShopsRecordBuilder> {
  static Serializer<ShopsRecord> get serializer => _$shopsRecordSerializer;

  @nullable
  String get address;

  @nullable
  LatLng get location;

  @nullable
  String get name;

  @nullable
  @BuiltValueField(wireName: 'shop_id')
  String get shopId;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ShopsRecordBuilder builder) => builder
    ..address = ''
    ..name = ''
    ..shopId = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('shops');

  static Stream<ShopsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ShopsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ShopsRecord._();
  factory ShopsRecord([void Function(ShopsRecordBuilder) updates]) =
      _$ShopsRecord;

  static ShopsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createShopsRecordData({
  String address,
  LatLng location,
  String name,
  String shopId,
}) =>
    serializers.toFirestore(
        ShopsRecord.serializer,
        ShopsRecord((s) => s
          ..address = address
          ..location = location
          ..name = name
          ..shopId = shopId));
