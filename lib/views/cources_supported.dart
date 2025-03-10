import 'package:flutter/material.dart';

class CoursesSupported extends StatelessWidget {
  const CoursesSupported({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Courses Supported by',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 30),
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 900) {
              return Column(
                children: [
                  SupportCard(
                    iconData: Icons.timeline,
                    title: 'Course Journey',
                    subtitle: 'Insights that can make a drastic your result.',
                    description: 'Every course has a \'course journey\' section to accelerate your preparation and, ultimately, help you crack the exam.',
                  ),
                  const SizedBox(height: 16),
                  SupportCard(
                    iconData: Icons.auto_awesome,
                    title: 'Examys AI',
                    subtitle: 'Analyzing trend that boosts your confidence.',
                    description: 'Every course has a \'Trend analysis\' section which is powered by examys ai to know the exam pattern.',
                  ),
                  const SizedBox(height: 16),
                  SupportCard(
                    iconData: Icons.people,
                    title: 'Course Design and Team',
                    subtitle: 'Learning path that connects and team that inspires.',
                    description: 'Every course has a \'course design & team\' section to know about the team & faculties and their inspiring story.',
                  ),
                ],
              );
            } else {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SupportCard(
                      iconData: Icons.timeline,
                      title: 'Course Journey',
                      subtitle: 'Insights that can make a drastic your result.',
                      description: 'Every course has a \'course journey\' section to accelerate your preparation and, ultimately, help you crack the exam.',
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: SupportCard(
                      iconData: Icons.auto_awesome,
                      title: 'Examys AI',
                      subtitle: 'Analyzing trend that boosts your confidence.',
                      description: 'Every course has a \'Trend analysis\' section which is powered by examys ai to know the exam pattern.',
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: SupportCard(
                      iconData: Icons.people,
                      title: 'Course Design and Team',
                      subtitle: 'Learning path that connects and team that inspires.',
                      description: 'Every course has a \'course design & team\' section to know about the team & faculties and their inspiring story.',
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ],
    );
  }
}

class SupportCard extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String subtitle;
  final String description;

  SupportCard({
    Key? key,
    required this.iconData,
    required this.title,
    required this.subtitle,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE0E0E0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFEEF2FF),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Icon(
                  iconData,
                  color: const Color(0xFF4263EB),
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          InkWell(
            onTap: () {},
            child: Text(
              'Click here to know more',
              style: TextStyle(
                fontSize: 14,
                color: const Color(0xFF4263EB),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MockTestEdgeSection extends StatelessWidget {
  const MockTestEdgeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: const Text(
            'Examys Mock Test Edge',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: Text(
            'Practice Test Series for Govt. Exams seamlessly with India\'s Best mock Test Platform',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[700],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: Text(
            'One Pass & Access to Unlimited Exams',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey[800],
            ),
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4C4CED),
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            'Examys Test Pass pro+',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        ),
      ],
    );
  }
}

class FeatureCardsSection extends StatelessWidget {
  FeatureCardsSection({Key? key}) : super(key: key);

  final List<FeatureCard> features = [
    FeatureCard(
      title: 'Personalised Recommendation',
      description: 'It traces strong and weak areas of your Test Journey & recommends for improvement.',
      imagePath: 'asset/1st-removebg-preview.png',
    ),
    FeatureCard(
      title: 'Comprehensive approach',
      description: 'Get mock tests (chapter-wise, sectional & full mock, mini mock, level-up mock, and many more), previous-year tests, trend tests, and live test series to maximize your score with an all-round approach.',
      imagePath: 'asset/ca-removebg-preview.png',
    ),
    FeatureCard(
      title: 'Competitive Index',
      description: 'Gauge your strength after test so that You will have an edge over your competitors.',
      imagePath: 'asset/ci-removebg-preview.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 900) {
          return Column(
            children: features.map((feature) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: FeatureCardWidget(feature: feature),
              );
            }).toList(),
          );
        } else {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: features.map((feature) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: FeatureCardWidget(feature: feature),
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }
}

class FeatureCard {
  final String title;
  final String description;
  final String imagePath;

  FeatureCard({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

class FeatureCardWidget extends StatelessWidget {
  final FeatureCard feature;

  const FeatureCardWidget({
    Key? key,
    required this.feature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 150,
          child: Image.asset(
            feature.imagePath,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          feature.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          feature.description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            height: 1.5,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}