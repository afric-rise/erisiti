import 'package:erisiti/src/constants/styles/style.dart';
import 'package:erisiti/src/features/screens/dashboard/features/home/bloc/home_bloc.dart';
import 'package:erisiti/src/features/screens/dashboard/features/home/components/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key, required this.homeBloc, required this.tinNumber});
  final String tinNumber;
  final HomeBloc homeBloc;

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  String numberOfReceipts = "0";
  String totalAmount = "0";
  String taxAmount = "0";

  @override
  void initState() {
    widget.homeBloc.add(HomeInitializeEvent(widget.tinNumber));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: widget.homeBloc,
      listener: (context, state) {
        if (state is HomeInitializeState) {
          numberOfReceipts = state.numberOfReceipts;
          totalAmount = state.totalAmount;
          taxAmount = state.taxAmount;
        }
      },
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ItemCard(
                amount: numberOfReceipts,
                icon: const Icon(
                  Icons.receipt_outlined,
                  size: 35,
                  color: ApplicationStyles.realAppColor,
                ),
                title: 'Number of receipts',
              ),
              ItemCard(
                amount: taxAmount,
                icon: const Icon(
                  Icons.casino_rounded,
                  size: 35,
                  color: ApplicationStyles.realAppColor,
                ),
                title: 'Tax Amount',
              ),
              ItemCard(
                amount: totalAmount,
                icon: const Icon(
                  Icons.attach_money_rounded,
                  size: 35,
                  color: ApplicationStyles.realAppColor,
                ),
                title: 'Total Amount',
              ),
            ],
          ),
        );
      },
    );
  }
}
