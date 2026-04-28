import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geography HQ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF7F5EF),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1F6B57),
          brightness: Brightness.light,
        ),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: const Color(0xFF17201C),
          displayColor: const Color(0xFF17201C),
        ),
      ),
      home: const LearningHomePage(),
    );
  }
}

class LearningHomePage extends StatelessWidget {
  const LearningHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            _TopBar(),
            _HeroSection(),
            _PhilosophySection(),
            _IntroSection(),
            _PrmDiagramSection(),
            _PrmStagesSection(),
            _ComparisonSection(),
            _FieldworkSection(),
            _GlossarySection(),
            _FooterSection(),
          ],
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF7F5EF),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: Row(
            children: [
              const Icon(Icons.explore_outlined, color: Color(0xFF1F6B57)),
              const SizedBox(width: 10),
              Text(
                'Geography HQ™',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
              ),
              const Spacer(),
              const _NavItem(icon: Icons.map_outlined, label: 'PRM'),
              const SizedBox(width: 8),
              const _NavItem(
                icon: Icons.terrain_outlined,
                label: 'Exploration',
              ),
              const SizedBox(width: 8),
              const _NavItem(icon: Icons.school_outlined, label: 'Basics'),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _NavItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFD8D0C2)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: const Color(0xFF1F6B57)),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 900;
        return SizedBox(
          height: isNarrow ? 720 : 640,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset('assets/images/field_tour.jpg', fit: BoxFit.cover),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.20),
                      Colors.black.withValues(alpha: 0.68),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    isNarrow ? 20 : 40,
                    40,
                    isNarrow ? 20 : 40,
                    isNarrow ? 48 : 68,
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1120),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const _Eyebrow(text: 'CHAGRES INITIATIVE EDUCATION'),
                        const SizedBox(height: 16),
                        Text(
                          'Geography HQ',
                          style: Theme.of(context).textTheme.displayMedium
                              ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                height: 1.05,
                                fontSize: isNarrow ? 42 : 58,
                              ),
                        ),
                        const SizedBox(height: 22),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 820),
                          child: Text(
                            'The educational apparatus of the Chagres Initiative for understanding geography, participatory research mapping, fieldwork, and place-based discovery.',
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  color: const Color(0xFFEFEFE7),
                                  height: 1.45,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _IntroSection extends StatelessWidget {
  const _IntroSection();

  @override
  Widget build(BuildContext context) {
    return _SectionBand(
      background: const Color(0xFFF7F5EF),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeader(
            eyebrow: 'START HERE',
            title: 'Participatory Research Mapping in plain language',
            body:
                'PRM is a way of making maps with the people who know a place through lived experience. It brings together field walks, interviews, sketch maps, GPS points, aerial images, satellite imagery, and local knowledge so decisions can be grounded in reality.',
          ),
          const SizedBox(height: 34),
          _ResponsiveGrid(
            children: const [
              _LearningTile(
                icon: Icons.groups_2_outlined,
                title: 'Local people are at the center of our method',
                body:
                    'Community members are trained as local geographers. Their knowledge is treated as evidence, not as background color.',
              ),
              _LearningTile(
                icon: Icons.hiking_outlined,
                title: 'Fieldwork comes first',
                body:
                    'Good maps begin on the ground: walking, listening, observing, checking, and returning until the map matches the place.',
              ),
              _LearningTile(
                icon: Icons.layers_outlined,
                title: 'Images become meaning',
                body:
                    'Satellite images can show forest cover. PRM adds names, uses, histories, risks, routes, and priorities.',
              ),
              _LearningTile(
                icon: Icons.psychology_alt_outlined,
                title: 'Mental maps become public tools',
                body:
                    'Cognitive knowledge that once lived mostly in memory can be translated into standardized cartographic maps for meetings, governments, schools, and partners.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PhilosophySection extends StatelessWidget {
  const _PhilosophySection();

  @override
  Widget build(BuildContext context) {
    return _SectionBand(
      background: const Color(0xFFE8EEF0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeader(
            eyebrow: 'PHILOSOPHICAL GROUNDING',
            title: 'Geography as exploration and discovery',
            body:
                'James J. Parsons argued for a geography grounded in curiosity about the planet and the human experience on it. Geography HQ takes that seriously: geography is not just memorizing where things are, but learning how places, people, environments, histories, and responsibilities fit together.',
          ),
          const SizedBox(height: 34),
          _ResponsiveGrid(
            children: const [
              _LearningTile(
                icon: Icons.travel_explore_outlined,
                title: 'Exploration creates questions',
                body:
                    'A geographic investigation starts with wonder: What is here, what has changed, who knows this place, and what patterns are still hidden?',
              ),
              _LearningTile(
                icon: Icons.search_outlined,
                title: 'Discovery depends on evidence',
                body:
                    'Parsons describes a discipline built through field observation, conversation, and digging through records. Archives, maps, field notes, interviews, images, and direct observation all help transform curiosity into grounded knowledge.',
              ),
              _LearningTile(
                icon: Icons.public_outlined,
                title: 'Area study connects science and human meaning',
                body:
                    'The article defends the integrative value of knowing places in depth. Geography HQ uses that same approach to connect environmental evidence, human experience, and practical judgment.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PrmDiagramSection extends StatelessWidget {
  const _PrmDiagramSection();

  @override
  Widget build(BuildContext context) {
    return _SectionBand(
      background: const Color(0xFF122B28),
      textOnDark: true,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isNarrow = constraints.maxWidth < 860;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _SectionHeader(
                eyebrow: 'THE METHOD',
                title: 'How our maps are made',
                body:
                    'PRM blends Indigenous geospatial knowledge with GPS, aerial photography, and satellite imagery. A good map does not replace local knowledge. It translates that knowledge into a form more people can understand, use, and act on.',
                textOnDark: true,
              ),
              const SizedBox(height: 34),
              MouseRegion(
                cursor: SystemMouseCursors.zoomIn,
                child: GestureDetector(
                  onTap: () => showDialog<void>(
                    context: context,
                    builder: (_) => const _ImageDialog(
                      imagePath: 'assets/images/PRM_Explain.png',
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: DecoratedBox(
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.all(isNarrow ? 8 : 18),
                        child: Image.asset(
                          'assets/images/PRM_Explain.png',
                          width: double.infinity,
                          fit: BoxFit.contain,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _PrmStagesSection extends StatelessWidget {
  const _PrmStagesSection();

  static const stages = [
    _PrmStage(
      'Stage One: Co-design',
      'Define mapping goals with community leadership.',
    ),
    _PrmStage(
      'Stage Two: Training',
      'Through instructional exercises, community geographers learn the use of GPS, mapping tools, and data-documentation techniques.',
    ),
    _PrmStage(
      'Stage Three: Field Verification and Mapping',
      'Trained community geographers collect ground-truth points and data through shared site visits, sketch mapping, and questionnaire applications in communities.',
    ),
    _PrmStage(
      'Stage Four: Plot Field Data onto Cartographic Sheets',
      'Field data is plotted onto standard cartographic sheets in community workshops, supporting Indigenous land-use management and zoning discussions.',
    ),
    _PrmStage(
      'Stage Five: GIS and Computer Map Production',
      'Students and professors digitize and standardize outputs so the maps can be used for planning, governance, education, and long-term stewardship.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return _SectionBand(
      background: const Color(0xFF0F1B31),
      textOnDark: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeader(
            eyebrow: 'PRM STAGES',
            title: 'Participatory mapping is a sequence of shared work',
            body:
                'Unlike most research, PRM releases the research function to trained community geographers who co-design and implement the project while interpreting geospatial information alongside university geographers and students.',
            textOnDark: true,
          ),
          const SizedBox(height: 32),
          for (var index = 0; index < stages.length; index++)
            _StageRow(
              stage: stages[index],
              number: index + 1,
              isLast: index == stages.length - 1,
            ),
        ],
      ),
    );
  }
}

class _PrmStage {
  final String title;
  final String body;

  const _PrmStage(this.title, this.body);
}

class _StageRow extends StatelessWidget {
  final _PrmStage stage;
  final int number;
  final bool isLast;

  const _StageRow({
    required this.stage,
    required this.number,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 52,
            child: Column(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFC766),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '$number',
                    style: const TextStyle(
                      color: Color(0xFF0F1B31),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      color: Colors.white.withValues(alpha: 0.18),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 24),
              child: Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.06),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.12),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stage.title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      stage.body,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: const Color(0xFFDDE8E3),
                        height: 1.55,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ComparisonSection extends StatelessWidget {
  const _ComparisonSection();

  static const beats = [
    _StoryBeat(
      label: '1',
      title: 'Satellite imagery is useful, but it is not the whole map.',
      body:
          'Tools many people use every day let us zoom into a picture of the earth from above. That is powerful. But in remote areas like Chagres, imagery is often unclassified, partly classified, incorrectly labeled, or not labeled at all.',
      satellitePoint: 'Imagery may show forest without explaining it',
      prmPoint: 'Our method explains how places are used and understood',
      icon: Icons.satellite_alt,
      visualType: _StoryVisualType.satelliteTiles,
    ),
    _StoryBeat(
      label: '2',
      title: 'A green patch can hold many stories.',
      body:
          'A green patch may look empty. To families nearby, it may be hunting forest, a medicinal plant area, a sacred place, a seasonal trail, or land that floods after heavy rain.',
      satellitePoint: 'Can miss uses, names, history, and rules',
      prmPoint: 'Adds lived knowledge from community geographers',
      icon: Icons.groups_2,
      visualType: _StoryVisualType.hiddenMeaning,
    ),
    _StoryBeat(
      label: '3',
      title: 'How we map: layer the image with field knowledge.',
      body:
          'Participatory Research Mapping combines field walks, GPS points, sketch maps, interviews, air photos, and satellite imagery. The crucial step happens in the field, where community geographers identify what different parts of the rainforest are, how they are used, and why they matter.',
      satellitePoint: 'One visual layer: surface appearance',
      prmPoint: 'Many meaning layers: use, access, risk, value',
      icon: Icons.layers,
      visualType: _StoryVisualType.mapLayers,
    ),
    _StoryBeat(
      label: '4',
      title: 'That detail matters when decisions have consequences.',
      body:
          'Conservation, watershed protection, zoning, and governance all require more than “forest” versus “not forest.” Chagres National Park spans about 318,765 acres (129,000 hectares), so accurate mapping requires travel throughout an enormous park and enough detail to understand where protection is urgent, where use is traditional, and where conflict could happen.',
      satellitePoint: 'Helps spot change after it appears',
      prmPoint: 'Helps plan before harm or conflict grows',
      icon: Icons.account_tree_outlined,
      visualType: _StoryVisualType.decisionPath,
    ),
    _StoryBeat(
      label: '5',
      title: 'This is why our method is worth funding.',
      body:
          'Your gift supports the careful, iterative fieldwork that fills the gap between raw imagery and real-world decisions. The time and cost come from repeated travel across the park, training local mappers, working with the people who live there to facilitate this process, checking and refining the maps, and giving communities and partners a tool they can act on.',
      satellitePoint: 'Imagery helps us see',
      prmPoint: 'PRM helps people understand, decide, and protect',
      icon: Icons.volunteer_activism,
      visualType: _StoryVisualType.donorTool,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return _SectionBand(
      background: const Color(0xFF16402E),
      textOnDark: true,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 900;
          final isPhone = constraints.maxWidth < 600;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'SEEING IS NOT THE SAME AS UNDERSTANDING',
                style: TextStyle(
                  color: const Color(0xFFFFC766),
                  fontSize: isPhone ? 11 : 13,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Comparing Satellite Imagery and the Maps We Make',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 18),
              Text(
                'It is easy to feel like the whole world has already been mapped because satellite imagery is everywhere. But in remote places like Chagres, imagery may be unclassified, partly classified, or mislabeled. Our method asks what the place means, how it is used, and what people need to decide wisely.',
                style: TextStyle(
                  color: const Color(0xFFE5ECF5),
                  fontSize: isPhone ? 16 : 18,
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: isPhone ? 24 : 42),
              const _StaticStoryComparison(),
              SizedBox(height: isPhone ? 28 : 42),
              for (var index = 0; index < beats.length; index++) ...[
                _StaticStoryBeatCard(beat: beats[index], isMobile: isMobile),
                if (index != beats.length - 1) const SizedBox(height: 16),
              ],
            ],
          );
        },
      ),
    );
  }
}

class _StoryBeat {
  final String label;
  final String title;
  final String body;
  final String satellitePoint;
  final String prmPoint;
  final IconData icon;
  final _StoryVisualType visualType;

  const _StoryBeat({
    required this.label,
    required this.title,
    required this.body,
    required this.satellitePoint,
    required this.prmPoint,
    required this.icon,
    required this.visualType,
  });
}

enum _StoryVisualType {
  satelliteTiles,
  hiddenMeaning,
  mapLayers,
  decisionPath,
  donorTool,
}

class _StaticStoryComparison extends StatelessWidget {
  const _StaticStoryComparison();

  @override
  Widget build(BuildContext context) {
    final isPhone = MediaQuery.of(context).size.width < 600;
    const satellite = _StaticComparisonPanel(
      icon: Icons.satellite_alt,
      title: 'Satellite imagery',
      color: Color(0xFF77A7D9),
      points: [
        'This is a valuable starting point, not a complete map of land meaning or land use.',
        'It shows forest canopy, water, roads, roofs, and clearings.',
        'It cannot tell who uses a place, what it is called, or why it matters.',
      ],
    );
    const prm = _StaticComparisonPanel(
      icon: Icons.edit_location_alt,
      title: 'How we map',
      color: Color(0xFF7FB069),
      points: [
        'Adds field notes, GPS points, names, routes, rules, and local history.',
        'Connects ecological detail with community knowledge.',
        'Creates a tool for conservation, zoning, governance, and negotiation.',
      ],
    );

    if (isPhone) {
      return const Column(children: [satellite, SizedBox(height: 14), prm]);
    }

    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: satellite),
        SizedBox(width: 18),
        Expanded(child: prm),
      ],
    );
  }
}

class _StaticComparisonPanel extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final List<String> points;

  const _StaticComparisonPanel({
    required this.icon,
    required this.title,
    required this.color,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xFF07111F).withValues(alpha: 0.88),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.46), width: 1.4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 30),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          for (final point in points) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 7,
                  height: 7,
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    point,
                    style: const TextStyle(
                      color: Color(0xFFD7E0EA),
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }
}

class _StaticStoryBeatCard extends StatelessWidget {
  final _StoryBeat beat;
  final bool isMobile;

  const _StaticStoryBeatCard({required this.beat, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final visualAid = _StoryVisualAid(
      type: beat.visualType,
      isMobile: isMobile,
    );

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 20 : 26),
      decoration: BoxDecoration(
        color: const Color(0xFF101A2F).withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
      child: isMobile
          ? Column(
              children: [
                _StoryBeatText(beat: beat, isMobile: isMobile),
                const SizedBox(height: 18),
                visualAid,
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 6,
                  child: _StoryBeatText(beat: beat, isMobile: isMobile),
                ),
                const SizedBox(width: 22),
                Expanded(flex: 4, child: visualAid),
              ],
            ),
    );
  }
}

class _StoryBeatText extends StatelessWidget {
  final _StoryBeat beat;
  final bool isMobile;

  const _StoryBeatText({required this.beat, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 44,
          height: 44,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color(0xFFFFC766),
            shape: BoxShape.circle,
          ),
          child: Text(
            beat.label,
            style: const TextStyle(
              color: Color(0xFF07111F),
              fontSize: 17,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(beat.icon, color: const Color(0xFF7FB069), size: 24),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      beat.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isMobile ? 20 : 23,
                        fontWeight: FontWeight.w800,
                        height: 1.22,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                beat.body,
                style: TextStyle(
                  color: const Color(0xFFD7E0EA),
                  fontSize: isMobile ? 15 : 16,
                  height: 1.58,
                ),
              ),
              const SizedBox(height: 14),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _StoryTag(
                    text: beat.satellitePoint,
                    color: const Color(0xFF77A7D9),
                  ),
                  _StoryTag(
                    text: beat.prmPoint,
                    color: const Color(0xFF7FB069),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StoryVisualAid extends StatelessWidget {
  final _StoryVisualType type;
  final bool isMobile;

  const _StoryVisualAid({required this.type, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: isMobile ? 180 : 210),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF07111F).withValues(alpha: 0.78),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
      child: switch (type) {
        _StoryVisualType.satelliteTiles => const _SatelliteTileVisual(),
        _StoryVisualType.hiddenMeaning => const _HiddenMeaningVisual(),
        _StoryVisualType.mapLayers => const _MapLayerVisual(),
        _StoryVisualType.decisionPath => const _DecisionPathVisual(),
        _StoryVisualType.donorTool => const _DonorToolVisual(),
      },
    );
  }
}

class _SatelliteTileVisual extends StatelessWidget {
  const _SatelliteTileVisual();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _VisualTitle(icon: Icons.grid_view, text: 'Pixels show surface'),
        const SizedBox(height: 14),
        SizedBox(
          height: 124,
          child: GridView.count(
            crossAxisCount: 5,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(15, (index) {
              final colors = [
                const Color(0xFF1F5A38),
                const Color(0xFF2E6F3C),
                const Color(0xFF77A7D9),
                const Color(0xFF36513A),
              ];
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: colors[index % colors.length],
                  borderRadius: BorderRadius.circular(5),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

class _HiddenMeaningVisual extends StatelessWidget {
  const _HiddenMeaningVisual();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _VisualTitle(
          icon: Icons.visibility_off,
          text: 'Meaning is hidden from above',
        ),
        SizedBox(height: 16),
        _VisualPill(icon: Icons.forest, text: 'medicinal plants'),
        SizedBox(height: 10),
        _VisualPill(icon: Icons.route, text: 'seasonal trail'),
        SizedBox(height: 10),
        _VisualPill(icon: Icons.water_drop, text: 'flood risk'),
      ],
    );
  }
}

class _MapLayerVisual extends StatelessWidget {
  const _MapLayerVisual();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 188,
      child: Stack(
        children: [
          Positioned(
            left: 14,
            right: 44,
            top: 26,
            child: _LayerSheet(color: Color(0xFF77A7D9), label: 'imagery'),
          ),
          Positioned(
            left: 28,
            right: 28,
            top: 70,
            child: _LayerSheet(color: Color(0xFFFFC766), label: 'field notes'),
          ),
          Positioned(
            left: 42,
            right: 12,
            top: 114,
            child: _LayerSheet(
              color: Color(0xFF7FB069),
              label: 'community knowledge',
            ),
          ),
        ],
      ),
    );
  }
}

class _DecisionPathVisual extends StatelessWidget {
  const _DecisionPathVisual();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _DecisionStep(icon: Icons.image_search, text: 'See change'),
        Icon(Icons.arrow_downward, color: Color(0xFFFFC766)),
        _DecisionStep(icon: Icons.map, text: 'Understand context'),
        Icon(Icons.arrow_downward, color: Color(0xFFFFC766)),
        _DecisionStep(icon: Icons.task_alt, text: 'Plan before harm grows'),
      ],
    );
  }
}

class _DonorToolVisual extends StatelessWidget {
  const _DonorToolVisual();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _VisualTitle(
          icon: Icons.volunteer_activism,
          text:
              'Donation enables all of these steps which facilitate this process',
        ),
        SizedBox(height: 16),
        _VisualPill(icon: Icons.gps_fixed, text: 'GPS + fieldwork'),
        SizedBox(height: 10),
        _VisualPill(icon: Icons.school, text: 'trained community geographers'),
        SizedBox(height: 10),
        _VisualPill(icon: Icons.handshake, text: 'governance-ready maps'),
      ],
    );
  }
}

class _VisualTitle extends StatelessWidget {
  final IconData icon;
  final String text;

  const _VisualTitle({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFFFFC766), size: 22),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}

class _VisualPill extends StatelessWidget {
  final IconData icon;
  final String text;

  const _VisualPill({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF16402E).withValues(alpha: 0.82),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF7FB069).withValues(alpha: 0.36),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF7FB069), size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFFD7E0EA),
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LayerSheet extends StatelessWidget {
  final Color color;
  final String label;

  const _LayerSheet({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.84),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withValues(alpha: 0.38)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF07111F),
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class _DecisionStep extends StatelessWidget {
  final IconData icon;
  final String text;

  const _DecisionStep({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF7FB069), size: 22),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}

class _StoryTag extends StatelessWidget {
  final String text;
  final Color color;

  const _StoryTag({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.46)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 13,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _FieldworkSection extends StatelessWidget {
  const _FieldworkSection();

  @override
  Widget build(BuildContext context) {
    return _SectionBand(
      background: Colors.white,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isNarrow = constraints.maxWidth < 900;
          final text = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _SectionHeader(
                eyebrow: 'EXPLORATION',
                title: 'Exploration is not a side note. It is the work.',
                body:
                    'Geography HQ should make geography feel active and possible. PRM asks those interested in geography to treat the world as something they can investigate carefully, humbly, and with other people.',
              ),
              SizedBox(height: 26),
              _ProcessStep(
                number: '1',
                title: 'Ask geographic questions',
                body:
                    'What is here? Who uses it? What changes by season? What should be protected? What is at risk?',
              ),
              _ProcessStep(
                number: '2',
                title: 'Collect evidence in the field',
                body:
                    'Walk, listen, sketch, photograph, record GPS points, compare stories, and revisit uncertain places.',
              ),
              _ProcessStep(
                number: '3',
                title: 'Turn knowledge into shared tools',
                body:
                    'Build maps and explanations that help communities, researchers, and institutions make better decisions together.',
              ),
            ],
          );

          final image = ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/rushing.JPG',
              fit: BoxFit.cover,
              height: isNarrow ? 320 : 560,
              width: double.infinity,
            ),
          );

          if (isNarrow) {
            return Column(children: [text, const SizedBox(height: 28), image]);
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: text),
              const SizedBox(width: 44),
              Expanded(child: image),
            ],
          );
        },
      ),
    );
  }
}

class _GlossarySection extends StatelessWidget {
  const _GlossarySection();

  @override
  Widget build(BuildContext context) {
    return _SectionBand(
      background: const Color(0xFFF1E8D8),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isNarrow = constraints.maxWidth < 900;
          final glossary = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _SectionHeader(
                eyebrow: 'BEGINNER GLOSSARY',
                title: 'A few words to introduce you to geography',
                body:
                    'This section can grow into a full Geography HQ glossary as the learning site expands. Geography also lives in archives: older maps, field notes, letters, images, and documents help us compare what people knew then with what we can verify now.',
              ),
              const SizedBox(height: 30),
              _ResponsiveGrid(
                children: const [
                  _DefinitionTile(
                    term: 'Geospatial knowledge',
                    definition:
                        'Knowledge about where things are, how places relate, and why location matters.',
                  ),
                  _DefinitionTile(
                    term: 'Ground truth',
                    definition:
                        'Information checked in person, not only interpreted from a screen or dataset.',
                  ),
                  _DefinitionTile(
                    term: 'Zoning',
                    definition:
                        'A planning process that defines how different areas should be used, protected, or managed.',
                  ),
                ],
              ),
            ],
          );

          final archiveImage = ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/archives.JPG',
                  height: isNarrow ? 300 : 560,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 16,
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0xFF17201C).withValues(alpha: 0.82),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Archives help those interested in geography see geography as accumulated evidence, not just a finished map.',
                      style: TextStyle(
                        color: Color(0xFFF7F5EF),
                        height: 1.45,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );

          if (isNarrow) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [glossary, const SizedBox(height: 28), archiveImage],
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 6, child: glossary),
              const SizedBox(width: 40),
              Expanded(flex: 4, child: archiveImage),
            ],
          );
        },
      ),
    );
  }
}

