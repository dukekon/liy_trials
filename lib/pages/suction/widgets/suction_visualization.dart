import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class SuctionVisualization extends StatefulWidget {
  const SuctionVisualization(
      {required this.state,
      required this.position,
      required this.changePosition,
      Key? key})
      : super(key: key);

  final ValueNotifier<bool> state;
  final ValueNotifier<String> position;
  final Function(String position) changePosition;

  @override
  State<SuctionVisualization> createState() => _SuctionVisualizationState();
}

class _SuctionVisualizationState extends State<SuctionVisualization> {
  Artboard? _artboard;
  late StateMachineController _controller;
  late SMITrigger _isStarted;
  late SMITrigger _isReset;
  late SMIBool _isThroat;
  late SMIBool _isTrachea;
  late SMIBool _isLung;
  late SMIBool _isMaw;

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/animation.riv').then((data) async {
      final file = RiveFile.import(data);
      Artboard artboard = file.mainArtboard;
      _controller = StateMachineController.fromArtboard(artboard, 'ani_state')!;
      artboard.addController(_controller);
      setState(() {
        _isStarted = _controller.findInput<bool>('start') as SMITrigger;
        _isReset = _controller.findInput<bool>('reset') as SMITrigger;
        _isThroat = _controller.findInput<bool>('throat') as SMIBool;
        _isTrachea = _controller.findInput<bool>('trachea') as SMIBool;
        _isLung = _controller.findInput<bool>('lung') as SMIBool;
        _isMaw = _controller.findInput<bool>('maw') as SMIBool;
        _artboard = artboard;
        print('init ready!');
      });
      widget.state.addListener(_onChangeStart);
      widget.position.addListener(_onChangePosition);
    });
  }

  void _onChangeStart() {
    if (widget.state.value) {
      _isStarted.fire();
    } else {
      _isReset.fire();
    }
    _isThroat.value = false;
    _isTrachea.value = false;
    _isLung.value = false;
    _isMaw.value = false;
  }

  void _onChangePosition() {
    if (widget.state.value) {
      switch (widget.position.value) {
        case 'throat':
          _isThroat.value = true;
          widget.changePosition('Throat');
          break;
        case 'no throat':
          _isThroat.value = false;
          widget.changePosition('Not Enter');
          break;
        case 'trachea':
          _isTrachea.value = true;
          widget.changePosition('Trachea');
          break;
        case 'no trachea':
          _isTrachea.value = false;
          widget.changePosition('Throat');
          break;
        case 'lung':
          _isLung.value = true;
          widget.changePosition('Throat');
          break;
        case 'no lung':
          _isLung.value = false;
          widget.changePosition('Trachea');
          break;
        case 'maw':
          _isMaw.value = true;
          widget.changePosition('maw');
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return _artboard == null
        ? const SizedBox(height: 300)
        : Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            height: 300,
            child: Rive(
              artboard: _artboard!,
              fit: BoxFit.fitHeight,
            ),
          );
  }
}
