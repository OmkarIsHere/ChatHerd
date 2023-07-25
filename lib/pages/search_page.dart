import 'package:chat_herd/services/database_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../helper/helper_function.dart';
import '../widgets/widgets.dart';
import 'chat_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  bool _isLoading = false;
  bool _isJoined = false;
  bool _isJoining= false;
  bool _hasUserSearched = false;
  bool _hasData = true;
  QuerySnapshot? snapshot;
  String? userName;
  User? user;

  @override
  void initState() {
    super.initState();
    getUserNameAndUserId();
  }

  getUserNameAndUserId() {
    HelperFunction.getUserNameSF()
        .then((value) => setState(() => userName = value!));
    user = FirebaseAuth.instance.currentUser!;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 2,
          shadowColor: Theme.of(context).dividerColor,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 24,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          title: SizedBox(
            height: 36,
            child: TextField(
              controller: searchController,
              keyboardType: TextInputType.text,
              autofocus: true,
              showCursor: true,
              maxLines: 1,
              textAlignVertical: TextAlignVertical.center,
              cursorColor: Theme.of(context).colorScheme.tertiary,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontFamily: 'Mulish-Reg',
                fontSize: 14,
                height: 1.2,
              ),
              decoration: InputDecoration(
                filled: true,
                // fillColor: Colors.yellow.shade200,
                fillColor: Theme.of(context).colorScheme.surface,
                hintText: 'Search group here',
                hintStyle: TextStyle(color: Theme.of(context).colorScheme.tertiary),
                contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          actions: [
            InkWell(
              onTap: () => initiateSearchMethod(),
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.search_rounded,
                  size: 24,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ],
        ),
        body: searchList(),
      ),
    );
  }

  initiateSearchMethod() async {
    if (searchController.text.trim().isNotEmpty) {
      setState(() => _isLoading = true);
      await DatabaseServices()
          .getSearchResult(searchController.text.trim())
          .then((value) {
        if (value.docs.length != 0) {
          setState(() {
            snapshot = value;
            _isLoading = false;
            _hasUserSearched = true;
            _hasData = true;
          });
        } else {
          setState(() {
            _isLoading = false;
            _hasUserSearched = true;
            _hasData = false;
          });
        }
      });
    }
  }

  searchList() {
    return (_hasUserSearched)
        ? (_isLoading == false)
            ? (_hasData)
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot!.docs.length,
                    itemBuilder: (context, index) {
                      return searchTile(
                          snapshot!.docs[index]['groupName'],
                          snapshot!.docs[index]['groupId'],
                          userName!,
                          snapshot!.docs[index]['admin'],
                          snapshot!.docs[index]['groupIcon']);
                    })
                : Center(
                    child: Text(
                      'No result found',
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.4,
                        overflow: TextOverflow.ellipsis,
                        fontFamily: 'Mulish-Reg',
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  )
            : Center(
                child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary, strokeWidth: 2))
        : const SizedBox();
  }

  Widget searchTile(String groupName, String groupId, String userName,
      String adminName, String groupIcon) {
    joinedOrNot(groupName, groupId, userName);
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: Theme.of(context).dividerColor,
        child: (groupIcon.isEmpty)
            ? Image.asset('assets/images/user-group.png', fit: BoxFit.cover)
            : Image.network(groupIcon, fit: BoxFit.cover),
      ),
      title: Text(
        groupName,
        textAlign: TextAlign.start,
        maxLines: 1,
        style: TextStyle(
          fontSize: 14,
          height: 1.4,
          fontWeight: FontWeight.w400,
          overflow: TextOverflow.ellipsis,
          fontFamily: 'Mulish-Reg',
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      subtitle: Text(
        'Admin: ${getName(adminName)}',
        textAlign: TextAlign.start,
        maxLines: 1,
        style: TextStyle(
          fontSize: 12,
          height: 1.2,
          overflow: TextOverflow.ellipsis,
          fontFamily: 'Mulish-Reg',
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
      trailing: (_isJoining == false)
          ? (_isJoined == false)
              ? InkWell(
                  onTap: () async {
                    setState(() => _isJoining = true);
                    await DatabaseServices(
                            uid: FirebaseAuth.instance.currentUser!.uid)
                        .joinGroup(groupName, groupId, userName)
                        .then((value) => nextPage(
                            context,
                            ChatPage(
                                groupName: groupName,
                                groupId: groupId,
                                userName: userName,
                                groupIcon: groupIcon)));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        border: Border.all(
                            color: Theme.of(context).colorScheme.primary, width: 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text(
                        'Join',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.2,
                          fontFamily: 'Mulish-Reg',
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                )
              : InkWell(
                  onTap: () {},
                  child: Text(
                    'Joined',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Mulish-Reg',
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                )
          : SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary, strokeWidth: 2)),
    );
  }

  joinedOrNot(String groupName, String groupId, String userName) async {
    await DatabaseServices(uid: user!.uid)
        .isUserJoined(groupName, groupId, userName)
        .then((value) => setState(() => _isJoined = value));
  }

  String getName(String str) => str.substring(str.indexOf("_") + 1);
}

