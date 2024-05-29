abstract class LikeEvent {
  const LikeEvent();
}

class LoadLikesEvent extends LikeEvent {
  const LoadLikesEvent();
}

class ChangeLikeEvent extends LikeEvent {
  final String id;

  const ChangeLikeEvent(this.id);
}
