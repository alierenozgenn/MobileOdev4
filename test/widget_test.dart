import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('Ürün Listesi Uygulaması Başlangıç Testi',
      (WidgetTester tester) async {
    // Uygulamayı yükle ve bir frame tetikle.
    await tester.pumpWidget(UrunUygulamasi());

    // Yatay ListView üzerindeki ilk ürünün ismini kontrol et.
    expect(find.text('Ürün 1'), findsOneWidget);

    // GridView üzerinde aynı ürünün görüntülendiğini doğrula.
    expect(find.text('50 TL'), findsOneWidget);

    // Ürün 1'i seçip vurgulanmasını test et.
    await tester.tap(find.text('Ürün 1'));
    await tester.pump();

    // Vurgunun gerçekleştiğini doğrula.
    final selectedProduct =
        tester.widget<Container>(find.widgetWithText(Container, 'Ürün 1'));
    expect(selectedProduct.decoration, isNotNull);
  });
}
