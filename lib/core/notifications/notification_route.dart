import '../navigation/app_routes.dart';

class NotificationRoute {
  const NotificationRoute._();

  static String? fromPayload(String? payload) {
    if (payload == null || payload.isEmpty) return null;
    final uri = Uri.tryParse(payload);
    if (uri == null) return null;
    if (uri.scheme == 'immortal' && uri.host == 'quest') {
      final questKey = uri.pathSegments.firstOrNull;
      if (questKey != null && questKey.isNotEmpty) {
        return AppRoutes.questDetails(Uri.encodeComponent(questKey));
      }
    }
    return null;
  }
}

extension<T> on List<T> {
  T? get firstOrNull => isEmpty ? null : first;
}