class _FooterSection extends StatelessWidget {
  const _FooterSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF17201C),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: Text(
            'Geography HQ™ is the educational apparatus of the Chagres Initiative, built to promote the understanding of geography, participatory research mapping, fieldwork, and place-based discovery.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: const Color(0xFFEFEFE7),
              height: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionBand extends StatelessWidget {
  final Widget child;
  final Color background;
  final bool textOnDark;

  const _SectionBand({
    required this.child,
    required this.background,
    this.textOnDark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: background,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 78),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: DefaultTextStyle.merge(
            style: TextStyle(
              color: textOnDark
                  ? const Color(0xFFF4F3EA)
                  : const Color(0xFF17201C),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String eyebrow;
  final String title;
  final String body;
  final bool textOnDark;

  const _SectionHeader({
    required this.eyebrow,
    required this.title,
    required this.body,
    this.textOnDark = false,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 860),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Eyebrow(text: eyebrow, dark: textOnDark),
          const SizedBox(height: 14),
          Text(
            title,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w800,
              height: 1.12,
              color: textOnDark ? Colors.white : const Color(0xFF17201C),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            body,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              height: 1.6,
              color: textOnDark
                  ? const Color(0xFFDDE8E3)
                  : const Color(0xFF36413C),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class _Eyebrow extends StatelessWidget {
  final String text;
  final bool dark;

  const _Eyebrow({required this.text, this.dark = true});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: dark ? const Color(0xFFB7D889) : const Color(0xFF1F6B57),
        fontSize: 13,
        fontWeight: FontWeight.w800,
        letterSpacing: 0,
      ),
    );
  }
}

class _ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;

  const _ResponsiveGrid({required this.children});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth < 720
            ? 1
            : constraints.maxWidth < 1040
            ? 2
            : 3;
        const spacing = 14.0;
        final itemWidth =
            (constraints.maxWidth - (spacing * (columns - 1))) / columns;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: children
              .map((child) => SizedBox(width: itemWidth, child: child))
              .toList(),
        );
      },
    );
  }
}

