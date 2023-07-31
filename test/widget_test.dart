import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/main.dart';

import './widget_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SupabaseClient>()])
@GenerateNiceMocks([MockSpec<GoTrueClient>()])
void main() {
    testWidgets('Shows splash and redirects to home, since we have session', (WidgetTester tester) async {
      // Mocking supabase variable with session
      // ignore: const_with_non_const
      var mockSession = const Session(accessToken: "some_token", tokenType: "some_type", user: User(appMetadata: {}, aud: '', createdAt: '', id: '', userMetadata: {}));

      // To mock the `supabase` variable in the nested elements,
      // we need to create mocks for each nested method stub and do so
      // "in-to-out"...
      MockSupabaseClient mockSupabase = MockSupabaseClient();
      MockGoTrueClient mockTrueClient = MockGoTrueClient();

      // ... hence why we start with `currentSession` and work from there.
      when(mockTrueClient.currentSession).thenReturn(mockSession);
      when(mockSupabase.auth).thenReturn(mockTrueClient);

      await tester.pumpWidget(ProviderScope(
          child: App(
        supabase: mockSupabase,
      )));

      // The first frame is a loading state.
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      // Re-render. TodoListProvider should have finished fetching the todos by now
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 100));

      // No longer loading
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('Shows splash and redirects to login, since there\'s no session', (WidgetTester tester) async {
      // Mocking supabase variable with session
      MockSupabaseClient mockSupabase = MockSupabaseClient();
      MockGoTrueClient mockTrueClient = MockGoTrueClient();

      when(mockTrueClient.currentSession).thenReturn(null);
      when(mockSupabase.auth).thenReturn(mockTrueClient);

      await tester.pumpWidget(ProviderScope(
          child: App(
        supabase: mockSupabase,
      )));

      // The first frame is a loading state.
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      // Re-render. TodoListProvider should have finished fetching the todos by now
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 100));

      // Redirected to login page
      expect(find.text("Login"), findsWidgets);
    });
}
