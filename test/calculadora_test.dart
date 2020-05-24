import 'package:calculadora_mobx/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('deve mostrar a calculadora', (tester) async {
    await tester.pumpWidget(Calculadora());
    expect(find.byType(Calculadora), findsOneWidget);
  });

  testWidgets('deve mostrar a calculadora com todos os seus numeros',
      (tester) async {
    await tester.pumpWidget(Calculadora());
    final numeroZero = find.text('0');
    final numeroUm = find.text('1');
    final numeroDois = find.text('2');
    final numeroTres = find.text('3');
    final numeroQuatro = find.text('4');
    final numeroCinco = find.text('5');
    final numeroSeis = find.text('6');
    final numeroSete = find.text('7');
    final numeroOito = find.text('8');
    final numeroNove = find.text('9');

    expect(numeroZero, findsNWidgets(2));
    expect(numeroUm, findsNWidgets(2));
    expect(numeroDois, findsNWidgets(2));
    expect(numeroTres, findsNWidgets(2));
    expect(numeroQuatro, findsNWidgets(2));
    expect(numeroCinco, findsNWidgets(2));
    expect(numeroSeis, findsNWidgets(2));
    expect(numeroSete, findsNWidgets(2));
    expect(numeroOito, findsNWidgets(2));
    expect(numeroNove, findsNWidgets(2));
  });

  testWidgets('deve mostrar a calculadora com todas as suas operações',
      (tester) async {
    await tester.pumpWidget(Calculadora());
    final soma = find.text('+');
    final subtracao = find.text('-');
    final divisao = find.text('/');
    final multiplicacao = find.text('*');
    final resto = find.text('%');

    expect(soma, findsOneWidget);
    expect(subtracao, findsOneWidget);
    expect(divisao, findsOneWidget);
    expect(multiplicacao, findsOneWidget);
    expect(resto, findsOneWidget);
  });

  testWidgets('deve somar corretamente', (tester) async {
    await tester.pumpWidget(Calculadora());
    final numeroUm = find.text('1').first;
    final soma = find.text('+');
    final numeroNove = find.text('9').last;
    final botaoCalcular = find.byType(BotaoCalcular);

    await tester.tap(numeroUm);
    await tester.pumpAndSettle();
    await tester.tap(soma);
    await tester.pumpAndSettle();
    await tester.tap(numeroNove);
    await tester.pumpAndSettle();
    await tester.tap(botaoCalcular);
    await tester.pumpAndSettle();

    expect(find.text('10.00'), findsOneWidget);
  });

  testWidgets('deve subtrair corretamente', (tester) async {
    await tester.pumpWidget(Calculadora());
    final numeroOito = find.text('8').first;
    final subtracao = find.text('-');
    final numeroDois = find.text('2').last;
    final botaoCalcular = find.byType(BotaoCalcular);

    await tester.tap(numeroOito);
    await tester.pumpAndSettle();
    await tester.tap(subtracao);
    await tester.pumpAndSettle();
    await tester.tap(numeroDois);
    await tester.pumpAndSettle();
    await tester.tap(botaoCalcular);
    await tester.pumpAndSettle();

    expect(find.text('6.00'), findsOneWidget);
  });

  testWidgets('deve multiplicar corretamente', (tester) async {
    await tester.pumpWidget(Calculadora());
    final numeroTres = find.text('3').first;
    final multiplicacao = find.text('*');
    final numeroCinco = find.text('5').last;
    final botaoCalcular = find.byType(BotaoCalcular);

    await tester.tap(numeroTres);
    await tester.pumpAndSettle();
    await tester.tap(multiplicacao);
    await tester.pumpAndSettle();
    await tester.tap(numeroCinco);
    await tester.pumpAndSettle();
    await tester.tap(botaoCalcular);
    await tester.pumpAndSettle();

    expect(find.text('15.00'), findsOneWidget);
  });

  testWidgets('deve dividir corretamente', (tester) async {
    await tester.pumpWidget(Calculadora());
    final numeroOito = find.text('8').first;
    final divisao = find.text('/');
    final numeroDois = find.text('2').last;
    final botaoCalcular = find.byType(BotaoCalcular);

    await tester.tap(numeroOito);
    await tester.pumpAndSettle();
    await tester.tap(divisao);
    await tester.pumpAndSettle();
    await tester.tap(numeroDois);
    await tester.pumpAndSettle();
    await tester.tap(botaoCalcular);
    await tester.pumpAndSettle();

    expect(find.text('4.00'), findsOneWidget);
  });

  testWidgets('deve calcular o resto corretamente', (tester) async {
    await tester.pumpWidget(Calculadora());
    final numeroNove = find.text('9').first;
    final resto = find.text('%');
    final numeroDois = find.text('2').last;
    final botaoCalcular = find.byType(BotaoCalcular);

    await tester.tap(numeroNove);
    await tester.pumpAndSettle();
    await tester.tap(resto);
    await tester.pumpAndSettle();
    await tester.tap(numeroDois);
    await tester.pumpAndSettle();
    await tester.tap(botaoCalcular);
    await tester.pumpAndSettle();

    expect(find.text('1.00'), findsOneWidget);
  });

  testWidgets('deve zerar operacao ao clicar em zerar', (tester) async {
    await tester.pumpWidget(Calculadora());
    final numeroOito = find.text('8').first;
    final subtracao = find.text('-');
    final numeroDois = find.text('2').last;
    final botaoCalcular = find.byType(BotaoCalcular);
    final botaoZerar = find.byType(BotaoZerar);

    await tester.tap(numeroOito);
    await tester.pumpAndSettle();
    await tester.tap(subtracao);
    await tester.pumpAndSettle();
    await tester.tap(numeroDois);
    await tester.pumpAndSettle();
    await tester.tap(botaoCalcular);
    await tester.pumpAndSettle();

    expect(find.text('6.00'), findsOneWidget);

    await tester.tap(botaoZerar);
    await tester.pumpAndSettle();
    expect(find.byKey(ValueKey('primeiro-numero')), findsNothing);
    expect(find.byKey(ValueKey('operacao')), findsNothing);
    expect(find.byKey(ValueKey('segundo-numero')), findsNothing);
  });
}
