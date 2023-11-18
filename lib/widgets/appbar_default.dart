import 'package:flutter/material.dart';

import '../features/auth/ui/views/authentication_view.dart';

class AppBarDefault extends StatelessWidget {
  const AppBarDefault({super.key, required this.username});

  final String username;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        Container(
            margin: const EdgeInsets.all(10),
            child: ElevatedButton(
                onPressed: () {},
                child: PopupMenuButton(
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem(
                          value: '/Profile', child: Text("Profile")),
                      PopupMenuItem(
                          onTap: () => Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AuthenticationView())),
                          value: '/Logout',
                          child: const Text("Logout"))
                    ];
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.person),
                      const SizedBox(width: 10),
                      Text(username),
                    ],
                  ),
                )))
      ],
    );
  }
}
