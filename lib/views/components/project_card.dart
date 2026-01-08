import 'package:flutter/material.dart';
import 'package:my_portfolio/data/data.dart';
import 'package:my_portfolio/utils/app_colors.dart';
import 'package:my_portfolio/utils/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final Project project;
  final bool isReversed;

  const ProjectCard({
    super.key,
    required this.project,
    this.isReversed = false,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  int _currentPage = 0;

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 900;

        // Mockup Gallery Reel
        final galleryReel = SizedBox(
          height: 600,
          width: isMobile
              ? double.infinity
              : 350, // Fixed width for the phone frame area
          child: PageView.builder(
            controller: _pageController,
            physics: const BouncingScrollPhysics(),
            itemCount: widget.project.screenshots.length,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ), // Gap between phones
                child: _buildPhoneFrame(widget.project.screenshots[index]),
              );
            },
          ),
        );

        // Text Content
        final details = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.project.title,
              style: AppTextStyles.header.copyWith(
                fontSize: 32,
                color: AppColors.primary,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              widget.project.description,
              style: AppTextStyles.body.copyWith(
                fontSize: 16,
                height: 1.8,
              ), // Increased line height
            ),
            const SizedBox(height: 40),

            // Features Bullet Points
            ...widget.project.features.map(
              (feature) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.secondary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        feature,
                        style: AppTextStyles.body.copyWith(
                          fontSize: 15,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),


            const SizedBox(height: 50),

            // Download Buttons
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                if (widget.project.androidUrl != null)
                  OutlinedButton.icon(
                    onPressed: () => _launchUrl(widget.project.androidUrl!),
                    icon: const Icon(
                      Icons.android,
                      color: AppColors.primary,
                    ),
                    label: Text(
                      "Download Android",
                      style: AppTextStyles.button.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.primary, width: 2),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 22,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                if (widget.project.iosUrl != null)
                  OutlinedButton.icon(
                    onPressed: () => _launchUrl(widget.project.iosUrl!),
                    icon: const Icon(
                      Icons.apple,
                      color: AppColors.primary,
                    ),
                    label: Text(
                      "Download iOS",
                      style: AppTextStyles.button.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.primary, width: 2),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 22,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
              ],
            ),
          ],
        );

        if (isMobile) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              children: [
                galleryReel,
                const SizedBox(height: 20),
                // Dots Indicator for Mobile
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    widget.project.screenshots.length,
                    (index) => _buildDot(index),
                  ),
                ),
                const SizedBox(height: 32),
                details,
              ],
            ),
          );
        }

        final children = [
          // Gallery Side
          Expanded(
            flex: 4,
            child: Column(
              children: [
                galleryReel,
                const SizedBox(height: 24),
                // Dots Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    widget.project.screenshots.length,
                    (index) => _buildDot(index),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 80),
          // Text Side
          Expanded(flex: 5, child: details),
        ];

        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 60,
          ), // Space between cards handled by Section
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start, // Align top
            children: widget.isReversed ? children.reversed.toList() : children,
          ),
        );
      },
    );
  }

  Widget _buildPhoneFrame(String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.grey.shade800, width: 8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 30,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Stack(
          children: [
            Image.asset(
              imageUrl,
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            ),
            // Glossy reflection or styling can go here
          ],
        ),
      ),
    );
  }

  Widget _buildDot(int index) {
    bool isActive = index == _currentPage;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : Colors.white12,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
