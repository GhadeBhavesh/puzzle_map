import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle_map/application/notifiers/puzzle_type_notifier.dart';
import 'package:puzzle_map/application/states/puzzle_state.dart';
import 'package:puzzle_map/providers.dart';
// import 'package:puzzle_map/screens/multiplayer/multiplayer_screen.dart';
import 'package:puzzle_map/screens/photo/photo_screen.dart';
import 'package:puzzle_map/screens/solo/solo_screen.dart';
import 'package:puzzle_map/utils/puzzle_solver.dart';
import 'package:rive/rive.dart';

import '../../models/puzzle_data.dart';

class PuzzleStarterScreen extends ConsumerStatefulWidget {
  const PuzzleStarterScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SoloScreenState();
}

class _SoloScreenState extends ConsumerState<PuzzleStarterScreen> {
  late final PuzzleSolverClient _solverClient;
  late RiveAnimationController _riveController;
  final int _puzzleSize = 3;
  late final PuzzleData _initialPuzzleData;
  // final String _puzzleType = 'Photo';

  @override
  void initState() {
    _riveController = SimpleAnimation('idle');
    _solverClient = PuzzleSolverClient(size: _puzzleSize);
    _initialPuzzleData = ref
        .read(puzzleNotifierProvider(_solverClient).notifier)
        .generateInitialPuzzle();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(puzzleNotifierProvider(_solverClient),
        (previous, PuzzleState next) {
      if (next is PuzzleSolved) {
        ref.read(timerNotifierProvider.notifier).stopTimer();
      }
    });

    final currentPuzzleType = ref.watch(puzzleTypeNotifierProvider);

    final name = currentPuzzleType.name[0].toUpperCase() +
        currentPuzzleType.name.substring(1);

    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child: currentPuzzleType == PuzzleType.normal
            ? SoloScreen(
                solverClient: _solverClient,
                initialPuzzleData: _initialPuzzleData,
                puzzleSize: _puzzleSize,
                puzzleType: name,
                riveController: _riveController,
              )
            : PhotoScreen(
                solverClient: _solverClient,
                initialPuzzleData: _initialPuzzleData,
                puzzleSize: _puzzleSize,
                puzzleType: name,
                riveController: _riveController,
              ));
  }
}
