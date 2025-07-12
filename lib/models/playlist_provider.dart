import 'package:flutter/widgets.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:musicapp/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
   final List<Song> _Playlist = [
    Song(
        songname: "best gujarati",
        artistname: "sajna",
        albumArtImagename: "assets/images/best gujarati.png",
        audiopath: "audio/Sajna.mp3"),
    Song(
        songname: "valam avo ne",
        artistname: "sachin jigar",
        albumArtImagename: "assets/images/valam avo ne.png",
        audiopath: "audio/Vhalam_Aavo_Ne.mp3"),
    Song(
        songname: "khoobsurat",
        artistname: "sachin jigar",
        albumArtImagename: "assets/images/khoobsurat.png",
        audiopath: "audio/Khoobsurat.mp3"),
    Song(
        songname: "jailer",
        artistname: "anirudh nalson",
        albumArtImagename: "assets/images/jailer.png",
        audiopath: "audio/JAILER.mp3"),
    Song(
        songname: "night change",
        artistname: "one direction",
        albumArtImagename: "assets/images/night change.png",
        audiopath: "audio/night_change.mp3"),
    Song(
        songname: "tedo tedo",
        artistname: "amit trivedi",
        albumArtImagename: "assets/images/tedo tedo.png",
        audiopath: "audio/Tedo_Tedo.mp3"),
    Song(
        songname: "ed sheeran",
        artistname: "sapphire",
        albumArtImagename: "assets/images/sapphire.png",
        audiopath: "audio/Ed_Sheeran_sapphire.mp3"),
  ];

  int? _currentSongIndex;
  final AudioPlayer _audioPlayer = AudioPlayer();

  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  bool _isPlaying = false;

  PlaylistProvider() {
    listenToDuration();
  }

  // Play a song
  void play() async {
    if (_currentSongIndex == null) return;
    final path = _Playlist[_currentSongIndex!].audiopath;
    try {
      await _audioPlayer.stop();
      await _audioPlayer.play(AssetSource(path));
      _isPlaying = true;
      notifyListeners();
    } catch (e) {
      print("Error playing song: $e");
    }
  }

  // Pause playback
  void pause() async {
    try {
      await _audioPlayer.pause();
      _isPlaying = false;
      notifyListeners();
    } catch (e) {
      print("Error pausing: $e");
    }
  }

  // Resume playback
  void resume() async {
    try {
      await _audioPlayer.resume();
      _isPlaying = true;
      notifyListeners();
    } catch (e) {
      print("Error resuming: $e");
    }
  }

  // Toggle pause/resume
  void pauseOrResume() {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
  }

  // Seek
  void seek(Duration position) async {
    try {
      await _audioPlayer.seek(position);
    } catch (e) {
      print("Error seeking: $e");
    }
  }

  // Play next song
  void playNextSong() {
    if (_Playlist.isEmpty) return;

    _currentSongIndex = (_currentSongIndex ?? 0 + 1) % _Playlist.length;
    play();
  }

  // Play previous song
  void playPreviousSong() {
    if (_currentSongIndex == null) return;

    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    } else {
      if (_currentSongIndex! > 0) {
        _currentSongIndex = _currentSongIndex! - 1;
      } else {
        _currentSongIndex = _Playlist.length - 1;
      }
      play();
    }
    notifyListeners();
  }

  // Track progress
  void listenToDuration() {
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  // Getters
  List<Song> get playlist => _Playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  // Setter
  set currentSongIndex(int? newIndex) {
    _currentSongIndex = newIndex;
    if (newIndex != null) {
      play();
    }
    notifyListeners();
  }
}