class _LearningTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String body;

  const _LearningTile({
    required this.icon,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 210),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFDAD3C7)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 32, color: const Color(0xFF1F6B57)),
          const SizedBox(height: 18),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            body,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              height: 1.55,
              color: const Color(0xFF405048),
            ),
          ),
        ],
      ),
    );
  }
}

class _DefinitionTile extends StatelessWidget {
  final String term;
  final String definition;

  const _DefinitionTile({required this.term, required this.definition});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 160),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFCF5),
        border: Border.all(color: const Color(0xFFD8C7A8)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            term,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
              color: const Color(0xFF6B4C1F),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            definition,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              height: 1.55,
              color: const Color(0xFF463D31),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProcessStep extends StatelessWidget {
  final String number;
  final String title;
  final String body;

  const _ProcessStep({
    required this.number,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFF1F6B57),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              number,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  body,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    height: 1.5,
                    color: const Color(0xFF405048),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageDialog extends StatelessWidget {
  final String imagePath;

  const _ImageDialog({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: const Color(0xFF0C1110),
      child: Stack(
        children: [
          Center(
            child: InteractiveViewer(
              minScale: 0.7,
              maxScale: 4,
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
          ),
          Positioned(
            right: 18,
            top: 18,
            child: IconButton.filled(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close),
              tooltip: 'Close',
            ),
          ),
        ],
      ),
    );
  }
}
