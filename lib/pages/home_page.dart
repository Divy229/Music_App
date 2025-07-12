import 'package:flutter/material.dart';
import 'package:musicapp/components/my_drawer.dart';
import 'package:musicapp/models/playlist_provider.dart';
import 'package:musicapp/models/song.dart';
import 'package:musicapp/pages/song_page.dart';
import 'package:provider/provider.dart';

import '../models/playlist_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class  _HomePageState extends State<HomePage> {
  late final dynamic playlistprovider;

  @override
  void initState(){
    super.initState();

    playlistprovider= Provider.of<PlaylistProvider>(context, listen: false);

  }

  void gotoSong(int songIndex) {
    playlistprovider.currentSongIndex = songIndex;

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SongPage(),
      ),
    );
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("P L A Y L I S T"),
        backgroundColor: Colors.tealAccent),
      drawer: const MyDrawer(),
      body: Consumer<PlaylistProvider>(
        builder: (context, value, child) {
           //get the play list
          final List<Song> playlist = value.playlist;
          //return listview ui
            return ListView.builder(
              itemCount: playlist.length,
          itemBuilder: (context, index) {
      //get indvidual song
        final Song song= playlist[index];
    //return listtile ui
     return ListTile(
    title: Text(song.songname),
       subtitle: Text(song.artistname),
       leading: Image.asset(song.albumArtImagename),
       onTap: () => gotoSong(index),

              );
            },
          );
        },
      ),
    );
  }
}