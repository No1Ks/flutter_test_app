abstract class HomeEvent {
  const HomeEvent();
}

class HomeLoadDataEvent extends HomeEvent {
  final String? search;
  final int? nextPage;

  const HomeLoadDataEvent({this.search, this.nextPage});
}
