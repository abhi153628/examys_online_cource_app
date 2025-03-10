import 'package:flutter/material.dart';

class ResponsiveFooterMenu extends StatelessWidget {
  const ResponsiveFooterMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Check if we're on a small screen
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Container(
      width: double.infinity,
      color: const Color(0xFF333333),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: isSmallScreen
          ? _buildColumnLayout()
          : _buildRowLayout(),
    );
  }

  Widget _buildColumnLayout() {
    return Column(
      children: [
        // OUR PRODUCTS Section
        _buildSectionHeader('OUR PRODUCTS'),
        const SizedBox(height: 20),
        _buildMenuItem('Course'),
        _buildMenuItem('Test series'),
        _buildMenuItem('Test pass pro+'),
        _buildMenuItem('Examys AI'),
        _buildMenuItem('Doubt Clear'),
        
        const SizedBox(height: 40),
        
        // COMPANY Section
        _buildSectionHeader('COMPANY'),
        const SizedBox(height: 20),
        _buildMenuItem('About us'),
        _buildMenuItem('Careers'),
        _buildMenuItem('Press'),
        _buildMenuItem('Contact Us'),
        
        const SizedBox(height: 40),
        
        // LEGAL Section
        _buildSectionHeader('LEGAL'),
        const SizedBox(height: 20),
        _buildMenuItem('Terms & Conditions'),
        _buildMenuItem('Policies'),
        
        // Additional spacing at the bottom
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildRowLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSectionHeader('OUR PRODUCTS'),
              const SizedBox(height: 20),
              _buildMenuItem('Course'),
              _buildMenuItem('Test series'),
              _buildMenuItem('Test pass pro+'),
              _buildMenuItem('Examys AI'),
              _buildMenuItem('Doubt Clear'),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSectionHeader('COMPANY'),
              const SizedBox(height: 20),
              _buildMenuItem('About us'),
              _buildMenuItem('Careers'),
              _buildMenuItem('Press'),
              _buildMenuItem('Contact Us'),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSectionHeader('LEGAL'),
              const SizedBox(height: 20),
              _buildMenuItem('Terms & Conditions'),
              _buildMenuItem('Policies'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildMenuItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          // Handle menu item tap
        },
        child: Text(
          title,
          style: const TextStyle(
            color: Color(0xFFCCCCCC),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}