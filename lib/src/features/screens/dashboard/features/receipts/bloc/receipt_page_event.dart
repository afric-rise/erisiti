part of 'receipt_page_bloc.dart';

@immutable
sealed class ReceiptPageEvent {}

class SearchReceiptEvent extends ReceiptPageEvent {
  final String query;
  SearchReceiptEvent({required this.query});
}

class ValidateDateEvent extends ReceiptPageEvent {
  final String date;
  ValidateDateEvent({required this.date});
}

class ValidateDateDifference extends ReceiptPageEvent {
  final String startDate;
  final String endDate;

  ValidateDateDifference({required this.startDate, required this.endDate});
}

class SubmitDateEvent extends ReceiptPageEvent {
  final BuildContext context;
  SubmitDateEvent({required this.context});
}
