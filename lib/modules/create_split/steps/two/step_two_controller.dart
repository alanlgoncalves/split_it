import 'package:mobx/mobx.dart';
import 'package:split_it/shared/models/repositories/firebase_repository.dart';
part 'step_two_controller.g.dart';

class StepTwoController = _StepTwoControllerBase with _$StepTwoController;

abstract class _StepTwoControllerBase with Store {
  final repository = FirebaseRepository();

  @observable
  List<Map<String, dynamic>> _friends = [];

  @observable
  String search = "";

  @action
  void onChange(String value) {
    search = value;
  }

  @computed
  List<Map<String, dynamic>> get items {
    if (search.isEmpty) {
      return _friends;
    } else {
      final filteredList = _friends
          .where((element) => element['name'].contains(search))
          .toList();

      return filteredList;
    }
  }

  @action
  Future<void> getFriends() async {
    final response = await this.repository.get("friends");

    _friends = response;
  }
}
