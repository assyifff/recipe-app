import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/UI/view/screen/base/calculate_calorie_screen.dart';
import 'package:recipe_app/UI/view/widget/calculate_calorie_widget/calorie_form_widget.dart';
import 'package:recipe_app/UI/view_model/calorie_provider.dart';

void main() {
  testWidgets('Calculate calorie screen test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => CalorieProvider(),
          ),
        ],
        child: const MaterialApp(
          home: CalculateCalorieScreen(),
        ),
      ),
    );

    //cek judul
    expect(find.text('Calculate calories'), findsOneWidget);
    //cek icon untuk clear kalori
    expect(find.byIcon(Icons.restore), findsOneWidget);
    //cek form
    expect(find.byType(CalorieFormWidget), findsOneWidget);

    //Ketika klik button clear
    await tester.tap(find.byIcon(Icons.restore));
    await tester.pumpAndSettle();
    // cek snackbar
    expect(find.byType(SnackBar), findsOneWidget);

    //cek apakah hasil yang tampil benar
    expect(
      find.text('Your calorie: 0! Please check your calories in home'),
      findsOneWidget,
    );
  });
}
