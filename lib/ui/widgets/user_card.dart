import 'package:flutter/material.dart';
import 'package:unitask_practicle_hardik/model/user_model.dart';
import 'package:unitask_practicle_hardik/other/extensions.dart';

import 'app_image.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, this.user, this.onTap});

  final Users? user;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 2,
              spreadRadius: 1,
              color: Colors.grey.withOpacity(0.5),
            ),
          ],
        ),
        child: Row(
          children: [
            AppImage(
              height: 100,
              width: 100,
              image: user?.image,
            ).appPadding(
              all: 5,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ("${user?.firstName} ${user?.lastName}").text(
                    fontWeight: FontWeight.w600,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: (user?.email ?? "").text(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                      )),
                      Expanded(
                        child: "${user?.age ?? ""}".text(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: (user?.phone ?? "").text(),
                      ),
                      Expanded(
                        child: (user?.birthDate ?? "").text(),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ).appPadding(left: 16, right: 16, top: 8);
  }
}
