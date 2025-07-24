import 'package:flutter/foundation.dart';

class NotificationService {
  int _unreadCount = 0;

  int getUnreadCount() {
    return _unreadCount;
  }

  void markAllAsRead() {
    _unreadCount = 0;
    debugPrint('Todas as notificações marcadas como lidas.');
  }

  void addNotification() {
    _unreadCount++;
    debugPrint('Nova notificação recebida. Total: $_unreadCount');
  }
}
