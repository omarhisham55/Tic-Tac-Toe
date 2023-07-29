abstract class GameStates {}

class InitialGameState extends GameStates {}

class ChangeTurnState extends GameStates {}

class RestartGameState extends GameStates {}

class EndGameState extends GameStates {
  String gameResult;
  EndGameState({required this.gameResult});
}
