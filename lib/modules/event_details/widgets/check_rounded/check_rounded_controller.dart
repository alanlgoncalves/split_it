import 'package:mobx/mobx.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/shared/repositories/firebase_repository.dart';
part 'check_rounded_controller.g.dart';

enum CheckRoundedStatus { empty, loading, error, success }

class CheckRoundedController = _CheckRoundedControllerBase
    with _$CheckRoundedController;

abstract class _CheckRoundedControllerBase with Store {
  final FirebaseRepository repository;
  final EventModel event;

  @observable
  late CheckRoundedStatus status;

  _CheckRoundedControllerBase(
      {required this.repository, required this.event, required this.status});

  @action
  Future<void> update({required FriendModel friend}) async {
    try {
      status = CheckRoundedStatus.loading;

      final friends = event.friends;
      final friendIndex = friends.indexWhere((element) => element == friend);
      final isPaid = !friends[friendIndex].isPaid;
      friends[friendIndex] = friends[friendIndex].copyWith(isPaid: isPaid);
      final model = event.copyWith(friends: friends);

      await repository.update(id: event.id, model: model);

      if (isPaid) {
        status = CheckRoundedStatus.success;
      } else {
        status = CheckRoundedStatus.empty;
      }
    } catch (e) {
      status = CheckRoundedStatus.error;
    }
  }
}
