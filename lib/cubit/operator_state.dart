// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'operator_cubit.dart';

class OperatorState extends Equatable {
  double number;

  OperatorState({required this.number});

  @override
  List<Object> get props => [this.number];
}

class OperatorInitial extends OperatorState {
  OperatorInitial({required super.number});
}
