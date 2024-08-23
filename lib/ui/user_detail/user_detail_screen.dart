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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
                companyDetail
                    .text(fontWeight: FontWeight.w600, fontSize: 18)
                    .appPadding(
                      left: 16,
                      right: 16,
                    ),
                detailItem(
                  title: "$name :-",
                  desc: user?.company?.name,
                ),
                detailItem(
                  title: "$title :-",
                  desc: user?.company?.title,
                ),
                detailItem(
                  title: "$companyAddress :-",
                  desc: (user?.company?.address?.address ?? ""),
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
                  title: "$city :-",
                  desc: user?.address?.city,
                ),
                detailItem(
                  title: "$state :-",
                  desc: user?.address?.state,
                ),
                detailItem(
                  title: "$stateCode :-",
                  desc: user?.address?.stateCode,
                ),
                detailItem(
                  title: "$postalCode :-",
                  desc: user?.address?.postalCode,
                ),
                detailItem(
                  title: "$country :-",
                  desc: user?.address?.country,
                ),
                detailItem(
                  title: "$fullAddress :-",
                  desc: user?.address?.address,
                ),
                16.spaceH,
                bankDetails
                    .text(fontWeight: FontWeight.w600, fontSize: 18)
                    .appPadding(
                      left: 16,
                      right: 16,
                    ),
                detailItem(
                  title: "$cardExpire :-",
                  desc: user?.bank?.cardExpire,
                ),
                detailItem(
                  title: "$cardNumber :-",
                  desc: user?.bank?.cardNumber,
                ),
                detailItem(
                  title: "$cardType :-",
                  desc: user?.bank?.cardType,
                ),
                detailItem(
                  title: "$currency :-",
                  desc: user?.bank?.currency,
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
    );
  }

  Widget detailItem({
    String? title,
    String? desc,
  }) {
    return Row(
      children: [
        title.text(fontWeight: FontWeight.w500, fontSize: 16),
        const Spacer(),
        desc.text()
      ],
    ).appPadding(
      left: 16,
      right: 16,
    );
  }
}
