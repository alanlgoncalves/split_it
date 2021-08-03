import 'package:mobx/mobx.dart';
import 'package:split_it/shared/models/item_model.dart';
part 'step_three_controller.g.dart';

class StepThreeController = _StepThreeControllerBase with _$StepThreeController;

abstract class _StepThreeControllerBase with Store {
  @observable
  ObservableList<ItemModel> items = ObservableList.of([]);

  @observable
  ItemModel item = ItemModel();

  @computed
  int get currentIndex => items.length + 1;

  bool get showAddItemButton => item.name.isNotEmpty && item.value > 0;

  @action
  void addItem() {
    items.add(this.item);
    item = ItemModel();
  }

  @action
  void removeItem(int index) {
    items.removeAt(index);
  }

  @action
  void onChange({String? name, double? value}) {
    item = item.copyWith(name: name, value: value);
  }

  @action
  void editItem({required int index, String? name, double? value}) {
    items[index] = items[index].copyWith(name: name, value: value);
  }
}
