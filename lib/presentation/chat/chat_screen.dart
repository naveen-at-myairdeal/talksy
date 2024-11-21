import 'package:flutter/material.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:talksy/domain/constants/asset_paths.dart';
import 'package:talksy/domain/functions.dart';
import 'dart:math';

import 'package:talksy/domain/theme/app_theme.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  bool isPlaying1 = false;
  bool isPlaying2 = false;
  String? errorMessage;
  double playbackProgress1 = 0.0;
  double playbackProgress2 = 0.0;
  String dropDownValue = "English";
  final Random _random = Random();

  // Sample messages data
  final List<Map<String, dynamic>> messages = [
    {
      'text': 'Hai, Good Morning',
      'isUser': true,
      'time': '6:01 PM',
       'author': 'Monisha Pandey'
    },
    {
      'text': 'How you doing ?',
      'isUser': true,
      'time': '6:01 PM',
    },
    {
      'text': 'Hey Jack, Im doing good re',
      'isUser': false,
      'time': '6:30 PM',
      // 'author': 'Monisha Pandey',
    },
    {
      'text': 'Good!',
      'isUser': false,
      'time': '6:30 PM',
    },
    {
      'isAudio': true,
      'isUser': false,
      'time': '6:30 PM',
      'duration': '0:12',
    },
    {
      'isAudio': true,
      'isUser': true,
      'time': '6:31 PM',
      'duration': '0:09',
       'author': 'Sudarshan Krishna'
    },
    {
      'text': 'Breakfast?',
      'isUser': true,
      'time': '6:32 PM',
    },
  ];

  @override
  void initState() {
    super.initState();
    _initializeAudio();
  }

  Future<void> _initializeAudio() async {
    try {
      await FlameAudio.audioCache.loadAll([
        'sample-9s.mp3',
        'sample-12s.mp3',
      ]);
    } catch (e) {
      debugPrint("Error initializing audio: $e");
      if (mounted) {
        setState(() {
          errorMessage = "Error loading audio files: $e";
        });
      }
    }
  }

  Future<void> _togglePlayPause(bool isUser, bool isPlaying) async {
    try {
      final audioFile = isUser ? 'sample-9s.mp3' : 'sample-12s.mp3';

      if (isPlaying) {
        FlameAudio.bgm.stop();
        setState(() {
          if (isUser) {
            isPlaying1 = false;
          } else {
            isPlaying2 = false;
          }
        });
      } else {
        // Stop any currently playing audio
        FlameAudio.bgm.stop();
        setState(() {
          isPlaying1 = false;
          isPlaying2 = false;
          playbackProgress1 = 0.0;
          playbackProgress2 = 0.0;
        });

        // Play the selected audio
        await FlameAudio.playLongAudio('$audioFile');
        setState(() {
          isPlaying1 = isUser;
          isPlaying2 = !isUser;
        });

        // Simulate progress updates with variable speed
        if (mounted) {
          final duration = isUser ? 9000 : 12000; // Duration in milliseconds
          final updateInterval = 50; // Update every 50ms for smoother animation

          for (int i = 0; i <= duration; i += updateInterval) {
            await Future.delayed(Duration(milliseconds: updateInterval));
            if (mounted && (isUser ? isPlaying1 : isPlaying2)) {
              setState(() {
                if (isUser) {
                  playbackProgress1 = i / duration;
                } else {
                  playbackProgress2 = i / duration;
                }
              });
            } else {
              break;
            }
          }

          if (mounted) {
            setState(() {
              if (isUser) {
                isPlaying1 = false;
                playbackProgress1 = 0.0;
              } else {
                isPlaying2 = false;
                playbackProgress2 = 0.0;
              }
            });
          }
        }
      }
    } catch (e) {
      debugPrint("Error toggling playback: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error playing audio: $e")),
        );
      }
    }
  }

  Widget _buildCustomWaveform(double progress, bool isUser) {
    return CustomPaint(
      size: Size(MediaQuery.of(context).size.width * 0.4, 40),
      painter: WaveformPainter(
        progress: progress,
        isUser: isUser,
        seed: isUser ? 42 : 83, // Different seeds for different patterns
      ),
    );
  }

  String _formatDuration(int milliseconds) {
    final seconds = (milliseconds / 1000).round();
    return '0:${seconds.toString().padLeft(2, '0')}';
  }

  Widget _buildMessage(Map<String, dynamic> message) {
    final isUser = message['isUser'] as bool;
    final isAudio = message['isAudio'] as bool? ?? false;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: isUser ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: [
                if (message['author'] != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      message['author'],
                      style: TextStyle(
                        color: Colors.purple[700],
                        fontSize: 12,
                      ),
                    ),
                  ),
                Row(
                  children: [
                    isUser ? Container() : Spacer(),
                    Container(
                      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 30, left: 16),
                      decoration: BoxDecoration(
                        color: isUser ? Colors.purple[100] : Colors.grey[300],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: isAudio
                          ? _buildAudioPlayer(
                              isUser,
                              isUser ? isPlaying1 : isPlaying2,
                              isUser ? playbackProgress1 : playbackProgress2,
                              message['duration'] ?? '0:00',
                            )
                          : Text(
                              message['text'],
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                              ),
                            ),
                    ),
                    isAudio
                        ? GestureDetector(
                            onTap: () {
                              showLanguageModalSheet(context);
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 5),
                              height: 50,
                              width: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(5),
                                color: isUser ? Colors.purple[100] : Colors.grey[300],
                              ),
                              child: Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: AppTheme.primaryColor,
                              ),
                            ),
                          )
                        : Container()
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    message['time'],
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAudioPlayer(bool isUser, bool isPlaying, double progress, String duration) {
    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              child: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                color: AppTheme.primaryColor,
              ),
              onTap: () => _togglePlayPause(isUser, isPlaying),
              // color: Colors.purple,
              // padding: EdgeInsets.zero,
              // constraints: const BoxConstraints.tightFor(width: 6, height: 6),
            ),
            const SizedBox(width: 8),
            _buildCustomWaveform(progress, isUser),
            const SizedBox(width: 8),
          ],
        ),
        Positioned(
          bottom: 0,
          right: -00,
          child: Text(
            duration,
            style: TextStyle(
              color: Colors.purple[700],
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Back Button
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.purple),
                    onPressed: () {
                      // Action for back button
                    },
                  ),

                  // Profile Picture and Group Name
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/images/placeholder/2.png'), // Replace with image URL or AssetImage
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'XYZ Group',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Language Dropdown and Icons
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 7),
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: AppTheme.accentColor,
                        ),
                        child: DropdownButton<String>(
                          value: dropDownValue,
                          icon: const Icon(Icons.arrow_drop_down, color: Colors.purple),
                          underline: const SizedBox(),
                          items: <String>['English', 'Spanish', 'French'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: AppTheme.labelMedium,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              dropDownValue = value!;
                            });
                            // Action for dropdown selection
                          },
                        ),
                      ),
                      // const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(Icons.phone, color: Colors.purple),
                        onPressed: () {
                          // Action for phone button
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.videocam, color: Colors.purple),
                        onPressed: () {
                          // Action for video button
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (errorMessage != null)
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.red[100],
                child: Text(errorMessage!, style: const TextStyle(color: Colors.red)),
              ),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return _buildMessage(messages[index]);
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.purple[50],
                border: Border(
                  top: BorderSide(color: Colors.grey[300]!),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.emoji_emotions_outlined),
                    onPressed: () {},
                    color: Colors.purple,
                  ),
                  Expanded(
                    child: Container(
                      constraints: BoxConstraints(
                        maxHeight: 80, // Limits the height to approximately 4-5 lines
                      ),
                      child: Scrollbar(
                        thumbVisibility: true,
                        child: TextField(
                          onSubmitted: (value) {},
                          controller: _messageController,
                          decoration: const InputDecoration(
                            hintText: 'Message',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                          ),
                          maxLines: null, // Allows the user to write multiple lines
                          keyboardType: TextInputType.multiline,
                          scrollPhysics: BouncingScrollPhysics(), // Adds a smooth scrolling effect
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      setState(() {
                        messages.add({
                          'text': _messageController.text,
                          'isUser': false,
                          'time': getCurrentTimeFormatted(),
                        });
                      });
                      _messageController.clear();
                    },
                    color: Colors.purple,
                  ),
                  IconButton(
                    icon: const Icon(Icons.camera_alt_outlined),
                    onPressed: () {},
                    color: Colors.purple,
                  ),
                  IconButton(
                    icon: const Icon(Icons.mic_outlined),
                    onPressed: () {},
                    color: Colors.purple,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}

class WaveformPainter extends CustomPainter {
  final double progress;
  final bool isUser;
  final int seed;
  final Random _random;
  final List<double> _heights = [];
  final int totalBars = 40;

  WaveformPainter({
    required this.progress,
    required this.isUser,
    required this.seed,
  }) : _random = Random(seed) {
    _generateWaveform();
  }

  void _generateWaveform() {
    if (_heights.isEmpty) {
      // Generate base heights with multiple wave patterns
      for (int i = 0; i < totalBars; i++) {
        // Combine multiple sine waves with different frequencies
        double wave1 = sin(i * 0.3) * 0.3;
        double wave2 = sin(i * 0.7) * 0.2;
        double wave3 = sin(i * 1.1) * 0.1;

        // Add random noise
        double noise = _random.nextDouble() * 0.4 - 0.2;

        // Combine waves and noise
        double height = 0.4 + wave1 + wave2 + wave3 + noise;

        // Ensure height is within bounds
        height = height.clamp(0.15, 0.85);

        // Smooth transitions between neighboring bars
        if (i > 0) {
          double prevHeight = _heights[i - 1];
          height = (height + prevHeight) / 2.1;
        }

        _heights.add(height);
      }

      // Add random peaks
      for (int i = 0; i < 6; i++) {
        int peakIndex = _random.nextInt(totalBars);
        _heights[peakIndex] = 0.7 + _random.nextDouble() * 0.2;

        // Smooth out around peaks
        if (peakIndex > 0) {
          _heights[peakIndex - 1] = (_heights[peakIndex] + _heights[peakIndex - 1]) / 2;
        }
        if (peakIndex < totalBars - 1) {
          _heights[peakIndex + 1] = (_heights[peakIndex] + _heights[peakIndex + 1]) / 2;
        }
      }
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    final progressWidth = size.width * progress;
    final barSpacing = 1.5;
    final barWidth = (size.width - (totalBars - 1) * barSpacing) / totalBars;

    for (int i = 0; i < totalBars; i++) {
      final x = i * (barWidth + barSpacing);
      final barHeight = size.height * _heights[i];
      final centerY = size.height / 2;

      // Determine if this bar should be colored as progress
      if (x <= progressWidth) {
        paint.color = isUser ? Colors.purpleAccent.withOpacity(0.9) : Colors.purple.withOpacity(0.9);
      } else {
        paint.color = isUser ? Colors.purple.withOpacity(0.5) : Colors.purple.withOpacity(0.3);
      }

      // Draw mirror effect (top and bottom bars)
      canvas.drawLine(
        Offset(x, centerY - barHeight / 2),
        Offset(x, centerY + barHeight / 2),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(WaveformPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

void showLanguageModalSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return LanguageModalContent();
    },
  );
}

class LanguageModalContent extends StatefulWidget {
  @override
  _LanguageModalContentState createState() => _LanguageModalContentState();
}

class _LanguageModalContentState extends State<LanguageModalContent> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;

  final List<String> languages = ['English', 'Hindi', 'Chinese', 'Arabic', 'Malayalam'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: languages.length, vsync: this);
  }

  void toggleAudio() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('assets/audio/sample-12s.mp3')); // Replace with your audio URL
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * (0.6),
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            controller: _tabController,
            labelColor: Colors.purple,
            unselectedLabelStyle: AppTheme.labelSmallGreyColor,
            labelStyle: AppTheme.labelSmallPrimaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.purple,
            tabs: languages
                .map((lang) => Tab(
                      text: lang,
                    ))
                .toList(),
          ),
          SizedBox(height: 16),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: languages.map((lang) {
                return Text(
                  'Content in ${lang == languages[0]}',
                  style: TextStyle(fontSize: 16),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 16),
          GestureDetector(
            onTap: toggleAudio,
            child: Column(
              children: [
                Container(
                  height: 50,
                  child: Center(
                    child: Icon(
                      isPlaying ? Icons.pause_circle : Icons.play_circle,
                      color: Colors.purple,
                      size: 48,
                    ),
                  ),
                ),
                Slider(
                  value: 0.0, // Replace with actual audio position
                  onChanged: (value) {},
                  activeColor: Colors.purple,
                  inactiveColor: Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
