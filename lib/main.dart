import 'package:examyys_web_app/views/cource_page.dart';
import 'package:examyys_web_app/views/cources_supported.dart';
import 'package:examyys_web_app/views/easy_home_page.dart';
import 'package:examyys_web_app/views/mobile_footer.dart';
import 'package:examyys_web_app/views/promo_area.dart';
import 'package:examyys_web_app/views/test_series.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ExamysApp());
}

class ExamysApp extends StatelessWidget {
  const ExamysApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Examys',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF4C4CED),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4C4CED),
          primary: const Color(0xFF4C4CED),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const ExamysHomePage(),
    );
  }
}

class ExamysHomePage extends StatefulWidget {
  const ExamysHomePage({super.key});

  @override
  State<ExamysHomePage> createState() => _ExamysHomePageState();
}

class _ExamysHomePageState extends State<ExamysHomePage> {
  int _selectedIndex = 0;

  // List of sample courses to populate the cards

  final List<String> _categories = [
    'All Courses',
    'RRB NTPC',
    'RRB JE',
    'Civil Services',
    'Banking'
  ];

  final List<Map<String, dynamic>> _courses = [
    {
      'title': 'RRB NTPC (CBT 1 + CBT 2)',
      'subtitle': 'Focus pack | 2 Years',
      'features': [
        'Foundation + In-depth - video, pdf and quiz',
        'Previous Year Paper Discussion',
        'Trend Questions by Examys AI',
        'Test Series and Doubt Clear'
      ],
      'originalPrice': '₹ 10599',
      'price': '₹ 5299',
    },
    {
      'title': 'RRB JE CBT 1',
      'subtitle': 'Focus pack | 1 Year',
      'features': [
        'Foundation + In-depth - video, pdf and quiz',
        'Previous Year Paper Discussion',
        'Trend Questions by Examys AI',
        'Test Series and Doubt Clear'
      ],
      'originalPrice': '₹ 8399',
      'price': '₹ 4199',
    },
    {
      'title': 'RRB JE CBT 1',
      'subtitle': 'Focus pack | 6 months',
      'features': [
        'Foundation + In-depth - video, pdf and quiz',
        'Previous Year Paper Discussion',
        'Trend Questions by Examys AI',
        'Test Series and Doubt Clear'
      ],
      'originalPrice': '₹ 7199',
      'price': '₹ 3599',
    },
  ];
  int _selectedCategory = 0;

@override
Widget build(BuildContext context) {
  // Check if we're on a mobile device
  bool isMobile = MediaQuery.of(context).size.width < 800;
  
  return Scaffold(
    appBar: isMobile ? _buildMobileAppBar() : _buildDesktopAppBar(),
    body: Stack(
      children: [
        Row(
          children: [
            // Show sidebar only on desktop
            if (!isMobile) _buildSidebar(),
            // Main content area
            Expanded(
              child: SingleChildScrollView(
                // Add padding at the bottom to ensure content isn't hidden behind the sticky button
                padding: EdgeInsets.only(bottom: isMobile ? 60 : 0),
                child: isMobile ? _buildMobileContent() : _buildDesktopContent(),
              ),
            ),
          ],
        ),
        // Sticky download button for mobile
        if (isMobile)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0, // Position it at the bottom
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: const Color(0xFF4C4CED),
              child: const Text(
                'Download App now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    ),
    bottomNavigationBar: isMobile ? _buildMobileBottomNav() : null,
  );
}

  AppBar _buildMobileAppBar() {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            children: [
              // Examys Logo
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF3332cb), // Royal blue color
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'Examys',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 10),

              // Search Bar
              Expanded(
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text(
                        'Search',
                        style: TextStyle(color: Colors.grey[400], fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 10),

              // Login Button
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF3332cb), // Royal blue color
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  AppBar _buildDesktopAppBar() {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Logo
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF3332cb),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Examys',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(width: 20),

            // Search bar
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(Icons.search, color: Colors.grey),
                    ),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 20),

            // Refer & Earn
            Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'Coming Soon',
                    style: TextStyle(color: Colors.white, fontSize: 8),
                  ),
                ),
                const Text(
                  'Refer & Earn',
                  style: TextStyle(color: Colors.black, fontSize: 13),
                ),
              ],
            ),

            const SizedBox(width: 20),

            // Coupon
            const Text(
              'Coupon',
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),

            const SizedBox(width: 20),

            // Download App
            const Text(
              'Download App',
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),

            const SizedBox(width: 20),

            // Language selector
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('English', style: TextStyle(fontSize: 14)),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_drop_down, size: 20),
                ],
              ),
            ),

            const SizedBox(width: 20),

            // Login button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4C4CED),
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
      automaticallyImplyLeading: false,
    );
  }

  Widget _buildSidebar() {
    return Container(
      width: 80,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 20),
          _buildSidebarItem(Icons.school, 'Courses', 0),
          _buildSidebarItem(Icons.description, 'Test Series', 1),
          _buildSidebarItem(Icons.workspace_premium, 'Test Pass Pro+', 2),
          _buildSidebarItem(Icons.auto_awesome, 'Examys AI', 3),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(IconData icon, String label, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: _selectedIndex == index
                  ? const Color(0xFF4C4CED)
                  : Colors.grey,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: _selectedIndex == index
                    ? const Color(0xFF4C4CED)
                    : Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileBottomNav() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'Courses',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.description),
          label: 'Test Series',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.auto_awesome),
          label: 'Examys AI',
        ),
      ],
      selectedItemColor: const Color(0xFF4C4CED),
    );
  }

  Widget _buildMobileContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Hero section
        Stack(
          clipBehavior: Clip.none,
          children: [
            // Main container
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFD9D9FB),
                    Color(0xFFBED1FC),
                    Color(0xFFF7F2CA),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Exam Unlocked!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Dive Into The Ocean of Courses and Test Series',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Space for the images that will overlay
                  const SizedBox(height: 100),
                ],
              ),
            ),
            Positioned(
              right: 60,
              top: 130,
              child: Image.asset(
                'asset/mac.webp',
                height: 180,
              ),
            ),
            // Positioned images for mobile
            Positioned(
                right: 20,
                top: 160,
                child: Image.asset(
                  'asset/android.webp',
                  height: 140,
                )),
          ],
        ),
        const SizedBox(height: 50),
        // Download App section
        Container(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
          child: Column(
            children: [
              const Text(
                'Download App',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),

              // Google Play button
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'asset/images-removebg-preview.png',
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'GET IT ON',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Google Play',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Course Advantages section
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Text(
                'Examys Course\n Advantages',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                'Access online courses for Govt. Exams systematically with Video classes, pdfs and quizzes',
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // Feature cards as a carousel
              SizedBox(
                height: 280, // Fixed height for carousel
                child: _buildFeatureCarousel(),
              ),
            ],
          ),
        ),

        // Courses you may like section
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Some Courses You May Like',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: _buildCategoryButton(
                          _categories[index], index == _selectedCategory),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Course listings
                              ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _courses.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: _buildCourseCard(_courses[index]),
                      );
                    },
                  ),

            ],
          ),
        ),
              ExamysAppPromo(),
                  SizedBox(height: 20,),
        ResponsiveFooterMenu(),
    
  

   
      ],
    );
  }
    Widget _buildCourseCard(Map<String, dynamic> course) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            course['title'],
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            course['subtitle'],
            style: TextStyle(
              fontSize: 18,
              color: Colors.orange[400],
            ),
          ),
          const SizedBox(height: 16),
          ...course['features'].map<Widget>((feature) {
            String featureText = feature;
            Color? featureHighlightColor;
            
            if (feature.contains('Examys AI')) {
              final parts = feature.split('Examys AI');
              featureText = parts[0];
              featureHighlightColor = Colors.orange[400];
            } else if (feature.contains('Doubt Clear')) {
              final parts = feature.split('Doubt Clear');
              featureText = parts[0];
              featureHighlightColor = Colors.green[400];
            }
            
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• ', style: TextStyle(fontSize: 16)),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: featureText,
                            style: const TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          if (feature.contains('Examys AI'))
                            TextSpan(
                              text: 'Examys AI',
                              style: TextStyle(fontSize: 16, color: featureHighlightColor),
                            ),
                          if (feature.contains('Doubt Clear'))
                            TextSpan(
                              text: 'Doubt Clear',
                              style: TextStyle(fontSize: 16, color: featureHighlightColor),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course['originalPrice'],
                    style: const TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    course['price'],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[600],
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Handle view details
                  },
                  child: Row(
                    children: const [
                      Text(
                        'View Details',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

// New carousel implementation for feature cards
  Widget _buildFeatureCarousel() {
    // Feature card data
    final List<Map<String, String>> features = [
      {
        'title': 'Complete Syllabus with Clear Course Design',
        'description':
            'Each course has 4 sections:\n\nI. Foundation + In-depth: Live class, videos, pdfs followed by quizzes.\nII. Previous year questions discussion.\nIII. Question-pattern trend analysis by Examys AI.\nIV. Test Series.',
        'imagePath': 'asset/1st.webp'
      },
      {
        'title': 'Systematic but Flexible Learning Path',
        'description':
            'You can start with any section without order as live classes, videos, pdfs and tests are not only designed in a systematic way but also provide flexibility.',
        'imagePath': 'asset/2.png'
      },
      {
        'title': 'Introducing Sefi, The Examys AI for Question trend',
        'description':
            'Make your preparation strong with Examys AI by analyzing question-pattern trend for maximum score.',
        'imagePath': 'asset/3rd.webp'
      },
      {
        'title': 'Comprehensive Test Series',
        'description':
            'Give test to maximize your score and get succeed with an all-round approach.',
        'imagePath': 'asset/home-4.png'
      },
    ];

    return PageView.builder(
      itemCount: features.length,
      controller: PageController(viewportFraction: 0.9),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: _buildFeatureCard(
            features[index]['title']!,
            features[index]['description']!,
            features[index]['imagePath']!,
          ),
        );
      },
    );
  }

// Updated feature card for carousel
  Widget _buildFeatureCard(String title, String description, String imagePath) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.15),
          spreadRadius: 2,
          blurRadius: 10,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gradient Background for Icon
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              height: 90,
              width: 90,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 12),

            // Title with better text style
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333), // Darker for contrast
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),

        // Description with better readability
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF666666), // Slightly darker for better visibility
                height: 1.5, // Line height for better spacing
              ),
            ),
          ),
        ),
      ],
    ),
  );
}


  Widget _buildDesktopContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      // Hero section for desktop
      Padding(
        padding: const EdgeInsets.all(30.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Main container
            Container(
              padding: const EdgeInsets.all(70),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFD7C9F6), // Light Purple (Top-Left)
                    Color(0xFFBFDDFB), // Soft Blue (Middle)
                    Color(0xFFFCEEC2), // Pale Yellow (Bottom-Right)
                  ],
                  stops: [0.0, 0.5, 1.0], // Defines smooth transition points
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 110),
                          child: Text(
                            'Exam\nUnlocked!',
                            style: GoogleFonts.poppins(
                                fontSize: 38,
                                fontWeight: FontWeight.w600,
                                height: 1),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 110),
                          child: Text(
                            'Dive Into The Ocean of Courses and Test Series',
                            style: GoogleFonts.poppins(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 110),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 14),
                            width: 220,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Image.network(
                                  'asset/images-removebg-preview.png',
                                  height: 40,
                                ),
                                const SizedBox(width: 4),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 50),
                                      child: Text(
                                        'GET IT ON',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      ' Google Play',
                                      style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 22,
                                          wordSpacing: 1),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Empty space to reserve for the images that will be positioned over the container
                  const SizedBox(width: 450),
                ],
              ),
            ),

            // Positioned images that will appear above the container
            Positioned(
              right: 600,
              top: 50, // Negative value makes it appear above the container
              child: Image.asset(
                'asset/android.webp',
                height: 300,
                fit: BoxFit.contain,
              ),
            ),

            Positioned(
              right: 130,
              top: 50, // Negative value makes it appear above the container
              child: Image.asset(
                'asset/mac.webp',
                height: 310,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),

      // Course Advantages section
      Padding(
        padding: const EdgeInsets.all(88.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFffffff),
                Color(0xFFf8f8ff),
                Color(0xFFf8f8ff),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Examys Course Advantages',
                  style: GoogleFonts.poppins(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100),
                  child: Text(
                    'Access online courses for Govt. Exams systematically with Video classes, pdfs and quizzes',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF6b7280),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 60),

                // Updated: Responsive feature cards in row
                LayoutBuilder(
                  builder: (context, constraints) {
                    // Determine if we should show cards in a row or column based on available width
                    if (constraints.maxWidth >= 1000) {
                      // Desktop view: all 4 cards in one row
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _buildResponsiveFeatureCard(
                                'Complete Syllabus with Clear Course Design',
                                'Each course has 4 sections:\n\nI. Foundation + In-depth: Live class, videos, pdfs\n   followed by quizzes.\nII. Previous year questions discussion.\nIII. Question-pattern trend analysis by Examys AI.\nIV. Test Series.',
                                'asset/1st.webp'),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildResponsiveFeatureCard(
                                'Systematic  but  Flexible  Learning  sPath',
                                'You can start with any section without order as\n live classes, videos, pdfs and tests are not only designed in a systematic way but also provide flexibility.\nI. How is your foundation?\nII. Your competitive Index',
                                'asset/2.png'),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildResponsiveFeatureCard(
                                'Introducing Sefi, The Examys AI for Question trend',
                                'Make your preparation strong with Examys AI by analyzing question-pattern trend for maximum score.\nI. Question-pattern trend \nII. Question level analysis\nIII. Course availability',
                                'asset/3rd.webp'),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildResponsiveFeatureCard(
                                'Comprehensive Test Series',
                                'Give test to maximize your score and get succeed with an all-round approach.\nI. Mock test: Chapter test, section test & full length test\nII. Previous year test\nIII. Practice trend test for pattern analysis\nIV. Access to live test series',
                                'asset/home-4.png'),
                          ),
                        ],
                      );
                    } else if (constraints.maxWidth >= 700) {
                      // Tablet view: 2 rows with 2 cards each
                      return Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: _buildResponsiveFeatureCard(
                                    'Complete Syllabus with Clear Course Design',
                                    'Each course has 4 sections:I. Foundation + In-depth: Live class, videos, pdfs followed by quizzes.\nII. Previous year questions discussion.\nIII. Question-pattern trend analysis by Examys AI.\nIV. Test Series.',
                                    'asset/1st.webp'),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildResponsiveFeatureCard(
                                    'Systematic but Flexible Learning Path',
                                    'You can start with any section without order as live classes, videos, pdfs and tests are not only designed in a systematic way but also provide flexibility.',
                                    'asset/2.png'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: _buildResponsiveFeatureCard(
                                    'Introducing Sefi, The Examys AI for Question trend',
                                    'Make your preparation strong with Examys AI by analyzing question-pattern trend for maximum score.',
                                    'asset/3rd.webp'),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildResponsiveFeatureCard(
                                    'Comprehensive Test Series',
                                    'Give test to maximize your score and get succeed with an all-round approach.',
                                    'asset/home-4.png'),
                              ),
                            ],
                          ),
                        ],
                      );
                    } else {
                      // Mobile view: all cards in a column
                      return Column(
                        children: [
                          _buildResponsiveFeatureCard(
                              'Complete Syllabus with Clear Course Design',
                              'Each course has 4 sections:\nI. Foundation + In-depth: Live class, videos, pdfs    followed by quizzes.\nII. Previous year questions discussion.\nIII. Question-pattern trend analysis by Examys AI.\nIV. Test Series.',
                              'asset/1st.webp'),
                          const SizedBox(height: 16),
                          _buildResponsiveFeatureCard(
                              'Systematic but Flexible Learning Path',
                              'You can start with any section without order as live classes, videos, pdfs and tests are not only designed in a systematic way but also provide flexibility.',
                              'asset/2.png'),
                          const SizedBox(height: 16),
                          _buildResponsiveFeatureCard(
                              'Introducing Sefi, The Examys AI for Question trend',
                              'Make your preparation strong with Examys AI by analyzing question-pattern trend for maximum score.',
                              'asset/3rd.webp'),
                          const SizedBox(height: 16),
                          _buildResponsiveFeatureCard(
                              'Comprehensive Test Series',
                              'Give test to maximize your score and get succeed with an all-round approach.',
                              'asset/home-4.png'),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),

      // Some courses you may like
      Padding(
        padding: const EdgeInsets.all(88.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Some Courses You May Like',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF212121),
              ),
            ),
            const SizedBox(height: 16),

            // Category selection buttons
            Row(
              children: List.generate(
                _categories.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: _buildCategoryButton(
                      _categories[index], index == _selectedCategory),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // First row of course cards
            Row(
              children: [
                Expanded(
                    child: _buildRRBNTPCCard(
                        "RRB NTPC CBT 1", "1 Year", "₹ 3599", "₹ 7199")),
                const SizedBox(width: 16),
                Expanded(
                    child: _buildRRBNTPCCard(
                        "RRB NTPC CBT 1", "6 months", "₹ 3099", "₹ 6199")),
                const SizedBox(width: 16),
                Expanded(
                    child: _buildRRBNTPCCard("RRB NTPC (CBT 1 + CBT 2)",
                        "1 Year", "₹ 4199", "₹ 8399")),
                const SizedBox(width: 16),
                Expanded(
                    child: _buildRRBNTPCCard("RRB NTPC (CBT 1 + CBT 2)",
                        "2 Years", "₹ 5299", "₹ 10599")),
              ],
            ),

            const SizedBox(height: 16),

            // Second row of course cards
            Row(
              children: [
                Expanded(
                    child: _buildRRBJECard(
                        "RRB JE CBT 1", "1 Year", "₹ 4199", "₹ 8399")),
                const SizedBox(width: 16),
                Expanded(
                    child: _buildRRBJECard(
                        "RRB JE CBT 1", "6 months", "₹ 3599", "₹ 7199")),
                const SizedBox(width: 16),
                Expanded(
                    child: _buildRailwayAllInOneCard(
                        "Railway (All in one)", "1 Year", "₹ 6499", "₹ 12999")),
                const Spacer(),
              ],
            ),

            const SizedBox(height: 30),

            // Explore All Courses button
            Center(
              child: Container(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4C4CED),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Explore All Courses',
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
            ),

            //! Courses supported by
            const CoursesSupported(),
            const SizedBox(height: 60),
            const MockTestEdgeSection(),
            const SizedBox(height: 40),
            FeatureCardsSection(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Some Test Series You May Like',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30),
                TestSeriesGrid(),
                const SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5E60CE),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Explore All',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // Top Section - Test Series
                const TestSeriesSection(),
                const SizedBox(height: 60),
                // Bottom Section - Current Affairs
                const CurrentAffairsSection(),
              ],
            ),
            SizedBox(
              height: 50,
            ),

            // !Footer
            const ExamysSection(),
            Container(
              color: Colors.grey[800],
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'OUR PRODUCTS',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 20),
                            _buildFooterLink('Course'),
                            _buildFooterLink('Test series'),
                            _buildFooterLink('Test pass pro+'),
                            _buildFooterLink('Examys AI'),
                            _buildFooterLink('Doubt Clear'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'COMPANY',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 20),
                            _buildFooterLink('About us'),
                            _buildFooterLink('Careers'),
                            _buildFooterLink('Press'),
                            _buildFooterLink('Contact Us'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'LEGAL',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 20),
                            _buildFooterLink('Terms & Conditions'),
                            _buildFooterLink('Policies'),
                            _buildFooterLink('Privacy'),
                            _buildFooterLink('Refund & Cancellation'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'CONTACT',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'support@examys.com',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              '8144420436',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Olangar Solutions Private Limited, HIG-27, Dharma Vihar, Khandagiri, Bhubaneswar, Odisha, India, 751030',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.facebook, color: Colors.white, size: 24),
                      SizedBox(width: 20),
                      Icon(Icons.photo_camera, color: Colors.white, size: 24),
                      SizedBox(width: 20),
                      Icon(Icons.facebook, color: Colors.white, size: 24),
                      SizedBox(width: 20),
                      Icon(Icons.video_library, color: Colors.white, size: 24),
                      SizedBox(width: 20),
                      Icon(Icons.video_library, color: Colors.white, size: 24),
                      SizedBox(width: 20),
                      Icon(Icons.telegram, color: Colors.white, size: 24),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '© 2023 Examys. All rights reserved.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    ]);
  }

  Widget _buildCategoryButton(String title, bool isSelected) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedCategory = _categories.indexOf(title);
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? const Color(0xFF3333c2) : Colors.white,
        foregroundColor: isSelected ? Colors.white : Colors.black,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: isSelected ? const Color(0xFF3333c2) : Colors.blue,
          ),
        ),
      ),
      child: Text(title),
    );
  }

  Widget _buildRRBNTPCCard(
      String title, String duration, String price, String originalPrice) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Focus pack',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.3),
                ),
                const SizedBox(width: 8),
                Text(
                  '| $duration',
                  style: TextStyle(
                      color: Colors.grey.shade900,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildBulletPoint('Foundation + in-depth - video, pdf and quiz'),
            _buildBulletPoint('Previous Year Paper Discussion'),
            _buildBulletPoint('Trend Questions by Examys AI'),
            _buildBulletPoint('Test Series and Doubt Clear'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      originalPrice,
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      price,
                      style: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Text(
                        'View Details',
                        style: TextStyle(
                          color: Color(0xFF4C4CED),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                        color: Color(0xFF4C4CED),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRRBJECard(
      String title, String duration, String price, String originalPrice) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Focus pack',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '| $duration',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildBulletPoint('Foundation + in-depth - video, pdf and quiz'),
            _buildBulletPoint('Previous Year Paper Discussion'),
            _buildBulletPoint('Trend Questions by Examys AI'),
            _buildBulletPoint('Test Series and Doubt Clear'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      originalPrice,
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      price,
                      style: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Text(
                        'View Details',
                        style: TextStyle(
                          color: Color(0xFF4C4CED),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                        color: Color(0xFF4C4CED),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRailwayAllInOneCard(
      String title, String duration, String price, String originalPrice) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Power Pack',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '| $duration',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildBulletPoint('Foundation + in-depth - video, pdf and quiz'),
            _buildBulletPoint('Previous Year Paper Discussion'),
            _buildBulletPoint('Trend Questions by Examys AI'),
            _buildBulletPoint('Test Series and Doubt Clear'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      originalPrice,
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      price,
                      style: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Text(
                        'View Details',
                        style: TextStyle(
                          color: Color(0xFF4C4CED),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                        color: Color(0xFF4C4CED),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    final splitText = text.split('by');
    final hasHighlight = splitText.length > 1;

    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
            child: hasHighlight
                ? RichText(
                    text: TextSpan(
                      style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                      children: [
                        TextSpan(text: splitText[0] + 'by'),
                        TextSpan(
                          text: splitText[1],
                          style: const TextStyle(
                            color: Color(0xFFFF9500),
                          ),
                        ),
                      ],
                    ),
                  )
                : RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                      children: [
                        if (text.contains('Doubt Clear'))
                          TextSpan(
                            text: text.split('Doubt Clear')[0],
                          ),
                        if (text.contains('Doubt Clear'))
                          const TextSpan(
                            text: 'Doubt Clear',
                            style: TextStyle(
                              color: Color(0xFF4CAF50),
                            ),
                          ),
                        if (!text.contains('Doubt Clear')) TextSpan(text: text),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

// New widget for responsive feature cards that match the design in the image
Widget _buildResponsiveFeatureCard(
    String title, String description, String imagePath) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(
        imagePath,
        height: 180,
        width: 180,
        // fit: BoxFit.contain,
      ),
      const SizedBox(height: 20),
      Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 16),
      Text(
        description,
        style: GoogleFonts.poppins(
            fontSize: 15,
            color: Colors.grey,
            height: 1.4,
            fontWeight: FontWeight.w400),
      ),
    ],
  );
}

// Widget _buildFeatureCard(String title, String description, String imagePath) {
//   return Container(
//     padding: const EdgeInsets.all(16),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       // borderRadius: BorderRadius.circular(8),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.grey.withOpacity(0.1),
//           spreadRadius: 1,
//           blurRadius: 6,
//           offset: const Offset(0, 3),
//         ),
//       ],
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 227, 227, 255),

//               ),
//               child: Image.asset(
//               imagePath
//               ),
//             ),
//             const SizedBox(width: 12),
//             Expanded(
//               child: Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 16),
//         Text(
//           description,
//           style: const TextStyle(
//             fontSize: 14,
//             color: Colors.grey,
//           ),
//         ),
//       ],
//     ),
//   );
// }

// Widget _buildDesktopFeatureCard(String title, String description, String imagePath) {
//   return Container(
//     padding: const EdgeInsets.all(24),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(12),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.grey.withOpacity(0.1),
//           spreadRadius: 1,
//           blurRadius: 8,
//           offset: const Offset(0, 3),
//         ),
//       ],
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Container(
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: const Color.fromARGB(255, 120, 120, 250),

//           ),
//           child: Image.asset(imagePath, height: 80), // Use the passed imagePath
//         ),
//         const SizedBox(height: 20),
//         Text(
//           title,
//           style: const TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//           textAlign: TextAlign.center,
//         ),
//         const SizedBox(height: 16),
//         Text(
//           description,
//           style: const TextStyle(
//             fontSize: 14,
//             color: Colors.grey,
//             height: 1.5,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ],
//     ),
//   );
// }

Widget _buildSupportCard(String title, IconData icon) {
  return Container(
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: const Color(0xFF4C4CED),
          size: 40,
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        const Text(
          'Learn More',
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF4C4CED),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

// Widget _buildCategoryButton(String title, bool isSelected) {
//   return InkWell(
//     onTap: () {
//       setState(() {
//         _selectedCategory = _categories.indexOf(title);
//       });
//     },
//     child: Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       decoration: BoxDecoration(
//         color: isSelected ? const Color(0xFF4C4CED) : Colors.grey[200],
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Text(
//         title,
//         style: TextStyle(
//           color: isSelected ? Colors.white : Colors.black,
//           fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//         ),
//       ),
//     ),
//   );
// }

Widget _buildCourseCard(
    String title, String duration, int price, int originalPrice) {
  final discount = ((originalPrice - price) / originalPrice * 100).round();

  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '$discount% Off',
                style: TextStyle(
                  color: Colors.green.shade700,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            const Text(
              'Best Seller',
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Validity: $duration',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Text(
              '₹$price',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C4CED),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '₹$originalPrice',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4C4CED),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: const Text('Buy Now'),
          ),
        ),
      ],
    ),
  );
}

Widget _buildDesktopCourseCard(
    String title, String duration, int price, int originalPrice) {
  final discount = ((originalPrice - price) / originalPrice * 100).round();

  return Container(
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 8,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                '$discount% Off',
                style: TextStyle(
                  color: Colors.green.shade700,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            const Text(
              'Best Seller',
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Validity: $duration',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Text(
              '₹$price',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C4CED),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              '₹$originalPrice',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4C4CED),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text(
              'Buy Now',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildFooterLink(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
      ),
    ),
  );
}
