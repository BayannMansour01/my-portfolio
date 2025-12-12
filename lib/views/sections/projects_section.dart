import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portfolio/data/data.dart';
import 'package:my_portfolio/utils/app_colors.dart';
import 'package:my_portfolio/utils/text_styles.dart';
import 'package:my_portfolio/views/components/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      constraints: const BoxConstraints(maxWidth: 1200),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Selected Works",
                style: AppTextStyles.header.copyWith(fontSize: 48, color: AppColors.textPrimary),
              ),
              const SizedBox(width: 16),
              Container(width: 12, height: 12, decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle))
                  .animate(onPlay: (c) => c.repeat()).shimmer(duration: 1200.ms, color: AppColors.secondary),
            ],
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
          
          const SizedBox(height: 40),
          
          ...PortfolioData.projects.asMap().entries.map((entry) {
            final index = entry.key;
            final project = entry.value;
            return ProjectCard(
              project: project,
              isReversed: index % 2 != 0,
            ).animate().fadeIn(delay: (200 * index).ms).slideY(begin: 0.1, end: 0);
          }),
        ],
      ),
    );
  }
}
