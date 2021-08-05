import 'package:mobx/mobx.dart';
import 'package:split_it/modules/event_details/event_details_status.dart';
import 'package:split_it/shared/repositories/firebase_repository.dart';

part 'event_details_controller.g.dart';

class EventDetailsController = _EventDetailsControllerBase
    with _$EventDetailsController;

abstract class _EventDetailsControllerBase with Store {
  final FirebaseRepository firebaseRepository;

  _EventDetailsControllerBase({required this.firebaseRepository});

  @observable
  EventDetailsStatus status = EventDetailsStatus.empty;

  @action
  void update(EventDetailsStatus status) {
    this.status = status;
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
