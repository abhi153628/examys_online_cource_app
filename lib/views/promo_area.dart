import 'package:flutter/material.dart';

class ExamysAppPromo extends StatelessWidget {
  const ExamysAppPromo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Gradient container with phone mockup
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            // Gradient background
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 220,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      const Color(0xFF8C7BFF), // Light purple
                      const Color(0xFFB3A0FF), // Lighter purple
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Experience',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Examys',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),
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
            ),

            // Phone mockup positioned to overlap the container
            Positioned(
              right: 20,
              bottom: -50,
              child: Image.asset(
                'asset/mobile-prototype.jpg',
                width: 100,
              ),
            ),
          ],
        ),

        // Website URL
        const Padding(
          padding: EdgeInsets.only(top: 80, bottom: 16,left: 20),
          child: Text(
            'Examys.com',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
        ),

        // Description text
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            "India's trusted learning terminal for SSC, Railway, Banking, Teaching, Defence & all other government exams including state Govt. and central govt.",
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
        ),

        // Longer paragraph
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            "Developing a learning platform (Examys.com and Examys app) and aiming to deliver an invaluable app experience for aspirants who are preparing competitive exams is a humongous challenge for us. However, our deal to experiment, evolve and scale new heights has always stimulated us to render an unrivalled app experience in an exam preparation environment.",
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
        ),

        // Examys provides section
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            'Examys provides:-',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
        ),

        // Bullet point
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  "Online coaching with Examys Course Terminal supported by Course Journey,",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[500],
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ExamysPromoDemoPage extends StatelessWidget {
  const ExamysPromoDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ExamysAppPromo(),
        ),
      ),
    );
  }
}
