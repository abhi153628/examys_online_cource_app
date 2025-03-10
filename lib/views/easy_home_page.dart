import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExamysSection extends StatelessWidget {
  const ExamysSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen width to determine layout
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1000;
    
    return Column(
      children: [
        _buildHeroSection(context, isDesktop: isDesktop),
        _buildContentSection(context, isDesktop: isDesktop),
      ],
    );
  }

  Widget _buildHeroSection(BuildContext context, {required bool isDesktop}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
           gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF818AED), // top left
        Color(0xFFD1C2FB), // top right
        Color(0xFF909BF1), // bottom right
        Color(0xFFBCBCFC), // bottom left
      ],
      stops: [0.0, 0.3, 0.6, 1.0],
    ),
  
          ),
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 64.0 : 24.0,
            vertical: 64.0,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1200),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text(
                          'Experience',
                          style: GoogleFonts.roboto(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                         Text(
                          'Examys',
                          style: GoogleFonts.roboto(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 32),
                        // Google Play Button
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
                  if (isDesktop)
                    Expanded(
                      flex: 1,
                      child: const SizedBox(width: double.infinity),
                    ),
                ],
              ),
            ),
          ),
        ),
        if (isDesktop)
          Positioned(
            right: isDesktop ? 100 : 24,
            top: -50, // Negative value to make the image overlap from the top
            child: Image.asset(
              'asset/mobile-prototype.jpg',
              height: 500, // Increased height to make the overlap more visible
            ),
          ),
      ],
    );
  }

  Widget _buildContentSection(BuildContext context, {required bool isDesktop}) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 64.0 : 24.0,
        vertical: 48.0,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Examys.com',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'India\'s trusted learning terminal for SSC, Railway, Banking, Teaching, Defence & all other government exams including state Govt. and central govt.',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF666666),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Developing a learning platform (Examys.com and Examys app) and aiming to deliver an invaluable app experience for aspirants who are preparing competitive exams is a humongous challenge for us. However, our zeal to experiment, evolve and scale new heights has always stimulated us to render an unrivalled app experience in an exam preparation environment.',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF666666),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Examys provides:-',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 16),
            ..._buildFeaturesList([
              'Online coaching with Examys Course Terminal supported by Course Journey.',
              'Test series with Examys Mock Test Terminal.',
              'Previous year pdf.',
              'Question pattern trend analysis powered by "Examys AI" and',
              'Examys Inspire for upcoming exams.',
            ]),
            const SizedBox(height: 32),
            _buildCourseTerminalSection(context, isDesktop),
            const SizedBox(height: 32),
            _buildTestSeriesSection(context, isDesktop),
            const SizedBox(height: 32),
            _buildAISection(context, isDesktop),
            const SizedBox(height: 32),
            _buildExamDetailsSection(context, isDesktop),
            const SizedBox(height: 32),
            _buildCouponSection(context, isDesktop),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildFeaturesList(List<String> features) {
    return features.map((feature) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '• ',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF666666),
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Text(
                feature,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF666666),
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  Widget _buildCourseTerminalSection(BuildContext context, bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Examys Course Terminal:',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'It offers online coaching for SSC, Railway, Banking, Teaching & all other Govt. exams. Online courses are curated with three packages such as Focus package, Power package and combined package.',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF666666),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Every package of course includes:',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF666666),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 16),
        ..._buildFeaturesList([
          'Foundation + In-depth Course',
          'Previous year question pdf',
          'Question pattern analysis',
          'Test series',
        ]),
        const SizedBox(height: 16),
        const Text(
          'All courses are supported by Course Journey and powered by Examys AI.',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF666666),
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildTestSeriesSection(BuildContext context, bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Examys Test Series Terminal:',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'It offers online test series & mock test for SSC, Railway, Banking, Teaching & all other Govt. exams. All test series contain:',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF666666),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 16),
        ..._buildFeaturesList([
          'Mock test',
          'Previous year test',
          'Trend test',
          'Live test',
        ]),
      ],
    );
  }

  Widget _buildAISection(BuildContext context, bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Examys AI:',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'India\'s 1st AI to get question pattern and question trends for SSC, Railway, Banking, Teaching & all other Govt. exams up to 5 years.',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF666666),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 16),
        ..._buildFeaturesList([
          'Question trend',
          'Course availability and',
          'Test series availability',
        ]),
      ],
    );
  }

  Widget _buildExamDetailsSection(BuildContext context, bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Exam Details:',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Get exam details, Notification, Syllabus, Application date & Exam date for SSC, Railway, Banking, Teaching & all other government exams. Most popular sources and their website links where we collect information as follows:',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF666666),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 16),
        _buildWebsiteLink('https://upsc.gov.in'),
        _buildWebsiteLink('https://ssc.nic.in/Portal/Notices'),
        _buildWebsiteLink('https://indianrailways.gov.in'),
        _buildWebsiteLink('https://ibps.in/web/careers'),
        _buildWebsiteLink('https://www.ibps.in'),
        _buildWebsiteLink('https://kvssangathan.nic.in'),
        _buildWebsiteLink('https://ctet.nic.in'),
      ],
    );
  }

  Widget _buildWebsiteLink(String url) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        url,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  Widget _buildCouponSection(BuildContext context, bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Examys Coupon House:',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'New User offer: Upto ₹1000 off on Courses.',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF666666),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 32),
        const Text(
          'Examys App:',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
      ],
    );
  }
}