import 'package:flutter/material.dart';
import 'package:project_flutter/widgets/RowFilm.dart';

class MovieHome extends StatefulWidget {
  const MovieHome({super.key});

  @override
  State<MovieHome> createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome> {
  List<Color> listOfColor = [
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.redAccent
  ];

  int currentIndexSlider = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              _appBar(),
              _slideImage(),
              _indicator(),
              _rowFilm(),
              _rowFilmPopular(),
            ],
          ),
        ),
      ),
    );
  }

  _rowFilm() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recomended for you',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                RowFilm(),
                RowFilm(),
                RowFilm(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _rowFilmPopular() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Film',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                RowFilm(),
                RowFilm(),
                RowFilm(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _appBar() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 25,
        right: 25,
        bottom: 30,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/image.jpeg'),
            radius: 25,
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Husain Rahmani',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    fontFamily: 'Clash Display',
                  ),
                ),
                Text(
                  'Maldives',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          InkWell(
            child: Icon(Icons.search),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            child: Icon(Icons.notifications),
          )
        ],
      ),
    );
  }

  _slideImage() {
    return Container(
      height: 200,
      child: PageView.builder(
        itemCount: listOfColor.length,
        onPageChanged: (value) {
          setState(
            () {
              currentIndexSlider = value;
            },
          );
        },
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage('assets/images/img_bg_build.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 200,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff685CF0),
                      Color(0xff685CF0).withOpacity(0.9),
                      Colors.transparent
                    ],
                  ),
                ),
              ),
              Container(
                width: 200,
                padding: EdgeInsets.only(
                  left: 40,
                  top: 20,
                  bottom: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Watch popular movies 1917',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipsci elit.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Watch Now',
                        style: TextStyle(
                          color: Color(0xff685CF0),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }

  _indicator() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var i = 0; i < listOfColor.length; i++)
            i == currentIndexSlider
                ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    width: 30,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Color(0xff685CF0),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  )
                : Container(
                    width: 8,
                    height: 8,
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),

          // ...listOfColor.map((e){
          //   return Container(
          //     margin: EdgeInsets.symmetric(horizontal: 3),
          //     width: 30,
          //     height: 8,
          //     decoration: BoxDecoration(
          //       color: Color(0xff685CF0),
          //       borderRadius: BorderRadius.circular(16)
          //     ),
          //   );
          // },),
        ],
      ),
    );
  }
}
