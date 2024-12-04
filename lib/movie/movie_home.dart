import 'package:flutter/material.dart';
import 'package:project_flutter/config/config.dart';
import 'package:project_flutter/model/film_model.dart';
import 'package:project_flutter/services/get_film.dart';
import 'package:project_flutter/widgets/RowFilm.dart';

class MovieHome extends StatefulWidget {
  const MovieHome({super.key});

  @override
  State<MovieHome> createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome> {
  List<FilmModel> listOfPopularFilm = [];
  List<FilmModel> listOfTopRatedFilm = [];
  List<FilmModel> listOfUpcomingFilm = [];

  int currentIndexSlider = 0;
  bool isLoading = true;

  getFilm() async {
    listOfPopularFilm = await GetFilm().getPopularFilm();
    listOfTopRatedFilm = await GetFilm().getTopRatedFilm();
    listOfUpcomingFilm = await GetFilm().getUpcomingFilm();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getFilm();
  }

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
              _rowFilm('Top Rated', listOfTopRatedFilm),
              _rowFilm('Popular', listOfPopularFilm),
              _rowFilm('Upcoming', listOfUpcomingFilm),
              // _rowFilmPopular(),
            ],
          ),
        ),
      ),
    );
  }

  _rowFilm(title, list) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Text(
                'See All',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var i = 0; i < list.length; i++)
                  RowFilm(filmModel: list[i])
              ],
            ),
          ),
        ],
      ),
    );
  }

  _rowFilmPopular() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      child: Column(
        children: [
          const Row(
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
          const SizedBox(
            height: 12,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var i = 0; i < listOfPopularFilm.length; i++)
                  RowFilm(filmModel: listOfPopularFilm[i])
              ],
            ),
          ),
        ],
      ),
    );
  }

  _appBar() {
    return const Padding(
      padding: EdgeInsets.only(
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
    return isLoading
        ? const SizedBox(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(color: Colors.blueAccent),
            ),
          )
        : SizedBox(
            height: 200,
            child: PageView.builder(
              itemCount: listOfPopularFilm.length,
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
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: NetworkImage(
                              '$baseImageUrl/${listOfPopularFilm[index].backdropPath ?? ''}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: 200,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xff685CF0),
                            const Color(0xff685CF0).withOpacity(0.9),
                            Colors.transparent
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      padding: const EdgeInsets.only(
                        left: 40,
                        top: 20,
                        bottom: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listOfPopularFilm[index].title ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            listOfPopularFilm[index].overview ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text(
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
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var i = 0; i < listOfPopularFilm.length; i++)
            i == currentIndexSlider
                ? Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: 30,
                    height: 8,
                    decoration: BoxDecoration(
                      color: const Color(0xff685CF0),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  )
                : Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 3,
                    ),
                    decoration: const BoxDecoration(
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
