import 'package:edupro/screens/All_Category_Screen.dart';
import 'package:edupro/screens/Notification_Screen.dart';
import 'package:edupro/screens/profile_screen.dart';
import 'package:edupro/screens/program_list_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final gradient = const LinearGradient(
    colors: [Color(0xFF6C63FF), Color(0xFF3A8DFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _buildHomeUI(),
          const _PlaceholderScreen(title: "Explore"),
          const _PlaceholderScreen(title: "Programs"),
          const _PlaceholderScreen(title: "Profile"),
        ],
      ),

      // 🌈 Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF6C63FF),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon:IconButton(onPressed: (){}, icon: Icon(Icons.home_filled)), label: "Home"),
          BottomNavigationBarItem(icon: IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AllCategoryScreen(),));
          }, icon: Icon(Icons.search_outlined)), label: "Explore"),
          BottomNavigationBarItem(icon:IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProgramListScreen(),));
          }, icon: Icon(Icons.menu_book_rounded)), label: "Programs"),
          BottomNavigationBarItem(icon:IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(),));

          }, icon:Icon(Icons.person_2_rounded)), label: "Profile"),
        ],
      ),
    );
  }

  // -------------------- Home UI --------------------
  Widget _buildHomeUI() {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Greeting
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Hi,AVINASH",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1B1D3A),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "What would you like to learn today?\nSearch below.",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                Container(
                  height: 40,
                  width:40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blueAccent, width: 1.5),
                  ),
                  child: IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen(),));
                  }, icon: Icon(Icons.notifications),color: Colors.blueAccent,alignment: Alignment(0,10),),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.grey),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search for..",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF6C63FF), Color(0xFF3A8DFF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.tune, color: Colors.white, size: 20),
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Special Offer
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: gradient,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("25% OFF*",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                  SizedBox(height: 6),
                  Text("Today's Special",
                      style: TextStyle(
                          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 6),
                  Text(
                    "Get a discount for every course order.\nOnly valid for today!",
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Categories
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Categories",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF1B1D3A)),
                ),
                InkWell(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AllCategoryScreen(),));
                },
                  child: const Text("SEE ALL",
                      style: TextStyle(color: Color(0xFF3A8DFF), fontWeight: FontWeight.w600)),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 16,
              children: const [
                _CategoryChip("3D Design", false),
                _CategoryChip("Arts & Humanities", true),
                _CategoryChip("Graphic Design", false),
              ],
            ),

            const SizedBox(height: 20),

            // Popular Courses
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Courses",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFF1B1D3A)),
                ),
                InkWell(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProgramListScreen(),));
                },
                  child: const Text("SEE ALL",
                      style: TextStyle(color: Color(0xFF3A8DFF), fontWeight: FontWeight.w600)),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 240,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _CourseCard(
                    category: "Graphic Design",
                    title: "Graphic Design Advanced",
                    price: "850/-",
                    rating: "4.2",
                    students: "7830",
                  ),
                  _CourseCard(
                    category: "Graphic Design",
                    title: "Advertisement Masterclass",
                    price: "400/-",
                    rating: "4.1",
                    students: "6120",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Top Mentors
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Top Mentor",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF1B1D3A))),
                Text("SEE ALL",
                    style: TextStyle(color: Color(0xFF3A8DFF), fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _MentorCard("Jiya"),
                  _MentorCard("Aman"),
                  _MentorCard("Rahul.J"),
                  _MentorCard("Manav"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- Helper Widgets ----------------

class _CategoryChip extends StatelessWidget {
  final String text;
  final bool active;
  const _CategoryChip(this.text, this.active);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: active ? const Color(0xFF3A8DFF) : const Color(0xFFF0F2F5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: active ? Colors.white : Colors.grey[700],
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  final String category, title, price, rating, students;
  const _CourseCard({
    required this.category,
    required this.title,
    required this.price,
    required this.rating,
    required this.students,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 110,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFEAEAFF),
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: const Icon(Icons.play_circle_fill,
                color: Color(0xFF6C63FF), size: 40),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(category,
                    style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1B1D3A))),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(price,
                        style: const TextStyle(
                            color: Color(0xFF3A8DFF),
                            fontWeight: FontWeight.bold)),
                    const SizedBox(width: 8),
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    Text(rating, style: const TextStyle(color: Colors.grey)),
                    const SizedBox(width: 6),
                    Text("| $students Std",
                        style:
                        const TextStyle(color: Colors.grey, fontSize: 12))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MentorCard extends StatelessWidget {
  final String name;
  const _MentorCard(this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: const Color(0xFFEAEAFF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.person, size: 28, color: Color(0xFF3A8DFF)),
          ),
          const SizedBox(height: 6),
          Text(
            name,
            style:
            const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

// Placeholder for other tabs
class _PlaceholderScreen extends StatelessWidget {
  final String title;
  const _PlaceholderScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title,
          style: const TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.grey)),
    );
  }
}
