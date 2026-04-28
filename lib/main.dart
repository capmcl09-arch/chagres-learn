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

class _ComparisonSection extends StatefulWidget {
  const _ComparisonSection();

  @override
  State<_ComparisonSection> createState() => _ComparisonSectionState();
}

class _ComparisonSectionState extends State<_ComparisonSection> {
  int selectedIndex = 0;

  static const beats = [
    _ComparisonBeat(
      icon: Icons.map_outlined,
      label: '1',
      title: 'Start with a reference view of the place.',
      body:
          'A reference map or landscape image can orient those interested in geography. It can show rivers, terrain, settlements, forest, and distance. But orientation is only the beginning of geographic understanding.',
      satellitePoint: 'Reference views help us locate and orient',
      prmPoint: 'PRM asks what those places mean and how they are used',
    ),
    _ComparisonBeat(
      icon: Icons.forest_outlined,
      label: '2',
      title: 'A visible landscape still needs interpretation.',
      body:
          'An area may appear simply as forest, riverbank, or open land. Local knowledge can reveal hunting areas, medicinal plants, seasonal routes, sacred places, flood behavior, and land-use histories.',
      satellitePoint: 'Visual evidence shows surface features',
      prmPoint: 'Local interpretation adds names, uses, memory, and rules',
    ),
    _ComparisonBeat(
      icon: Icons.layers_outlined,
      label: '3',
      title: 'Field evidence turns observation into knowledge.',
      body:
          'Participatory Research Mapping combines field walks, GPS points, sketch maps, interviews, air photos, satellite imagery, and archival materials. The crucial step happens through shared field verification.',
      satellitePoint: 'Observation provides clues',
      prmPoint: 'Fieldwork tests, corrects, and deepens those clues',
    ),
    _ComparisonBeat(
      icon: Icons.account_tree_outlined,
      label: '4',
      title: 'Cognitive knowledge becomes cartographic evidence.',
      body:
          'Knowledge that previously lived in memory can be translated into standardized cartographic form. That makes it easier to communicate in workshops, classrooms, public meetings, government offices, and planning processes.',
      satellitePoint: 'Mental knowledge can be hard to share at scale',
      prmPoint: 'Maps make knowledge visible, discussable, and portable',
    ),
    _ComparisonBeat(
      icon: Icons.handshake_outlined,
      label: '5',
      title: 'The result is a shared tool for decision-making.',
      body:
          'The finished map is not just a picture. It is a meeting tool, a teaching tool, a planning tool, and a record of collaborative geographic discovery.',
      satellitePoint: 'A base view helps people see the setting',
      prmPoint: 'A PRM output helps people understand, decide, and act',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final selected = beats[selectedIndex];
    return _SectionBand(
      background: const Color(0xFF16402E),
      textOnDark: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeader(
            eyebrow: 'FROM VIEW TO UNDERSTANDING',
            title: 'How geographic evidence becomes a usable map',
            body:
                'This model is not pretending that one image can explain Chagres. It shows the learning sequence: begin with a reference view, add field and local interpretation, then translate that knowledge into cartographic tools people can discuss and use.',
            textOnDark: true,
          ),
          const SizedBox(height: 34),
          LayoutBuilder(
            builder: (context, constraints) {
              final isNarrow = constraints.maxWidth < 900;
              final controls = _ComparisonControls(
                beats: beats,
                selectedIndex: selectedIndex,
                onSelected: (index) => setState(() => selectedIndex = index),
              );
              final visual = _ComparisonVisual(beat: selected);

              if (isNarrow) {
                return Column(
                  children: [controls, const SizedBox(height: 24), visual],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 380, child: controls),
                  const SizedBox(width: 34),
                  Expanded(child: visual),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ComparisonBeat {
  final IconData icon;
  final String label;
  final String title;
  final String body;
  final String satellitePoint;
  final String prmPoint;

  const _ComparisonBeat({
    required this.icon,
    required this.label,
    required this.title,
    required this.body,
    required this.satellitePoint,
    required this.prmPoint,
  });
}

class _ComparisonControls extends StatelessWidget {
  final List<_ComparisonBeat> beats;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const _ComparisonControls({
    required this.beats,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var index = 0; index < beats.length; index++)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _ComparisonButton(
              beat: beats[index],
              selected: index == selectedIndex,
              onTap: () => onSelected(index),
            ),
          ),
      ],
    );
  }
}

class _ComparisonButton extends StatelessWidget {
  final _ComparisonBeat beat;
  final bool selected;
  final VoidCallback onTap;

  const _ComparisonButton({
    required this.beat,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFFFFC766)
              : Colors.white.withValues(alpha: 0.07),
          border: Border.all(
            color: selected
                ? const Color(0xFFFFD98B)
                : Colors.white.withValues(alpha: 0.14),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: selected
                  ? const Color(0xFF16402E)
                  : Colors.white.withValues(alpha: 0.12),
              child: Text(
                beat.label,
                style: TextStyle(
                  color: selected ? Colors.white : const Color(0xFFFFC766),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                beat.title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: selected ? const Color(0xFF10231F) : Colors.white,
                  fontWeight: FontWeight.w800,
                  height: 1.25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ComparisonVisual extends StatelessWidget {
  final _ComparisonBeat beat;

  const _ComparisonVisual({required this.beat});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 320),
      child: Container(
        key: ValueKey(beat.label),
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: const Color(0xFF07111F).withValues(alpha: 0.76),
          border: Border.all(color: Colors.white.withValues(alpha: 0.14)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ComparisonLandscape(beat: beat),
            const SizedBox(height: 22),
            LayoutBuilder(
              builder: (context, constraints) {
                final isTight = constraints.maxWidth < 560;
                final panels = [
                  _PointPanel(
                    icon: Icons.map_outlined,
                    title: 'Reference view',
                    body: beat.satellitePoint,
                    color: const Color(0xFF9ED0FF),
                  ),
                  _PointPanel(
                    icon: Icons.map_outlined,
                    title: 'PRM map',
                    body: beat.prmPoint,
                    color: const Color(0xFFFFC766),
                  ),
                ];
                if (isTight) {
                  return Column(
                    children: [
                      panels[0],
                      const SizedBox(height: 12),
                      panels[1],
                    ],
                  );
                }
                return Row(
                  children: [
                    Expanded(child: panels[0]),
                    const SizedBox(width: 14),
                    Expanded(child: panels[1]),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            Text(
              beat.body,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: const Color(0xFFE5ECF5),
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ComparisonLandscape extends StatelessWidget {
  final _ComparisonBeat beat;

  const _ComparisonLandscape({required this.beat});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withValues(alpha: 0.16)),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/chagres_broadermap.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    const Color(0xFF173529).withValues(alpha: 0.88),
                    const Color(0xFF173529).withValues(alpha: 0.42),
                    const Color(0xFF5C4021).withValues(alpha: 0.58),
                  ],
                ),
              ),
            ),
          ),
          const Positioned(left: 20, right: 20, top: 150, child: _RiverLine()),
          const Positioned(
            left: 18,
            top: 18,
            child: _MapLabel(text: 'reference view', color: Color(0xFF9ED0FF)),
          ),
          const Positioned(
            right: 18,
            top: 18,
            child: _MapLabel(
              text: 'interpreted layers',
              color: Color(0xFFFFC766),
            ),
          ),
          const Positioned(
            left: 56,
            bottom: 58,
            child: _MapLabel(text: 'water source', color: Color(0xFF9ED0FF)),
          ),
          const Positioned(
            right: 72,
            bottom: 88,
            child: _MapLabel(text: 'seasonal trail', color: Color(0xFFFFC766)),
          ),
          const Positioned(
            right: 34,
            top: 112,
            child: _MapLabel(
              text: 'medicinal forest',
              color: Color(0xFFB7D889),
            ),
          ),
          Positioned(
            left: 24,
            right: 24,
            bottom: 20,
            child: Row(
              children: [
                Icon(beat.icon, color: Colors.white, size: 26),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    beat.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      shadows: [Shadow(color: Colors.black, blurRadius: 8)],
                    ),
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

class _RiverLine extends StatelessWidget {
  const _RiverLine();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      decoration: BoxDecoration(
        color: const Color(0xFF5FB6D6).withValues(alpha: 0.82),
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [BoxShadow(color: Color(0xAA063B52), blurRadius: 18)],
      ),
    );
  }
}

class _MapLabel extends StatelessWidget {
  final String text;
  final Color color;

  const _MapLabel({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF10231F),
          fontSize: 13,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class _PointPanel extends StatelessWidget {
  final IconData icon;
  final String title;
  final String body;
  final Color color;

  const _PointPanel({
    required this.icon,
    required this.title,
    required this.body,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        border: Border.all(color: color.withValues(alpha: 0.45)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color),
          const SizedBox(height: 10),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            body,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: const Color(0xFFDDE8E3),
              height: 1.45,
            ),
          ),
        ],
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
