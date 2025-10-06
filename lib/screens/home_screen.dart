import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:runaway/models/catagory_model.dart';
import 'package:runaway/screens/catagory_screen.dart';
import 'package:runaway/widgets/costume_appbar.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String id = '/homepage';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      'asssets/video/video.mp4',
    )
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      })
      ..setLooping(true);
  }

  List<CatagoryModel> catagory = [
    CatagoryModel(image: 'asssets/home catagory/image (1).png', title: 'Women'),
    CatagoryModel(image: 'asssets/home catagory/image (2).png', title: 'Deals'),
    CatagoryModel(image: 'asssets/home catagory/image (3).png', title: 'Kids'),
    CatagoryModel(image: 'asssets/home catagory/image (4).png', title: 'Men'),
    CatagoryModel(image: 'asssets/home catagory/image.png', title: 'Home'),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CostumeAppbar(
        suffix: const Icon(Icons.menu),
        title: 'Runway',
        prefix: const Icon(Icons.notification_add),
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              width: double.infinity,
              height: screenHeight * 0.25,
              decoration: const BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Categories',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const Gap(15),
                    SizedBox(
                      height: screenHeight * 0.12,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: catagory.length,
                        itemBuilder: (context, idx) {
                          final item = catagory[idx];
                          return Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CatagoryScreen()));
                              },
                              child: Column(
                                children: [
                                  Image.asset(
                                    item.image,
                                    width: screenWidth * 0.18,
                                    height: screenHeight * 0.08,
                                    fit: BoxFit.contain,
                                  ),
                                  Text(
                                    item.title,
                                    style: TextStyle(
                                        fontSize: screenWidth * 0.035),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8), topRight: Radius.circular(8)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Likes',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_travel),
              label: 'Bags',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
              backgroundColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
