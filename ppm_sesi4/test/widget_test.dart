import 'package:flutter_test/flutter_test.dart';
import 'package:ppm_sesi4/main.dart';
import 'package:ppm_sesi4/providers/cart_provider.dart';
import 'package:ppm_sesi4/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Nusa Bookstore loads catalog screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CartProvider()),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ],
        child: const NusaBookstoreApp(),
      ),
    );

    expect(find.text('Nusa Bookstore'), findsOneWidget);
  });
}