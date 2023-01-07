import 'package:flutter/services.dart';

/// 安卓物理按键
class AndroidPhysicalButtons {
  static bool _bound = false;
  static late EventChannel _channel;
  static final Set<Handler> _handlers = {};

  /// 监听
  /// @param handler 处理函数
  static void listen(Handler handler) {
    _handlers.add(handler);

    if (!_bound) {
      _channel = const EventChannel('android_physical_buttons');
      _channel.receiveBroadcastStream().listen(_handleEvent);

      _bound = true;
    }
  }

  /// 处理事件
  /// @param event 事件
  static void _handleEvent(dynamic event) {
    for (var a in _handlers) {
      switch (event) {
        case 'power':
          a(Key.power);
          break;
        case 'volume':
          a(Key.volume);
          break;
      }
    }
  }
}

/// 按键
enum Key { power, volume }

typedef Handler = void Function(Key key);
