import 'package:mobx/mobx.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/shared/models/item_model.dart';

part 'create_split_controller.g.dart';

class CreateSplitController = _CreateSplitControllerBase
    with _$CreateSplitController;

abstract class _CreateSplitControllerBase with Store {
  @observable
  int currentPage = 0;

  @observable
  EventModel event = EventModel();

  @action
  void nextPage() {
    if (currentPage < 2) {
      currentPage++;
    }
  }

  @action
  void backPage() {
    if (currentPage > 0) {
      currentPage--;
    }
  }

  @computed
  bool get enableNavigateButton {
    switch (currentPage) {
      case 0:
        return event.name.isNotEmpty;
      case 1:
        return event.friends.isNotEmpty;
      case 2:
        return event.items.isNotEmpty;
      default:
        return false;
    }
  }

  @action
  void onChanged(
      {String? name, List<ItemModel>? items, List<FriendModel>? friends}) {
    this.event = event.copyWith(name: name, items: items, friends: friends);
  }
}
