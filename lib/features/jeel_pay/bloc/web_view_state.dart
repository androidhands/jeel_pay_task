part of 'web_view_cubit.dart';

@immutable
abstract class WebViewState {}

class WebViewInitial extends WebViewState {}

class WebViewLoading extends WebViewState {}

class WebViewLoaded extends WebViewState {
  final double height;
  WebViewLoaded({required this.height});
}

class WebViewError extends WebViewState {
  final String message;

  WebViewError({required this.message});
}
