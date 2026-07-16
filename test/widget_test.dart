import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:immortal_app/app/app.dart';
import 'package:immortal_app/app/app_cubit.dart';
import 'package:immortal_app/core/storage/preferences_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('shows the Vietnamese-first cultivation shell', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final preferences = PreferencesStore(await SharedPreferences.getInstance());

    await tester.pumpWidget(
      BlocProvider(
        create: (_) => AppCubit(preferences)..restore(),
        child: const ImmortalApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Kính chào đạo hữu'), findsOneWidget);
    expect(find.text('Tinh'), findsOneWidget);
    expect(find.text('Khí'), findsOneWidget);
    expect(find.text('Thần'), findsOneWidget);
  });
}
