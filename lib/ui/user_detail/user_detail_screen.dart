import 'package:flutter/material.dart';
import 'package:unitask_practicle_hardik/model/user_model.dart';
import 'package:unitask_practicle_hardik/other/extensions.dart';

import '../../other/app_string.dart';
import '../widgets/app_image.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({
    super.key,
    this.user,
  });

  final Users? user;

  @override
  Widget build(BuildContext context) {
    user?.bank;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: ("${user?.firstName ?? ""} ${user?.lastName ?? ""}").text(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            30.spaceH,
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 1,
                    spreadRadius: 1.5,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppImage(
                    height: 250,
                    image: user?.image,
                    fit: BoxFit.fitWidth,
                  ),
                  16.spaceH,
                  bankDetails
                      .text(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      )
                      .appPadding(
                        left: 16,
                        right: 16,
                      ),
                  detailItem(
                    desc: user?.bank?.cardExpire,
                  ),
                  detailItem(
                    desc: user?.bank?.cardNumber,
                  ),
                  detailItem(
                    desc: user?.bank?.cardType,
                  ),
                  detailItem(
                    desc: user?.bank?.currency,
                  ),
                  16.spaceH,
                  address
                      .text(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      )
                      .appPadding(
                        left: 16,
                        right: 16,
                      ),
                  detailItem(
                    desc:
                        "${user?.address?.address ?? ""}, ${user?.address?.city ?? ""}, ${user?.address?.state ?? ""}, ${user?.address?.stateCode ?? ""}, ${user?.address?.postalCode ?? ""}, ${user?.address?.country ?? ""} ",
                  ),
                  16.spaceH,
                  companyDetail
                      .text(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      )
                      .appPadding(
                        left: 16,
                        right: 16,
                      ),
                  detailItem(
                    desc:
                        "${user?.company?.name ?? ""}, ${user?.company?.title ?? ""}, ${user?.company?.address?.address ?? ""}, ${user?.company?.address?.city ?? ""}, ${user?.company?.address?.state ?? ""}, ${user?.company?.address?.country ?? ""}",
                  ),
                  16.spaceH,
                ],
              ),
            ).appPadding(
              left: 16,
              right: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget detailItem({
    String? desc,
  }) {
    return Row(
      children: [Expanded(child: desc.text())],
    ).appPadding(
      left: 16,
      right: 16,
    );
  }
}
