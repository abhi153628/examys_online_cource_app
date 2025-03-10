import 'package:flutter/material.dart';

class CourseListingPage extends StatefulWidget {
  const CourseListingPage({Key? key}) : super(key: key);

  @override
  State<CourseListingPage> createState() => _CourseListingPageState();
}

class _CourseListingPageState extends State<CourseListingPage> {
  int _selectedCategory = 0;
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

  Widget _buildCategoryButton(String category, bool isSelected) {
    return ElevatedButton(
      onPressed: () {
        // Handle category selection
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : Colors.grey[200],
        foregroundColor: isSelected ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
      ),
      child: Text(category),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Courses'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
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
          ],
        ),
      ),
    );
  }
}