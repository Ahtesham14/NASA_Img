import 'package:equatable/equatable.dart';
import '../models/apod_model.dart';

abstract class ApodState extends Equatable {
  const ApodState();

  @override
  List<Object> get props => [];
}

class ApodInitial extends ApodState {}

class ApodLoading extends ApodState {}

class ApodSuccess extends ApodState {
  final ApodModel data;

  const ApodSuccess(this.data);

  @override
  List<Object> get props => [data];
}

class ApodError extends ApodState {
  final String message;

  const ApodError(this.message);

  @override
  List<Object> get props => [message];
}
