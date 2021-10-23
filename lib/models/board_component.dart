class GameBoardModel {
  int position;
  String state;
  List? list;

  GameBoardModel({
    required this.position,
    required this.state,
    this.list,
  });
}
