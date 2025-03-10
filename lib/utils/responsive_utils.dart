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

  @override
  Widget build(BuildContext context) {
    // Check if we're on a mobile device
    bool isMobile = MediaQuery.of(context).size.width < 800;

    return Scaffold(
      appBar: isMobile ? _buildMobileAppBar() : _buildDesktopAppBar(),
      body: Row(
        children: [
          // Show sidebar only on desktop
          if (!isMobile) _buildSidebar(),
          // Main content area
          Expanded(
            child: SingleChildScrollView(
              child: isMobile ? _buildMobileContent() : _buildDesktopContent(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: isMobile ? _buildMobileBottomNav() : null,
    );
  }

  AppBar _buildMobileAppBar() {
    return AppBar(
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF4C4CED),
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
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
      automaticallyImplyLeading: false,
    );
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
                color: const Color(0xFF4C4CED),
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

            //! Coming Soon badge

            const SizedBox(width: 20),

            // Refer & Earn
            Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
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
          _buildSidebarItem(Icons.person, 'Test Pass Pro+', 2),
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
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFFE6E6FA),
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
              const SizedBox(height: 20),
              Image.network(
                'https://picsum.photos/600/300', // Placeholder image
                width: double.infinity,
                height: 200,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://picsum.photos/30/30', // Placeholder for Google Play icon
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'GET IT ON\nGoogle Play',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
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
              const Text(
                'Examys Course Advantages',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                'Access online courses for Govt. Exams systematically with Video classes, pdfs and quizzes',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // Course features
              _buildFeatureCard(
                'Complete Syllabus with Clear Course Design',
                'Each course has 4 sections:\n\nI. Foundation + In-depth: Live class, videos, pdfs followed by quizzes.\nII. Previous year questions discussion.\nIII. Question-pattern trend analysis by Examys AI.\nIV. Test Series.',
                Icons.menu_book,
              ),
              const SizedBox(height: 20),

              _buildFeatureCard(
                'Systematic but Flexible Learning Path',
                'You can start with any section without order as live classes, videos, pdfs and tests are not only designed in a systematic way but also provide flexibility.',
                Icons.timeline,
              ),
              const SizedBox(height: 20),

              _buildFeatureCard(
                'Introducing Sefi, The Examys AI for Quetion trend',
                'Make your preparation strong with Examys AI by analyzing question-pattern trend for maximum score.',
                Icons.auto_awesome,
              ),
              const SizedBox(height: 20),

              _buildFeatureCard(
                'Comprehensive Test Series',
                'Give test to maximize your score and get succeed with an all-round approach.',
                Icons.quiz,
              ),
            ],
          ),
        ),

        // Some courses you may like
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
              Row(
                children: [
                  // _buildCategoryButton('Railway', true),
                  // const SizedBox(width: 10),
                  // _buildCategoryButton('SSC', false),
                  // const SizedBox(width: 10),
                  // _buildCategoryButton('Teaching', false),
                ],
              ),
              const SizedBox(height: 20),

              // Course listings
              // _buildCourseCard(
              //   'RRB NTPC CBT 1',
              //   '1 Year',
              //   3599,
              //   7199,
              // ),
              const SizedBox(height: 16),

              // _buildCourseCard(
              //   'RRB NTPC CBT 1',
              //   '6 months',
              //   3099,
              //   6199,
              // ),
              const SizedBox(height: 16),

              // _buildCourseCard(
              //   'RRB NTPC (CBT 1 + CBT 2)',
              //   '1 Year',
              //   4199,
              //   8399,
              // ),
            ],
          ),
        ),

        // Bottom CTA
        Container(
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
      ],
    );
  }

  Widget _buildDesktopContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Hero section
  // Hero section for desktop
