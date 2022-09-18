import 'package:bloc_test/bloc_test.dart';
import 'package:cubit_and_testing/cubit/operator_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(OperatorCubit, () {
    late OperatorCubit operatorCubit;

    setUp(() {
      operatorCubit = OperatorCubit();
    });

    tearDown(() {
      operatorCubit.close();
    });

    test(
      'Initial state of OperationCubit is OperatorState(number: 1.0)',
      (() {
        expect(operatorCubit.state, OperatorState(number: 1.0));
      }),
    );

    blocTest(
      "The cubit should emit a state of OperatorState(number: 2.0) when add() is called",
      build: () => operatorCubit,
      act: (cubit) => operatorCubit.add(),
      expect: () => [OperatorState(number: 2.0)],
    );

    blocTest(
      "The cubit should emit a state of OperatorState(number: 2.0) when substract() is called",
      build: () => operatorCubit,
      act: (cubit) => operatorCubit.substract(),
      expect: () => [OperatorState(number: 0.0)],
    );

    blocTest(
      "The cubit should emit a state of OperatorState(number: 2.0) when multiply() is called",
      build: () => operatorCubit,
      act: (cubit) => operatorCubit.multiply(),
      expect: () => [OperatorState(number: 2.0)],
    );

    blocTest(
      "The cubit should emit a state of OperatorState(number: 2.0) when divide() is called",
      build: () => operatorCubit,
      act: (cubit) => operatorCubit.divide(),
      expect: () => [OperatorState(number: 0.5)],
    );
  });
}
