import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/shared/models/item_model.dart';

import 'base_model.dart';

class EventModel extends BaseModel {
  final String id;
  final String name;
  final DateTime? createdAt;
  final double value;
  final double paidValue;
  final List<ItemModel> items;
  final List<FriendModel> friends;

  int get friendsQuantity => friends.length;

  double get splitValue => itemsValue / friends.length;
  double get remainingValue =>
      value -
      friends.where((friend) => friend.isPaid).toList().length * splitValue;

  double get itemsValue => items.isNotEmpty
      ? items.map((e) => e.value).reduce((e1, e2) => e1 + e2)
      : 0;

  EventModel({
    this.id = "",
    this.name = "",
    this.createdAt,
    this.value = 0,
    this.paidValue = 0,
    this.items = const [],
    this.friends = const [],
  });

  EventModel copyWith({
    String? name,
    DateTime? createdAt,
    double? value,
    double? paidValue,
    List<ItemModel>? items,
    List<FriendModel>? friends,
  }) {
    return EventModel(
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      value: itemsValue,
      paidValue: paidValue ?? this.paidValue,
      items: items ?? this.items,
      friends: friends ?? this.friends,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'createdAt': FieldValue.serverTimestamp(),
      'paidValue': paidValue,
      'value': itemsValue,
      'items': items.map((x) => x.toMap()).toList(),
      'friends': friends.map((x) => x.toMap()).toList(),
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'],
      name: map['name'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      value: map['value'],
      paidValue: map['paidValue'] ?? 0,
      items:
          List<ItemModel>.from(map['items']?.map((x) => ItemModel.fromMap(x))),
      friends: List<FriendModel>.from(
          map['friends']?.map((x) => FriendModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) =>
      EventModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EventModel(id: $id, name: $name, createdAt: $createdAt, value: $value, paidValue: $paidValue, items: $items, friends: $friends)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EventModel &&
        other.id == id &&
        other.name == name &&
        other.createdAt == createdAt &&
        other.value == value &&
        other.paidValue == paidValue &&
        listEquals(other.items, items) &&
        listEquals(other.friends, friends);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        createdAt.hashCode ^
        value.hashCode ^
        paidValue.hashCode ^
        items.hashCode ^
        friends.hashCode;
  }

  @override
  String get collection => "events";
}
