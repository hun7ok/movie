import 'package:flutter/material.dart';
import 'package:movie2/model/movie_model.dart';
import 'package:movie2/style/style.dart';
import 'package:movie2/bloc/movie_bloc.dart';

Style style = new Style();

class HomePage extends StatefulWidget {
  void initState() {
    mvcBlk.ambildata();
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: style.bg,
        appBar: AppBar(
          backgroundColor: style.bg,
          elevation: 0,
          leading: Icon(
            Icons.list,
            color: style.primary,
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.search,
                color: style.primary,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            width: size.width,
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CategorySeparator(
                  title: 'Yang Baru Release',
                ),
                Text(
                  'Catch the latest movies',
                  style: TextStyle(
                      color: style.secondary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                ListMovies(
                  size: size,
                ),
                SizedBox(
                  height: 40,
                ),
                CategorySeparator(
                  title: 'Comedy movies',
                ),
                Text(
                  'Catch the latest movies',
                  style: TextStyle(
                      color: style.secondary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 40,
                ),
                CategorySeparator(
                  title: 'Animated movies',
                ),
                Text(
                  'Catch the latest movies',
                  style: TextStyle(
                      color: style.secondary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}

class CategorySeparator extends StatefulWidget {
  final String title;

  CategorySeparator({@required this.title});

  @override
  _CategorySeparatorState createState() => _CategorySeparatorState();
}

class _CategorySeparatorState extends State<CategorySeparator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: TextStyle(
              color: style.primary, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Text(
          'View all',
          style: TextStyle(
              color: style.secondary,
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class ListMovies extends StatefulWidget {
  final Size size;

  ListMovies({@required this.size});

  @override
  _ListMoviesState createState() => _ListMoviesState();
}

class _ListMoviesState extends State<ListMovies> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width,
      height: 180,
      child: StreamBuilder<List<Movie_model>>(
          stream: mvcBlk.tampungdata,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error);
            } else if (snapshot.hasData == false) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Stack(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            "http://api.yousmartdata.net/assets/foto/" +
                                snapshot.data[index].fotofilm,
                            width: 170,
                            height: 180,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                            top: 10,
                            right: 10,
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: style.bg,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Icon(Icons.favorite,
                                  color: (index % 2) == 0
                                      ? style.accent
                                      : style.primary,
                                  size: 15),
                            )),
                        Positioned(
                            bottom: 10,
                            left: 10,
                            child: Text('Filme filme filme',
                                style: TextStyle(
                                    color: style.primary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900)))
                      ]));
                },
              );
            }
          }),
    );
  }
}
