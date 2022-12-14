import 'package:flutter/material.dart';
import 'package:just_travel/providers/trip_provider.dart';
import 'package:just_travel/providers/user_provider.dart';
import 'package:just_travel/utils/constants/urls.dart';
import 'package:just_travel/views/pages/home-page/components/drawer_button.dart';
import 'package:just_travel/views/pages/home-page/components/upcoming_trip.dart';
import 'package:just_travel/views/pages/profile-page/profile_page.dart';
import 'package:just_travel/views/widgets/appbar_layout.dart';
import 'package:just_travel/views/widgets/circular_image_layout.dart';
import 'package:just_travel/views/widgets/profile_circular_image.dart';
import 'package:provider/provider.dart';
import '../../../services/auth/auth_service.dart';
import 'components/search_bar.dart';
import 'components/drawer/user_drawer.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration.zero,
      () {
        context.read<UserProvider>().fetchUserByEmail(AuthService.user!.email!);
      },
    );

    return RefreshIndicator(
      onRefresh: () async {
        context.read<TripProvider>().onInit();
        context.read<UserProvider>().fetchUserByEmail(AuthService.user!.email!);
      },
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        // TODO: Drawer will be added
        drawer: const UserDrawer(),
        appBar: appbarLayout(
          leading: const DrawerButton(),
          title: 'Home',
          iconTheme: Theme.of(context).iconTheme,
          textStyle: Theme.of(context).textTheme.headline6,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ProfilePage.routeName);
              },
              child: SizedBox(
                height: 60,
                width: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<UserProvider>(
                    builder: (context, usrProvider, child) {
                      return usrProvider.user!.profileImage == null
                          ? CircleAvatar(
                              radius: 50,
                              child: Text(
                                context
                                    .read<UserProvider>()
                                    .user!
                                    .name!
                                    .substring(0, 2),
                              ),
                            )
                          : CircularImageLayout(
                              height: 40,
                              width: 40,
                              image:
                                  '${baseUrl}uploads/${usrProvider.user!.profileImage}',
                            );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: ListView(
            children: const [
              //Appbar
              // const CustomAppBar(),
              // const SizedBox(
              //   height: 15,
              // ),
              //Search options
              SizedBox(
                height: 30,
              ),
              SearchBar(),

              SizedBox(
                height: 20,
              ),
              //popular trip text
              // Padding(
              //   padding: const EdgeInsets.only(left: 10.0),
              //   child: AppText(
              //     title: 'Popular Trip',
              //   ),
              // ),
              //popular trip cards horizontal listview in a container
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: 230,
              //   margin: const EdgeInsets.all(10),
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: tripPackages.length,
              //     itemBuilder: (context, index) => TravelCard(
              //       title: tripPackages[index].title,
              //       location: tripPackages[index].location,
              //       image: tripPackages[index].images[0],
              //       availableDate: tripPackages[index].availableDate,
              //     ),
              //   ),
              // ),

              //upcoming trip text
              // Padding(
              //   padding: const EdgeInsets.only(left: 10.0),
              //   child: AppText(
              //     title: 'Upcoming Trip',
              //   ),
              // ),

              SizedBox(
                height: 7,
              ),
              UpComingTrip(),
            ],
          ),
        ),
      ),
    );
  }
}
