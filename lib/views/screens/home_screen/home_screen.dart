import 'package:flutter/material.dart';
import 'package:just_travel/views/screens/home_screen/components/upcoming_trip.dart';
import '../../widgets/app_text.dart';
import 'components/custom_app_bar.dart';
import 'components/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            //Appbar
            const CustomAppBar(),
            const SizedBox(
              height: 15,
            ),
            //Search options
            const SearchBar(),
            const SizedBox(
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
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: AppText(
                title: 'Upcoming Trip',
              ),
            ),

            const SizedBox(
              height: 7,
            ),
            const UpComingTrip(),
          ],
        ),
      ),
    );
  }
}
