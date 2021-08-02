import 'package:mobx/mobx.dart';
import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/shared/repositories/firebase_repository.dart';
part 'step_two_controller.g.dart';

class StepTwoController = _StepTwoControllerBase with _$StepTwoController;

abstract class _StepTwoControllerBase with Store {
  final repository = FirebaseRepository();

  @observable
  List<FriendModel> _friends = [];

  @observable
  ObservableList<FriendModel> _selectedFriends = ObservableList.of([]);

  List<FriendModel> get selectedFriends => _selectedFriends;

  @observable
  String search = "";

  @action
  void onChange(String value) {
    search = value;
  }

  @action
  void addFriend(FriendModel friend) {
    _selectedFriends.add(friend);
  }

  @action
  void removeFriend(FriendModel friend) {
    _selectedFriends.remove(friend);
  }

  @computed
  List<FriendModel> get items {
    return _friends.where((friend) {
      final validateName =
          friend.name.toString().toLowerCase().contains(search.toLowerCase());

      final friendIsNotSelected = !_selectedFriends.contains(friend);

      return validateName && friendIsNotSelected;
    }).toList();
  }

  @action
  Future<void> getFriends() async {
    final response = await this.repository.get("friends");

    _friends = response.map((e) => FriendModel.fromMap(e)).toList();
  }
}
