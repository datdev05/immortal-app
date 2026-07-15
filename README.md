# Hệ Thống Tu Tiên — Mobile

Flutter client for Android and iOS. The native application identifier is
`com.tomdotnet.immortal` and the default locale/timezone are `vi` and
`Asia/Ho_Chi_Minh`.

## Foundation

The reusable architecture was adapted as a source snapshot from
`DPUnity.AppMobileBase` commit `f0ac975`. DPUnity-specific screens, endpoints,
models, branding, and workflows were intentionally excluded.

Included foundations:

- BLoC-managed locale and theme preferences;
- Vietnamese/English ARB localization;
- central navigation and notification deep-link parsing;
- Dio API client with secure bearer-token storage and 401 cleanup;
- local notification initialization, reusable themes, and common states;
- feature-first screens ready for the authentication and cultivation domains.

Firebase push messaging is not initialized until product Firebase credentials
are supplied. Notifications are reminders only; quest state remains controlled
by the backend.

## Run

The API defaults to `http://localhost:5014`. Override it per environment:

```sh
flutter run --dart-define=API_BASE_URL=https://api.example.com
```

For an Android emulator, use an address reachable from the emulator rather
than host `localhost` (commonly `http://10.0.2.2:5014`).

Quality checks:

```sh
flutter analyze
flutter test
```
