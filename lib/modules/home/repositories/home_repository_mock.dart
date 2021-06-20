import 'package:split_it/modules/home/models/dashboard_model.dart';
import 'package:split_it/modules/home/repositories/home_repository.dart';
import 'package:split_it/shared/models/event_model.dart';

class HomeRepositoryMock extends HomeRepository {
  @override
  Future<DashboardModel> getDashboard() async {
    await Future.delayed(Duration(seconds: 2));

    return DashboardModel(receive: 100.01, send: 48.50);
  }

  @override
  Future<List<EventModel>> getEvents() async {
    await Future.delayed(Duration(seconds: 2));

    return [
      EventModel(
        title: "Churrasco",
        createdAt: DateTime.now(),
        value: 32.50,
        friends: 1,
      ),
      EventModel(
        title: "Churrasco",
        createdAt: DateTime.now(),
        value: -32.50,
        friends: 1,
      ),
      EventModel(
        title: "Churrasco",
        createdAt: DateTime.now(),
        value: 32.50,
        friends: 1,
      ),
      EventModel(
        title: "Churrasco",
        createdAt: DateTime.now(),
        value: -32.50,
        friends: 1,
      ),
      EventModel(
        title: "Churrasco",
        createdAt: DateTime.now(),
        value: 32.50,
        friends: 1,
      ),
      EventModel(
        title: "Churrasco",
        createdAt: DateTime.now(),
        value: 32.50,
        friends: 1,
      ),
      EventModel(
        title: "Churrasco",
        createdAt: DateTime.now(),
        value: 32.50,
        friends: 1,
      ),
      EventModel(
        title: "Churrasco",
        createdAt: DateTime.now(),
        value: -32.50,
        friends: 1,
      ),
      EventModel(
        title: "Churrasco",
        createdAt: DateTime.now(),
        value: 32.50,
        friends: 1,
      ),
    ];
  }
}
