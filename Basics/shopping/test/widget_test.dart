import 'package:flutter_test/flutter_test.dart';
import 'package:shopping/main.dart';

void main() {
  testWidgets('Shopping list app loads successfully', (
    WidgetTester tester,
  ) async {
    // Launch the Shopping App.
    await tester.pumpWidget(const ShoppingApp());

    // Verify the application title.
    expect(find.text('Shopping List'), findsOneWidget);

    // Verify initial shopping items.
    expect(find.text('Eggs'), findsOneWidget);
    expect(find.text('Flour'), findsOneWidget);
    expect(find.text('Chocolate chips'), findsOneWidget);

    // Verify the Add button.
    expect(find.text('Add'), findsOneWidget);

    // Verify the Delete First button.
    expect(find.text('Delete First'), findsOneWidget);
  });
}
