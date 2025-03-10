import 'package:flutter/material.dart';

class TestSeriesScreen extends StatelessWidget {
  const TestSeriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
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
                        backgroundColor: Color(0xFF4C4CED),
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
            ),
          ),
        ),
      ),
    );
  }
}

class TestSeriesGrid extends StatelessWidget {
  TestSeriesGrid({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> testSeries = [
    {
      'title': 'RRB (All in one pack)',
      'subtitle': 'Updated with all RRB Exams',
      'total': 'Total 400 tests (5 free tests)',
      'languages': 'English, Hindi',
      'users': '1K+ USERS',
      'details': [
        '250 mock tests (160 chapter tests + 30 section tests + 10 full length tests + more)',
        '100 Prev. year tests',
        '50 live tests',
      ],
    },
    {
      'title': 'RRB NTPC CBT 2',
      'subtitle': 'Updated syllabus',
      'total': '162 Total tests (3 free tests)',
      'languages': 'English, Hindi',
      'users': null,
      'details': [
        '125 mock tests (100 chapter tests + 15 section tests + 10 full length tests + more)',
        '27 Prev. year tests',
        '10 live tests',
      ],
    },
    {
      'title': 'RRB Group D',
      'subtitle': 'Updated syllabus',
      'total': '250 Total Tests (5 Free tests)',
      'languages': 'English, Hindi',
      'users': null,
      'details': [
        '224 mock tests (150 chapter tests + 30 section tests + 10 full length tests + more)',
        '16 Prev. year tests',
        '10 live tests',
      ],
    },
    {
      'title': 'RRB NTPC CBT 1',
      'subtitle': 'updated syllabus',
      'total': '300 tests (5 free test)',
      'languages': 'English, Hindi',
      'users': '12K+ USERS',
      'details': [
        '216 mock tests (160 chapter tests + 30 section tests + 10 full length tests + more)',
        '74 Prev. year tests',
        '10 live tests',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate items per row based on available width
        int crossAxisCount = constraints.maxWidth > 1000 
            ? 4 
            : (constraints.maxWidth > 700 ? 2 : 1);
        
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 0.75,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: testSeries.length,
          itemBuilder: (context, index) {
            return TestSeriesCard(
              testSeries: testSeries[index],
            );
          },
        );
      }
    );
  }
}

class TestSeriesCard extends StatelessWidget {
  final Map<String, dynamic> testSeries;

  const TestSeriesCard({
    Key? key,
    required this.testSeries,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  'asset/png-clipart-rail-transport-indian-railways-train-railway-recruitment-control-board-india-text-logo-removebg-preview.png',
                  width: 60,
                  height: 60,
                ),
                if (testSeries['users'] != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.people,
                          size: 16,
                          color: Colors.black54,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          testSeries['users'],
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              testSeries['title'],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              testSeries['subtitle'],
              style: TextStyle(
                fontSize: 14,
                color: Colors.blue.shade600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              testSeries['total'],
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              testSeries['languages'],
              style: TextStyle(
                fontSize: 14,
                color: Colors.red.shade400,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: testSeries['details'].length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 6),
                          child: Icon(
                            Icons.circle,
                            size: 6,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            testSeries['details'][index],
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4C4CED),
                minimumSize: const Size(double.infinity, 44),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'View Details',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}