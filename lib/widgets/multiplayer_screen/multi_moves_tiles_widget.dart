import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle_map/providers.dart';
import 'package:puzzle_map/utils/puzzle_solver.dart';
import 'package:puzzle_map/widgets/solo_screen/moves_tiles_widget/moves_tiles_text.dart';

class MultiMovesTilesWidget extends StatelessWidget {
  const MultiMovesTilesWidget({
    Key? key,
    required PuzzleSolverClient solverClient,
    this.fontSize = 24,
  })  : _solverClient = solverClient,
        super(key: key);

  final PuzzleSolverClient _solverClient;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(multiPuzzleNotifierProvider(_solverClient));

        return state.when(
          () => MovesTilesText(
            moves: 0,
            tiles: 0,
            fontSize: fontSize,
          ),
          initializing: () => MovesTilesText(
            moves: 0,
            tiles: 0,
            fontSize: fontSize,
          ),
          current: (puzzleData) => MovesTilesText(
            moves: puzzleData.moves,
            tiles: puzzleData.tiles,
            fontSize: fontSize,
          ),
          solved: (puzzleData) => MovesTilesText(
            moves: puzzleData.moves,
            tiles: puzzleData.tiles,
            fontSize: fontSize,
          ),
          error: (_) => MovesTilesText(
            moves: 0,
            tiles: 0,
            fontSize: fontSize,
          ),
        );
      },
    );
  }
}
