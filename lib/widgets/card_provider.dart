import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:fluttertoast/fluttertoast.dart';

enum CardStatus { like, dislike, superlike, superdislike }

class CardProvider extends ChangeNotifier {
  List<String> _imageUrls = [];
  bool _isDragging = false;
  Offset _position = Offset.zero; // position of image
  Size _screenSize = Size.zero;
  double _angle = 0;

  List<String> get imageUrls => _imageUrls;
  bool get isDragging => _isDragging;
  Offset get position => _position;
  void setScreenSize(Size screenSize) => _screenSize = screenSize;
  double get angle => _angle;

  CardProvider() {
    resetUsers();
  }

  void startPosition(DragStartDetails details) {
    _isDragging = true;

    notifyListeners();
  }

  void updatePosition(DragUpdateDetails details) {
    _position += details.delta;

    final x = _position.dx;
    _angle = x / _screenSize.width;

    notifyListeners();
  }

  void endPosition() {
    _isDragging = false;
    notifyListeners();

    final status = getStatus();

    if (status != null) {
      Fluttertoast.cancel();
      Fluttertoast.showToast(
        msg: status.toString().split('.').last.toLowerCase(),
        fontSize: 36,
      );
    }

    switch (status) {
      case CardStatus.like:
        like();
        break;
      case CardStatus.dislike:
        dislike();
        break;
      // case CardStatus.superlike:
      //   superlike();
      //   break;
      // case CardStatus.superdislike:
      //   superdislike();
      //   break;
      default:
        resetPosition();
    }
  }

  void resetPosition() {
    _isDragging = false;
    _position = Offset.zero;
    _angle = 0;

    notifyListeners();
  }

  CardStatus? getStatus() {
    final x = _position.dx;
    final y = _position.dy;
    final forceSuperLike = x.abs() < 20;
    final forceSuperDislike = y.abs() > 20;

    final delta = 100;

    if (y <= -delta / 2 && forceSuperLike) {
      return CardStatus.dislike;
    } else if (y >= delta / 2 && forceSuperDislike) {
      return CardStatus.like;
    }
  }

  void dislike() {
    // _angle = -20;
    // _position -= Offset(2 * _screenSize.width, 0);
    _angle = 0;
    _position -= Offset(0, _screenSize.height);
    _nextCard();

    notifyListeners();
  }

  void like() {
    // _angle = 20;
    // _position += Offset(2 * _screenSize.width, 0);
    _angle = 0;
    _position += Offset(0, _screenSize.height);
    _nextCard();

    notifyListeners();
  }

  // void superlike() {
  //   _angle = 0;
  //   _position -= Offset(0, _screenSize.height);
  //   _nextCard();

  //   notifyListeners();
  // }

  // void superdislike() {
  //   _angle = 0;
  //   _position += Offset(2, _screenSize.height);
  //   _nextCard();

  //   notifyListeners();
  // }

  Future _nextCard() async {
    if (_imageUrls.isEmpty) return;

    await Future.delayed(const Duration(
      milliseconds: 500,
    ));
    _imageUrls.removeLast();

    resetPosition();
  }

  void resetUsers() {
    _imageUrls = <String>[
      'https://images.unsplash.com/photo-1616012367641-fdc2caa22cb0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      'https://images.unsplash.com/photo-1522529599102-193c0d76b5b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      'https://images.unsplash.com/photo-1552793084-49132af00ff1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80',
      'https://images.unsplash.com/photo-1589317621382-0cbef7ffcc4c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      'https://images.unsplash.com/photo-1563452965085-2e77e5bf2607?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      'https://images.unsplash.com/photo-1614701466929-766271250d48?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
      'https://images.unsplash.com/photo-1523297736436-356615162cc8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
      'https://images.unsplash.com/photo-1490551632573-78c6c247f5d3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80',
    ].reversed.toList();

    notifyListeners();
  }
}
