import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mocktail/mocktail.dart';
import 'package:split_it/modules/home/home_controller.dart';
import 'package:split_it/modules/home/home_state.dart';
import 'package:split_it/modules/home/repositories/home_repository.dart';
import 'package:split_it/shared/models/event_model.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

void main() {
  late HomeController controller;
  late HomeRepository repository;

  setUp(() {
    repository = HomeRepositoryMock();
    controller = HomeController(repository: repository);
  });

  test("Testing getEvents with Success", () async {
    expect(controller.state, isInstanceOf<HomeStateEmpty>());

    final states = <HomeState>[];

    mobx.autorun((_) {
      states.add(controller.state);
    });

    when(repository.getEvents).thenAnswer((_) async =>
        [EventModel(name: "", createdAt: DateTime.now(), value: 100.00)]);

    await controller.getEvents();

    expect(states[0], isInstanceOf<HomeStateEmpty>());
    expect(states[1], isInstanceOf<HomeStateLoading>());
    expect(states[2], isInstanceOf<HomeStateSuccess>());
    expect(states.length, 3);
  });

  test("Testing getEvents with Failure", () async {
    expect(controller.state, isInstanceOf<HomeStateEmpty>());

    final states = <HomeState>[];

    mobx.autorun((_) {
      states.add(controller.state);
    });

    when(repository.getEvents).thenThrow("Error");

    await controller.getEvents();

    expect(states[0], isInstanceOf<HomeStateEmpty>());
    expect(states[1], isInstanceOf<HomeStateFailure>());
    expect((states[1] as HomeStateFailure).message, "Error");
    expect(states.length, 2);
  });
}
