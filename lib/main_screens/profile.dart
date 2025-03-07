import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multi_store/customer_screens/customer_orders.dart';
import 'package:multi_store/customer_screens/wishlist.dart';
import 'package:multi_store/main_screens/cart.dart';
import 'package:multi_store/widgets/alert_dialog.dart';
import 'package:multi_store/widgets/appbar_widget.dart';

class ProfileScreen extends StatefulWidget {
  final String documentId;
  const ProfileScreen({Key? key, required this.documentId}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  CollectionReference customers = FirebaseFirestore.instance.collection(
    'customers',
  );
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: customers.doc(widget.documentId).get(),
      builder: (
        BuildContext context,
        AsyncSnapshot<DocumentSnapshot> snapshot,
      ) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return /*Text("Full Name: ${data['full_name']} ${data['last_name']}");*/ Scaffold(
            backgroundColor: Colors.grey.shade300,
            body: Stack(
              children: [
                Container(
                  height: 230,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.yellowAccent, Colors.orangeAccent],
                    ),
                  ),
                ),
                CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      centerTitle: true,
                      pinned: true,
                      elevation: 0,
                      backgroundColor: Colors.white,
                      expandedHeight: 140,
                      flexibleSpace: LayoutBuilder(
                        builder: (context, Constraints) {
                          return FlexibleSpaceBar(
                            title: AnimatedOpacity(
                              duration: Duration(milliseconds: 200),
                              opacity:
                                  Constraints.biggest.height <= 120 ? 1 : 0,
                              child: Text(
                                'Account',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            centerTitle: true,
                            background: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.yellowAccent,
                                    Colors.orangeAccent,
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 25,
                                  left: 30,
                                ),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 50,
                                      backgroundImage: NetworkImage(
                                        data['profileimage'],
                                      ),
                                    ),
                                    /* CircleAvatar(
                                      radius: 50,
                                      backgroundImage: AssetImage(
                                        'images/inapp/guest.jpg',
                                      ),
                                    ),*/
                                    Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: Text(
                                        data['name'].toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      bottomLeft: Radius.circular(30),
                                    ),
                                  ),
                                  child: TextButton(
                                    child: SizedBox(
                                      height: 40,
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.2,
                                      child: Center(
                                        child: Text(
                                          'Cart',
                                          style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 24,
                                          ),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => CartScreen(
                                                back: AppBarBackButton(),
                                              ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  color: Colors.yellow,
                                  child: TextButton(
                                    child: SizedBox(
                                      height: 40,
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.2,
                                      child: Center(
                                        child: Text(
                                          'Orders',
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => CustomerOrders(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                    ),
                                  ),
                                  child: TextButton(
                                    child: SizedBox(
                                      height: 40,
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.2,
                                      child: Center(
                                        child: Text(
                                          'Wishlist',
                                          style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 19,
                                          ),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => WishlistScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.grey.shade300,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 150,
                                  child: Image(
                                    image: AssetImage('images/inapp/im07.png'),
                                  ),
                                ),
                                ProfileHeaderLabel(
                                  headerLabel: '  Account Info.  ',
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Container(
                                    height: 260,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Column(
                                      children: [
                                        RepeatedListTile(
                                          icon: Icons.email,
                                          Subtitle: data['email'],
                                          title: 'Email Address',
                                        ),
                                        YellowDivider(),
                                        RepeatedListTile(
                                          icon: Icons.phone,
                                          Subtitle: data['phone'],
                                          title: 'Phone No',
                                        ),
                                        YellowDivider(),
                                        RepeatedListTile(
                                          icon: Icons.location_pin,
                                          Subtitle: data['address'],
                                          title: 'Address',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                ProfileHeaderLabel(
                                  headerLabel: '  Account Settings  ',
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Container(
                                    height: 260,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Column(
                                      children: [
                                        RepeatedListTile(
                                          title: ' Edit Profile ',
                                          Subtitle: '',
                                          icon: Icons.edit,
                                          onPressed: () {},
                                        ),
                                        YellowDivider(),
                                        RepeatedListTile(
                                          title: 'Change Password',
                                          icon: Icons.lock,
                                          onPressed: () {},
                                        ),
                                        YellowDivider(),
                                        RepeatedListTile(
                                          title: 'Log Out',
                                          icon: Icons.logout,
                                          onPressed: () async {
                                            MyAlertDialog.showMyDialog(
                                              context: context,
                                              title: 'Log Out',
                                              content:
                                                  'Are you sure to log out ?',
                                              tabNo: () {
                                                Navigator.pop(context);
                                              },
                                              tabYes: () async {
                                                await FirebaseAuth.instance
                                                    .signOut();
                                                Navigator.pop(context);
                                                Navigator.pushReplacementNamed(
                                                  context,
                                                  'welcome_screen',
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        return Center(child: CircularProgressIndicator(color:Colors.amberAccent));
      },
    );
  }
}

class YellowDivider extends StatelessWidget {
  const YellowDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Divider(color: Colors.yellow, thickness: 1),
    );
  }
}

class RepeatedListTile extends StatelessWidget {
  final String title;
  final String Subtitle;
  final IconData icon;
  final Function()? onPressed;
  const RepeatedListTile({
    Key? key,
    required this.icon,
    this.onPressed,
    this.Subtitle = '',
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        title: Text(title),
        subtitle: Text(Subtitle),
        leading: Icon(icon),
      ),
    );
  }
}

class ProfileHeaderLabel extends StatelessWidget {
  final String headerLabel;
  const ProfileHeaderLabel({Key? key, required this.headerLabel})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            width: 50,
            child: Divider(color: Colors.grey, thickness: 1),
          ),
          Text(
            headerLabel,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 40,
            width: 50,
            child: Divider(color: Colors.grey, thickness: 1),
          ),
        ],
      ),
    );
  }
}
