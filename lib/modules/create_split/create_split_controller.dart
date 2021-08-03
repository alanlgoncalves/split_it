import 'package:mobx/mobx.dart';
import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/shared/models/item_model.dart';

part 'create_split_controller.g.dart';

class CreateSplitController = _CreateSplitControllerBase
    with _$CreateSplitController;

abstract class _CreateSplitControllerBase with Store {
  @observable
  int currentPage = 0;

  @observable
  String eventName = "";

  @observable
  List<FriendModel> selectedFriends = [];

  @observable
  List<ItemModel> items = [];

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
        return eventName.isNotEmpty;
      case 1:
        return selectedFriends.isNotEmpty;
      case 2:
        return items.isNotEmpty;
      default:
        return false;
    }
  }

  @action
  void setEventName(String eventName) {
    this.eventName = eventName;
  }

  @action
  void setSelectedFriends(List<FriendModel> selectedFriends) {
    this.selectedFriends = selectedFriends;
  }

  @action
  void setItems(List<ItemModel> items) {
    this.items = items;
  }
}
