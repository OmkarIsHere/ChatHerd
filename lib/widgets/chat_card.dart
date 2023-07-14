import 'package:chat_herd/shared/constants.dart';
import 'package:flutter/material.dart';

class ChatCard extends StatefulWidget {
  const ChatCard({super.key});

  @override
  State<ChatCard> createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Container(
              color: Colors.red.shade100,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          height: 48,
                          width: 48,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/no-image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Athalia Putri',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.3,
                                // backgroundColor: Colors.yellow,
                                fontFamily: 'Mulish-Reg',
                                color: Constants.blackColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Last seen yesterday',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.1,
                                // backgroundColor: Colors.red,
                                fontFamily: 'Mulish-Reg',
                                color: Constants.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Divider(
                    height: 2,
                    thickness: 1,
                    color: Constants.offWhiteColor,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Container(
              color: Colors.green.shade100,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          height: 48,
                          width: 48,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/no-image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Athalia Putri',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.3,
                                // backgroundColor: Colors.yellow,
                                fontFamily: 'Mulish-Reg',
                                color: Constants.blackColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Last seen yesterday',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.1,
                                // backgroundColor: Colors.red,
                                fontFamily: 'Mulish-Reg',
                                color: Constants.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 10,
                    thickness: 1,
                    color: Constants.offWhiteColor,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Container(
              color: Colors.yellow.shade100,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          height: 48,
                          width: 48,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/no-image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Athalia Putri',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.3,
                                // backgroundColor: Colors.yellow,
                                fontFamily: 'Mulish-Reg',
                                color: Constants.blackColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Last seen yesterday',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.1,
                                // backgroundColor: Colors.red,
                                fontFamily: 'Mulish-Reg',
                                color: Constants.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 10,
                    thickness: 1,
                    color: Constants.offWhiteColor,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Container(
              color: Colors.purple.shade100,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          height: 48,
                          width: 48,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/no-image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Athalia Putri',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.3,
                                // backgroundColor: Colors.yellow,
                                fontFamily: 'Mulish-Reg',
                                color: Constants.blackColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Last seen yesterday',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.1,
                                // backgroundColor: Colors.red,
                                fontFamily: 'Mulish-Reg',
                                color: Constants.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 10,
                    thickness: 1,
                    color: Constants.offWhiteColor,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Container(
              color: Colors.pink.shade100,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          height: 48,
                          width: 48,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/no-image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Athalia Putri',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.3,
                                // backgroundColor: Colors.yellow,
                                fontFamily: 'Mulish-Reg',
                                color: Constants.blackColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Last seen yesterday',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.1,
                                // backgroundColor: Colors.red,
                                fontFamily: 'Mulish-Reg',
                                color: Constants.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Divider(
                    height: 2,
                    thickness: 1,
                    color: Constants.offWhiteColor,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Container(
              color: Colors.brown.shade100,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          height: 48,
                          width: 48,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/no-image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Athalia Putri',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.3,
                                // backgroundColor: Colors.yellow,
                                fontFamily: 'Mulish-Reg',
                                color: Constants.blackColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Last seen yesterday',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.1,
                                // backgroundColor: Colors.red,
                                fontFamily: 'Mulish-Reg',
                                color: Constants.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Divider(
                    height: 2,
                    thickness: 1,
                    color: Constants.offWhiteColor,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Container(
              color: Colors.red.shade100,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          height: 48,
                          width: 48,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/no-image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Athalia Putri',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.3,
                                // backgroundColor: Colors.yellow,
                                fontFamily: 'Mulish-Reg',
                                color: Constants.blackColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Last seen yesterday',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.1,
                                // backgroundColor: Colors.red,
                                fontFamily: 'Mulish-Reg',
                                color: Constants.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Divider(
                    height: 2,
                    thickness: 1,
                    color: Constants.offWhiteColor,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          height: 48,
                          width: 48,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/no-image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Athalia Putri',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.3,
                                // backgroundColor: Colors.yellow,
                                fontFamily: 'Mulish-Reg',
                                color: Constants.blackColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Last seen yesterday',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.1,
                                // backgroundColor: Colors.red,
                                fontFamily: 'Mulish-Reg',
                                color: Constants.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Divider(
                    height: 2,
                    thickness: 1,
                    color: Constants.offWhiteColor,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          height: 48,
                          width: 48,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/no-image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Athalia Putri',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.3,
                                // backgroundColor: Colors.yellow,
                                fontFamily: 'Mulish-Reg',
                                color: Constants.blackColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Last seen yesterday',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.1,
                                // backgroundColor: Colors.red,
                                fontFamily: 'Mulish-Reg',
                                color: Constants.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Divider(
                    height: 2,
                    thickness: 1,
                    color: Constants.offWhiteColor,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          height: 48,
                          width: 48,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/no-image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Athalia Putri',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.3,
                                // backgroundColor: Colors.yellow,
                                fontFamily: 'Mulish-Reg',
                                color: Constants.blackColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Last seen yesterday',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.1,
                                // backgroundColor: Colors.red,
                                fontFamily: 'Mulish-Reg',
                                color: Constants.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Divider(
                    height: 2,
                    thickness: 1,
                    color: Constants.offWhiteColor,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          height: 48,
                          width: 48,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/no-image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Athalia Putri',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.3,
                                // backgroundColor: Colors.yellow,
                                fontFamily: 'Mulish-Reg',
                                color: Constants.blackColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Last seen yesterday',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.1,
                                // backgroundColor: Colors.red,
                                fontFamily: 'Mulish-Reg',
                                color: Constants.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Divider(
                    height: 2,
                    thickness: 1,
                    color: Constants.offWhiteColor,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          height: 48,
                          width: 48,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/no-image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Athalia Putri',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.3,
                                // backgroundColor: Colors.yellow,
                                fontFamily: 'Mulish-Reg',
                                color: Constants.blackColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Last seen yesterday',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.1,
                                // backgroundColor: Colors.red,
                                fontFamily: 'Mulish-Reg',
                                color: Constants.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Divider(
                    height: 2,
                    thickness: 1,
                    color: Constants.offWhiteColor,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          height: 48,
                          width: 48,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/no-image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Athalia Putri',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.3,
                                // backgroundColor: Colors.yellow,
                                fontFamily: 'Mulish-Reg',
                                color: Constants.blackColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Last seen yesterday',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.1,
                                // backgroundColor: Colors.red,
                                fontFamily: 'Mulish-Reg',
                                color: Constants.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Divider(
                    height: 2,
                    thickness: 1,
                    color: Constants.offWhiteColor,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          height: 48,
                          width: 48,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/no-image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Athalia Putri',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.3,
                                // backgroundColor: Colors.yellow,
                                fontFamily: 'Mulish-Reg',
                                color: Constants.blackColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Last seen yesterday',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.1,
                                // backgroundColor: Colors.red,
                                fontFamily: 'Mulish-Reg',
                                color: Constants.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Divider(
                    height: 2,
                    thickness: 1,
                    color: Constants.offWhiteColor,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          height: 48,
                          width: 48,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/no-image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Athalia Putri',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.3,
                                // backgroundColor: Colors.yellow,
                                fontFamily: 'Mulish-Reg',
                                color: Constants.blackColor,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Last seen yesterday',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.1,
                                // backgroundColor: Colors.red,
                                fontFamily: 'Mulish-Reg',
                                color: Constants.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Divider(
                    height: 2,
                    thickness: 1,
                    color: Constants.offWhiteColor,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          height: 48,
                          width: 48,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/no-image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Athalia Putri',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.3,
                                // backgroundColor: Colors.yellow,
                                fontFamily: 'Mulish-Reg',
                                color: Constants.blackColor,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Last seen yesterday',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.1,
                                // backgroundColor: Colors.red,
                                fontFamily: 'Mulish-Reg',
                                color: Constants.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Divider(
                    height: 2,
                    thickness: 1,
                    color: Constants.offWhiteColor,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    //   child: Container(
    //     color: Colors.white ,
    //     child: Column(
    //       children: <Widget>[
    //         SizedBox(
    //           child: Row(
    //             children: <Widget>[
    //               SizedBox(
    //                 height: 48,
    //                 width: 48,
    //                 child: ClipRRect(
    //                   borderRadius: BorderRadius.circular(10),
    //                   child: Image.asset(
    //                     'assets/images/no-image.png',
    //                     fit: BoxFit.cover,
    //                   ),
    //                 ),
    //               ),
    //               const SizedBox(width: 12),
    //               Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                 children: <Widget>[
    //                   Text(
    //                     'Athalia Putri',
    //                     textAlign: TextAlign.start,
    //                     style: TextStyle(
    //                       fontSize: 14,
    //                       height: 1.3,
    //                       backgroundColor: Colors.yellow,
    //                       fontFamily: 'Mulish-Reg',
    //                       color: Constants.blackColor,
    //                     ),
    //                   ),
    //                   const SizedBox(height: 4),
    //                   Text(
    //                     'Last seen yesterday',
    //                     textAlign: TextAlign.center,
    //                     style: TextStyle(
    //                       fontSize: 12,
    //                       height: 1.1,
    //                       backgroundColor: Colors.red,
    //                       fontFamily: 'Mulish-Reg',
    //                       color: Constants.greyColor,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ),
    //         Divider(
    //           height: 10,
    //           thickness: 1,
    //           color: Constants.offWhiteColor,
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