Padding(
  padding: const EdgeInsets.all(10.0),
  child: Stack(
    clipBehavior: Clip.none, // Important: Allow children to overflow the stack
    children: [
      // Main container
      Container(
        padding: const EdgeInsets.all(70),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
         gradient: LinearGradient(
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
                    padding: const EdgeInsets.only(top: 10, left: 150),
                    child: Text(
                      'Exam\nUnlocked!',
                      style: GoogleFonts.poppins(
                          fontSize: 38,
                          fontWeight: FontWeight.w600,
                          height: 1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 150),
                    child: Text(
                      'Dive Into The Ocean of Courses and Test Series',
                      style: GoogleFonts.poppins(
                          fontSize: 15, fontWeight: FontWeight.w800),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 150),
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
        child: Image.network(
          'asset/android.webp', 
          height: 310, 
          fit: BoxFit.contain,
        ),
      ),
      
      Positioned(
        right: 130,
        top: 50, // Negative value makes it appear above the container
        child: Image.network(
          'asset/mac.webp', 
          height: 310,
          fit: BoxFit.contain,
        ),
      ),
    ],
  ),
),

        //! Course Advantages section
        Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Examys Course Advantages',
                style: TextStyle(
                  fontSize: 32,
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
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 60),

              // Course features in a row
              Row(
                children: [
                  Expanded(
                    child: _buildDesktopFeatureCard(
                      'Complete Syllabus with Clear Course Design',
                      'Each course has 4 sections:\n\nI. Foundation + In-depth: Live class, videos, pdfs followed by quizzes.',
                      Icons.menu_book,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _buildDesktopFeatureCard(
                      'Systematic but Flexible Learning Path',
                      'You can start with any section without order as live classes, videos, pdfs and tests are not only designed in a systematic way.',
                      Icons.timeline,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _buildDesktopFeatureCard(
                      'Introducing Sefi, The Examys AI',
                      'Make your preparation strong with Examys AI by analyzing question-pattern trend for maximum score.',
                      Icons.auto_awesome,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _buildDesktopFeatureCard(
                      'Comprehensive Test Series',
                      'Give test to maximize your score and get succeed with an all-round approach.',
                      Icons.quiz,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Some courses you may like
        Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Some Courses You May Like',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  // _buildCategoryButton('Railway', true),
                  // const SizedBox(width: 16),
                  // _buildCategoryButton('SSC', false),
                  // const SizedBox(width: 16),
                  // _buildCategoryButton('Teaching', false),
                ],
              ),
              const SizedBox(height: 30),

              // Course listings in a row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Expanded(
                  //   child: _buildDesktopCourseCard(
                  //     'RRB NTPC CBT 1',
                  //     '1 Year',
                  //     3599,
                  //     7199,
                  //   ),
                  // ),
                  const SizedBox(width: 20),
                  // Expanded(
                  //   child: _buildDesktopCourseCard(
                  //     'RRB NTPC CBT 1',
                  //     '6 months',
                  //     3099,
                  //     6199,
                  //   ),
                  // ),
                  const SizedBox(width: 20),
                  // Expanded(
                  //   child: _buildDesktopCourseCard(
                  //     'RRB NTPC (CBT 1 + CBT 2)',
                  //     '1 Year',
                  //     4199,
                  //     8399,
                  //   ),
                  // ),
                  const SizedBox(width: 20),
                  // Expanded(
                  //   child: _buildDesktopCourseCard(
                  //     'RRB NTPC (CBT 1 + CBT 2)',
                  //     '2 Years',
                  //     5299,
                  //     10599,
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),

        // Explore all courses button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Center(
            child: SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4C4CED),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Explore All Courses',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),

        // Courses supported by
        Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Courses Supported by',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  // Expanded(
                  //   child: _buildSupportCard(
                  //     'Course Journey',
                  //     Icons.timeline,
                  //   ),
                  // ),
                  const SizedBox(width: 20),
                  // Expanded(
                  //   child: _buildSupportCard(
                  //     'Examys AI',
                  //     Icons.auto_awesome,
                  //   ),
                  // ),
                  const SizedBox(width: 20),
                  // Expanded(
                  //   child: _buildSupportCard(
                  //     'Course Design and Team',
                  //     Icons.people,
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),

        // Footer
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
                        // _buildFooterLink('Course'),
                        // _buildFooterLink('Test series'),
                        // _buildFooterLink('Test pass pro+'),
                        // _buildFooterLink('Examys AI'),
                        // _buildFooterLink('Doubt Clear'),
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
                        // _buildFooterLink('About us'),
                        // _buildFooterLink('Careers'),
                        // _buildFooterLink('Press'),
                        // _buildFooterLink('Contact Us'),
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
                        // _buildFooterLink('Terms & Conditions'),
                        // _buildFooterLink('Policies'),
                        // _buildFooterLink('Privacy'),
                        // _buildFooterLink('Refund & Cancellation'),
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
                children: [
                  Icon(Icons.facebook, color: Colors.white, size: 24),
                  const SizedBox(width: 20),
                  Icon(Icons.photo_camera, color: Colors.white, size: 24),
                  const SizedBox(width: 20),
                  Icon(Icons.facebook, color: Colors.white, size: 24),
                  const SizedBox(width: 20),
                  Icon(Icons.video_library, color: Colors.white, size: 24),
                  const SizedBox(width: 20),
                  Icon(Icons.work, color: Colors.white, size: 24),
                ],
              ),
              const SizedBox(height: 40),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                width: 240,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://picsum.photos/40/40', // Placeholder for Google Play icon
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'GET IT ON\nGoogle Play',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                '© 2025 Copyright: Examys.com',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureCard(String title, String description, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
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
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopFeatureCard(
      String title, String description, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Image.network(
            'https://picsum.photos/100/100', // Placeholder for feature icon
            width: 80,
            height: 80,
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
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Widget _buildCategoryButton(String title, bool isSelected) {
  //   return InkWell(
  //     onTap: () {},
  //     child: Container(
  //       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //       decoration: BoxDecoration(
  //         color: isSelected ? const Color(0xFF4C4CED) : Colors.white,
  //         borderRadius: BorderRadius.circular(24),
  //         border: Border.all(
  //           color: isSelected ? const Color(0xFF4C4CED) : Colors.grey.shade300,
  //         ),
  //       ),
  //       child: Text(
  //         title,
  //         style: TextStyle(
  //           color: isSelected ? Colors.white : Colors.black
}
