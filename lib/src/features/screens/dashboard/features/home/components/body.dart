import 'package:erisiti/src/constants/styles/style.dart';
import 'package:erisiti/src/features/screens/dashboard/features/home/bloc/home_bloc.dart';
import 'package:erisiti/src/features/screens/dashboard/features/home/components/card.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key, required this.homeBloc});
  final HomeBloc homeBloc;

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ItemCard(
            amount: '78,028',
            icon: Icon(
              Icons.receipt_outlined,
              size: 35,
              color: ApplicationStyles.realAppColor,
            ),
            title: 'Number of receipts',
          ),
          ItemCard(
            amount: '74,289',
            icon: Icon(
              Icons.casino_rounded,
              size: 35,
              color: ApplicationStyles.realAppColor,
            ),
            title: 'Tax Amount',
          ),
          ItemCard(
            amount: '98,932',
            icon: Icon(
              Icons.attach_money_rounded,
              size: 35,
              color: ApplicationStyles.realAppColor,
            ),
            title: 'Total Amount',
          ),
        ],
      ),
    );
  }
}
