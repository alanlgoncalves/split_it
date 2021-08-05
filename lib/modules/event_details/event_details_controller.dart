import 'package:mobx/mobx.dart';
import 'package:split_it/modules/event_details/event_details_status.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/shared/repositories/firebase_repository.dart';

part 'event_details_controller.g.dart';

class EventDetailsController = _EventDetailsControllerBase
    with _$EventDetailsController;

abstract class _EventDetailsControllerBase with Store {
  final FirebaseRepository firebaseRepository;

  @observable
  EventModel event;

  @observable
  EventDetailsStatus status = EventDetailsStatus.empty;

  _EventDetailsControllerBase(
      {required this.firebaseRepository, required this.event});

  @action
  void update(EventDetailsStatus status) {
    this.status = status;
  }

  @action
  void updateFriend(FriendModel friend) {
    final index = this.event.friends.indexWhere((element) => element == friend);
    final friends = event.friends;
    friends[index] = friend;

    event = event.copyWith(friends: friends);
  }

  Future<void> delete(String id) async {
    update(EventDetailsStatus.loading);

    final deleted =
        await this.firebaseRepository.delete(id: id, collection: "events");

    if (deleted) {
      update(EventDetailsStatus.success);
    } else {
      update(EventDetailsStatus.error);
    }
  }
}
