// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EventDetailsController on _EventDetailsControllerBase, Store {
  final _$eventAtom = Atom(name: '_EventDetailsControllerBase.event');

  @override
  EventModel get event {
    _$eventAtom.reportRead();
    return super.event;
  }

  @override
  set event(EventModel value) {
    _$eventAtom.reportWrite(value, super.event, () {
      super.event = value;
    });
  }

  final _$statusAtom = Atom(name: '_EventDetailsControllerBase.status');

  @override
  EventDetailsStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(EventDetailsStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$_EventDetailsControllerBaseActionController =
      ActionController(name: '_EventDetailsControllerBase');

  @override
  void update(EventDetailsStatus status) {
    final _$actionInfo = _$_EventDetailsControllerBaseActionController
        .startAction(name: '_EventDetailsControllerBase.update');
    try {
      return super.update(status);
    } finally {
      _$_EventDetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateFriend(FriendModel friend) {
    final _$actionInfo = _$_EventDetailsControllerBaseActionController
        .startAction(name: '_EventDetailsControllerBase.updateFriend');
    try {
      return super.updateFriend(friend);
    } finally {
      _$_EventDetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
event: ${event},
status: ${status}
    ''';
  }
}
