// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class ExamPlatform extends StatelessWidget {
  const ExamPlatform({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  //! Top Section - Test Series
                  const TestSeriesSection(),
                  const SizedBox(height: 60),
                  //! Bottom Section - Current Affairs
                  const CurrentAffairsSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TestSeriesSection extends StatelessWidget {
  const TestSeriesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 600),
          child: const Text(
            'Test Series Supported by',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 40),
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 768) {
              //! Desktop Layout
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //! Left Side - Features
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildFeatureItem(
                                icon: Icons.check_box_outlined,
                                iconColor: Colors.indigo,
                                bgColor: Colors.indigo.withOpacity(0.1),
                                title:
                                    'Updated Questions with latest\nexam pattern',
                              ),
                              _buildFeatureItem(
                                icon: Icons.translate,
                                iconColor: Colors.indigo,
                                bgColor: Colors.orange.withOpacity(0.1),
                                title: 'Multilingual Test',
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildFeatureItem(
                                icon: Icons.trending_up,
                                iconColor:
                                    const Color.fromARGB(255, 192, 194, 200),
                                bgColor: Colors.pink.withOpacity(0.1),
                                title: 'Mock, Prev. Year, Trend & Live\nTests',
                              ),
                              _buildFeatureItem(
                                icon: Icons.add_chart,
                                iconColor: Colors.indigo,
                                bgColor: Colors.indigo.withOpacity(0.1),
                                title: 'In-depth analysis and Rank',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  //! Right Side - Illustration
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      'asset/Screenshot_2025-03-10_000834-removebg-preview.png',
                      fit: BoxFit.contain,
                      height: 400,
                    ),
                  ),
                ],
              );
            } else {
              // !Mobile Layout
              return Column(
                children: [
                  //! Features in 2x2 grid
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: _buildFeatureItem(
                          icon: Icons.check_box_outlined,
                          iconColor: Colors.indigo,
                          bgColor: Colors.indigo.withOpacity(0.1),
                          title: 'Updated Questions with latest\nexam pattern',
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: _buildFeatureItem(
                          icon: Icons.translate,
                          iconColor: Colors.indigo,
                          bgColor: Colors.orange.withOpacity(0.1),
                          title: 'Multilingual Test',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: _buildFeatureItem(
                          icon: Icons.trending_up,
                          iconColor: Colors.indigo,
                          bgColor: Colors.pink.withOpacity(0.1),
                          title: 'Mock, Prev. Year, Trend & Live\nTests',
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: _buildFeatureItem(
                          icon: Icons.add_chart,
                          iconColor: Colors.indigo,
                          bgColor: Colors.indigo.withOpacity(0.1),
                          title: 'In-depth analysis and Rank',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              );
            }
          },
        ),
        const SizedBox(height: 40),
        //! Unlock Pro Button
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Unlock Test Pass Pro +',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
    required String title,
  }) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 30,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

//! Current Affairs section
class CurrentAffairsSection extends StatelessWidget {
  const CurrentAffairsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Examys Current Affairs',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 40),
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 768) {
              // Desktop layout
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAffairsCard(
                    title: 'Are current affairs for all exams same?',
                    content:
                        'As we know, current affairs for banking and Insurance Exams are very different from current affairs for UPSC, SSC, railway, teaching, defence, state government jobs and other similar jobs.',
                  ),
                  const SizedBox(width: 20),
                  _buildAffairsCard(
                    title: 'Exam-wise Current Affairs',
                    content:
                        'Do you need exam specific current affairs to achieve your goal?\nBe focus & get exam-wise current affairs with Examys Current Affairs',
                  ),
                  const SizedBox(width: 20),
                  _buildAffairsCard(
                    title: 'Highlights',
                    content: 'Weekly & Monthly pdf\nWeekly & monthly quizzes',
                  ),
                ],
              );
            } else {
              // Mobile layout
              return Column(
                children: [
                  _buildAffairsCard(
                    title: 'Are current affairs for all exams same?',
                    content:
                        'As we know, current affairs for banking and Insurance Exams are very different from current affairs for UPSC, SSC, railway, teaching, defence, state government jobs and other similar jobs.',
                  ),
                  const SizedBox(height: 20),
                  _buildAffairsCard(
                    title: 'Exam-wise Current Affairs',
                    content:
                        'Do you need exam specific current affairs to achieve your goal?\nBe focus & get exam-wise current affairs with Examys Current Affairs',
                  ),
                  const SizedBox(height: 20),
                  _buildAffairsCard(
                    title: 'Highlights',
                    content: 'Weekly & Monthly pdf\nWeekly & monthly quizzes',
                  ),
                ],
              );
            }
          },
        ),
      ],
    );
  }

  Widget _buildAffairsCard({required String title, required String content}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            content,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
