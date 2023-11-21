import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/auth/ui/views/authentication_view.dart';
import '../injection_container.dart';

class AppBarDefault extends StatelessWidget {
  const AppBarDefault({super.key});

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
                          onTap: () {
                            sl<SharedPreferences>().remove("username");
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AuthenticationView()));
                          },
                          value: '/Logout',
                          child: const Text("Logout"))
                    ];
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.person),
                      const SizedBox(width: 10),
                      Text(sl<SharedPreferences>()
                          .getString("username")
                          .toString()),
                    ],
                  ),
                )))
      ],
    );
  }
}
