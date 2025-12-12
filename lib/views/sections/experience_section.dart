import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portfolio/data/data.dart';
import 'package:my_portfolio/utils/app_colors.dart';
import 'package:my_portfolio/utils/text_styles.dart';
import 'package:my_portfolio/views/components/glass_container.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      constraints: const BoxConstraints(maxWidth: 1000),
      child: Column(
        children: [
          Text(
            "Experience & Education",
            style: AppTextStyles.header.copyWith(
              fontSize: 40,
              color: AppColors.textPrimary,
            ),
          ).animate().fadeIn().slideY(begin: 0.2, end: 0),
          const SizedBox(height: 60),

          // Timeline
          Stack(
            children: [
              // Vertical Line
              Positioned(
                left: 30,
                top: 0,
                bottom: 0,
                child: Container(
                  width: 2,
                  color: AppColors.primary.withOpacity(0.3),
                ),
              ),
              Column(
                children: [
                  // Working Backwards usually, or logic order
                  // Work
                  ...PortfolioData.experiences.map(
                    (exp) => _buildTimelineNode(exp, true),
                  ),
                  const SizedBox(height: 40),
                  // Education
                  _buildTimelineNode(PortfolioData.education, false),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineNode(Experience exp, bool isWork) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dot
          Container(
            margin: const EdgeInsets.only(top: 8, left: 24), // Center on line
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: AppColors.background,
              border: Border.all(color: AppColors.primary, width: 3),
              shape: BoxShape.circle,
            ),
          ).animate().scale(delay: 200.ms),

          const SizedBox(width: 32),

          // Card
          Expanded(
            child: GlassContainer(
              padding: const EdgeInsets.all(40), // Increased padding to 40
              borderRadius: 24,
              gradientBorder: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.1),
                  Colors.transparent,
                  AppColors.primary.withOpacity(0.5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Company Name (Prominent)
                      Expanded(
                        child: Text(
                          exp.result,
                          style: AppTextStyles.title.copyWith(
                            fontSize: 22, // Slightly larger
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        exp.duration,
                        style: AppTextStyles.body.copyWith(
                          fontSize: 14,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Role
                  Text(
                    exp.role,
                    style: AppTextStyles.body.copyWith(
                      fontSize: 16,
                      color: AppColors.textSecondary,
                    ),
                  ),

                  if (exp.description.isNotEmpty) ...[
                    const SizedBox(height: 24),
                    Text(
                      exp.description,
                      style: AppTextStyles.body.copyWith(
                        height: 1.5, // 1.5 line height
                        fontSize: 16,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ).animate().fadeIn(duration: 500.ms).slideX(begin: 0.1, end: 0),
          // ),
        ],
      ),
    );
  }
}
