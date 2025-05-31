import 'package:demo001/dashboard/004/components/my_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'components/multis_segment_circular_progress.dart';

class DashboardScreen004 extends StatefulWidget {
  const DashboardScreen004({super.key});

  @override
  State<DashboardScreen004> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen004> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Task> tasks = [
    Task(
      name: 'Prepare Pitch Deck',
      summary: 'Finalize slides for product presentation.',
      daysLeft: 5,
      progress: 0.6,
      userAvatars: ['assets/images/usr_001.png', 'assets/images/usr_002.png'],
    ),
    Task(
      name: 'Fix UI Bug',
      summary: 'Resolve layout issue in TaskDetail screen.',
      daysLeft: 2,
      progress: 0.4,
      userAvatars: ['assets/images/usr_003.png'],
    ),
    Task(
      name: 'Write Report',
      summary: 'Summarize results from latest sprint.',
      daysLeft: 3,
      progress: 0.8,
      userAvatars: ['assets/images/usr_001.png', 'assets/images/usr_003.png'],
    ),
  ];

  final List<RecentFile> recentFiles = [
    RecentFile(
      icon: Icons.picture_as_pdf,
      fileName: 'Prepare Pitch Deck',
      date: '30 May 2025',
      fileSize: '3.8 MB',
    ),
    RecentFile(
      icon: Icons.image,
      fileName: 'Final UI Mockups',
      date: '28 May 2025',
      fileSize: '2.4 MB',
    ),
    RecentFile(
      icon: Icons.insert_drive_file,
      fileName: 'Product Requirement Document',
      date: '27 May 2025',
      fileSize: '1.5 MB',
    ),
    RecentFile(
      icon: Icons.bar_chart,
      fileName: 'User Research Report',
      date: '25 May 2025',
      fileSize: '4.2 MB',
    ),
    RecentFile(
      icon: Icons.code,
      fileName: 'API Integration Guide',
      date: '24 May 2025',
      fileSize: '1.1 MB',
    ),
    RecentFile(
      icon: Icons.video_file,
      fileName: 'Demo Walkthrough Video',
      date: '22 May 2025',
      fileSize: '12.7 MB',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFF4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          MyDropdownButtonItem(
            current: 'Overall',
            data: ['Overall', 'Monthly', 'Weekly'],
            onChanged: (value) {},
          ),
          SizedBox(
            width: 16,
          )
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFloatingActionButton(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              child: const MultiSegmentCircularProgress(
                  done: 0.45, pending: 0.15, todo: 0.3, other: 0.1),
            ),
            SizedBox(
              height: 10,
            ),
            _buildPendingTitle(),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 180,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tasks.length,
                  padding: EdgeInsets.only(left: 16),
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return _buildProjectCard(
                        title: task.name,
                        description: task.summary,
                        daysLeft: task.daysLeft,
                        progress: task.progress,
                        userAvatars: task.userAvatars);
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            _buildRecentFileTitle(),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: recentFiles.map((file) {
                  return _buildRecentFileItem(
                      icon: file.icon,
                      fileName: file.fileName,
                      date: file.date,
                      fileSize: file.fileSize);
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Colors.white,
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () => _onItemTapped(0),
            color: _selectedIndex == 0 ? Colors.deepPurple : Colors.grey,
          ),
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () => _onItemTapped(1),
            color: _selectedIndex == 1 ? Colors.deepPurple : Colors.grey,
          ),
          const SizedBox(width: 48), // Khoảng trống cho FAB
          IconButton(
            icon: const Icon(Icons.folder_open),
            onPressed: () => _onItemTapped(2),
            color: _selectedIndex == 2 ? Colors.deepPurple : Colors.grey,
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => _onItemTapped(3),
            color: _selectedIndex == 3 ? Colors.deepPurple : Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        // Xử lý khi nhấn nút FAB
      },
      backgroundColor: Colors.deepPurple,
      shape: const CircleBorder(),
      child: const Icon(Icons.add, color: Colors.white),
    );
  }

  Widget _buildRecentFileTitle() {
    return const Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Text(
        'Recent Files',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildPendingTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Pending Project',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('View All'),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentFileItem({
    required IconData icon,
    required String fileName,
    required String date,
    required String fileSize,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.deepOrangeAccent),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(fileName,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(date,
                    style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          Text(
            fileSize,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          )
        ],
      ),
    );
  }

  Widget _buildProjectCard({
    required String title,
    required String description,
    required int daysLeft,
    required double progress,
    required List<String> userAvatars,
  }) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$daysLeft days left',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 30,
                    width: 50 + userAvatars.length * 15.0,
                    child: Stack(
                      children: userAvatars.asMap().entries.map((entry) {
                        int idx = entry.key;
                        String avatarAssetPath = entry.value;
                        return Positioned(
                          left: idx * 15.0,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage(avatarAssetPath),
                            backgroundColor: Colors.white,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                CircularPercentIndicator(
                  radius: 20.0,
                  lineWidth: 4.0,
                  percent: progress,
                  progressColor: Colors.deepPurple,
                  backgroundColor: Colors.grey.shade200,
                  center: Text(
                    '${(progress * 100).toInt()}%',
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Task {
  final String name;
  final String summary;
  final int daysLeft;
  final double progress;
  final List<String> userAvatars;

  Task({
    required this.name,
    required this.summary,
    required this.daysLeft,
    required this.progress,
    required this.userAvatars,
  });
}

class RecentFile {
  final IconData icon;
  final String fileName;
  final String date;
  final String fileSize;

  RecentFile({
    required this.icon,
    required this.fileName,
    required this.date,
    required this.fileSize,
  });
}
