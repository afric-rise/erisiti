import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:erisiti/src/constants/data/receipts.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../modal/receipt.dart';
import '../receipt.dart';

part 'receipt_page_event.dart';
part 'receipt_page_state.dart';

class ReceiptPageBloc extends Bloc<ReceiptPageEvent, ReceiptPageState> {
  ReceiptPageBloc() : super(ReceiptPageInitial()) {
    on<ReceiptPageEvent>((event, emit) {});
    on<SearchReceiptEvent>(searchReceiptEvent);
    on<ValidateDateEvent>(validateDateEvent);

    on<ValidateDateDifference>(validateDateDifference);
    on<SubmitDateEvent>(submitDateEvent);
  }

  FutureOr<void> searchReceiptEvent(
      SearchReceiptEvent event, Emitter<ReceiptPageState> emit) {
    String query = event.query;
    List<Receipt> allReceipts = AvailableReceipts.receipts
        .map((e) => Receipt(
            issuer: e["issuer"]!, address: e['address']!, phone: e["Phone"]!))
        .toList();
    List<Receipt> matchedReceipts = allReceipts
        .where((element) =>
            (element.address.toLowerCase().contains(query.toLowerCase())) ||
            (element.issuer.toLowerCase().contains(query.toLowerCase())) ||
            (element.phone.toLowerCase().contains(query.toLowerCase())))
        .toList();

    emit(ReceiptSearchState(query, receipts: matchedReceipts));
  }

  FutureOr<void> validateDateEvent(
      ValidateDateEvent event, Emitter<ReceiptPageState> emit) {
    try {
      print("date to validate  ${event.date} *****************");
      DateTime date = DateTime.parse(event.date.replaceAll(" ", ""));

      print("valid step 1>>>>>>>>>>>>>> $date");
      var now = DateFormat("yyyy-MM-yy").format(DateTime.now());
      final duration =
          DateTime.parse(now).difference(DateTime.parse(event.date));
      if (duration.inDays >= 0) {
        print("valid step 2>>>>>>>>>>>>>>");
        emit(ValidatedDateState(valid: true));
      } else {
        print("invalid step 22 >>>>>>>>>>>>>>");
        emit(ValidatedDateState(valid: false));
      }
    } catch (e) {
      emit(ValidatedDateState(valid: false));
      print("invalid step 11 >>>>>>>>>>>>>>");
    }
  }

  FutureOr<void> validateDateDifference(
      ValidateDateDifference event, Emitter<ReceiptPageState> emit) {
    try {
      final duration = DateTime.parse(event.endDate)
          .difference(DateTime.parse(event.startDate));
      if (duration.inDays >= 0) {
        emit(ValidatedDateDifferenceState(valid: true));
      } else {
        emit(ValidatedDateDifferenceState(valid: false));
      }
    } catch (e) {
      emit(ValidatedDateDifferenceState(valid: false));
    }
  }

  FutureOr<void> submitDateEvent(
      SubmitDateEvent event, Emitter<ReceiptPageState> emit) {
    Navigator.of(event.context).push(MaterialPageRoute(
      builder: (context) => const ReceiptPage(),
    ));
    emit(SubmitDateSuccessState());
  }
}
