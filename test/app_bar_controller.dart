import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mocktail/mocktail.dart';
import 'package:split_it/modules/home/models/dashboard_model.dart';
import 'package:split_it/modules/home/repositories/home_repository.dart';
import 'package:split_it/modules/home/widgets/app_bar/app_bar_controller.dart';
import 'package:split_it/modules/home/widgets/app_bar/app_bar_state.dart';

class AppBarControllerTest extends Mock implements HomeRepository {}

void main() {
  late AppBarController controller;
  late HomeRepository repository;

  setUp(() {
    repository = AppBarControllerTest();
    controller = AppBarController(repository: repository);
  });

  test("Testing getDashboard with Success", () async {
    expect(controller.state, isInstanceOf<AppBarStateEmpty>());

    final states = <AppBarState>[];

    mobx.autorun((_) {
      states.add(controller.state);
    });

    when(repository.getDashboard)
        .thenAnswer((_) async => DashboardModel(receive: 100, send: 101));

    await controller.getDashboard();

    expect(states[0], isInstanceOf<AppBarStateEmpty>());
    expect(states[1], isInstanceOf<AppBarStateLoading>());
    expect(states[2], isInstanceOf<AppBarStateSuccess>());
    expect(states.length, 3);
  });

  test("Testing getDashboard with Failure", () async {
    expect(controller.state, isInstanceOf<AppBarStateEmpty>());

    final states = <AppBarState>[];

    mobx.autorun((_) {
      states.add(controller.state);
    });

    when(repository.getDashboard).thenThrow("Error");

    await controller.getDashboard();

    expect(states[0], isInstanceOf<AppBarStateEmpty>());
    expect(states[1], isInstanceOf<AppBarStateFailure>());
    expect((states[1] as AppBarStateFailure).message, "Error");
    expect(states.length, 2);
  });
}
