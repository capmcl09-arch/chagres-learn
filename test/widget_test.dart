import 'package:geography_hq/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders the learning site shell', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Geography HQ™'), findsOneWidget);
    expect(find.text('Geography HQ'), findsOneWidget);
    expect(
      find.text('Participatory Research Mapping in plain language'),
      findsOneWidget,
    );
  });
}
