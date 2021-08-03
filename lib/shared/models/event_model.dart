import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/shared/models/item_model.dart';

class EventModel {
  final String name;
  final DateTime? createdAt;
  final double? value;
  final List<ItemModel> items;
  final List<FriendModel> friends;

  int get friendsQuantity => friends?.length ?? 0;

  EventModel({
    this.name = "",
    this.createdAt,
    this.value,
    this.items = const [],
    this.friends = const [],
  });

  EventModel copyWith({
    String? name,
    DateTime? createdAt,
    double? value,
    List<ItemModel>? items,
    List<FriendModel>? friends,
  }) {
    return EventModel(
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      value: value ?? this.value,
      items: items ?? this.items,
      friends: friends ?? this.friends,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'createdAt': createdAt,
      'value': value,
      'items': items?.map((x) => x.toMap()).toList(),
      'friends': friends?.map((x) => x.toMap()).toList(),
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      name: map['name'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      value: map['value'],
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
    return 'EventModel(name: $name, createdAt: $createdAt, value: $value, items: $items, friends: $friends)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EventModel &&
        other.name == name &&
        other.createdAt == createdAt &&
        other.value == value &&
        listEquals(other.items, items) &&
        listEquals(other.friends, friends);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        createdAt.hashCode ^
        value.hashCode ^
        items.hashCode ^
        friends.hashCode;
  }
}
