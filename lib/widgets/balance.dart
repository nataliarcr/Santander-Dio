import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:santander_app/models/user_model/account.dart';
import 'package:santander_app/shared/colors.dart';

import '../shared/pictures.dart';

class BalanceWidget extends StatelessWidget {
  final Account account;
  const BalanceWidget({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      height: 220,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        shadows: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 9,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              //componentes um do lado do outro
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  ImagesApp.fresh,
                  width: 30,
                  height: 30,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'Saldo disponível',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.18,
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  ImagesApp.up,
                  width: 18,
                  height: 18,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'R\$ ${NumberFormat('#,##0.00', 'pt_BR').format(account.balance!)}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 33,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w700,
                letterSpacing: 0.32,
              ),
            ),
            Text(
              'Saldo + Limite: R\$ ${NumberFormat('#,##0.00', 'pt_BR').format((account.limit ?? 0) + (account.balance ?? 0))}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w700,
                letterSpacing: 0.18,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 290,
                  height: 2,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(75),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Ver extrato',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.18,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
