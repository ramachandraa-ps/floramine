import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:floramine/screens/categories_screen.dart';

void main() {
  testWidgets('Categories screen shows all components', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: CategoriesScreen(),
      ),
    );

    // Verify that the title is displayed
    expect(find.text('All Categories'), findsOneWidget);
    
    // Verify that the search bar is displayed
    expect(find.byType(TextField), findsOneWidget);
    
    // Verify that the grid view is displayed
    expect(find.byType(GridView), findsOneWidget);
    
    // Verify that the bottom navigation bar is displayed
    expect(find.text('Categories'), findsOneWidget);
  });
} 