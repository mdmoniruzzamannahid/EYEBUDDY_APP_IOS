class EyeExcerciesFile {
  int id;
  String logo;
  String title;
  int slide, activity;
  String animation, source, link;

  EyeExcerciesFile(
      {this.id,
      this.logo,
      this.title,
      this.slide,
      this.animation,
      this.activity,
      this.source,
      this.link});
}

List<EyeExcerciesFile> eyeExcerciesFiles = <EyeExcerciesFile>[
  EyeExcerciesFile(
    link: 'https://www.webmd.com/eye-health/eye-exercises',
    source:
        'Focus shift exercise helps you change your focus from near objects to far objects. This helps with trouble focusing reading and depth perception to some extent.',
    id: 1,
    logo: 'Focus Shift',
    title: 'Focus Shift',
    slide: 3,
    animation: 'focus_shift',
    activity: 0,
  ),
  EyeExcerciesFile(
      link: 'http://www.speedyeyes.com/learn-eye-movement-exercises/',
      source:
          'This exercise helps with up-down mobility, working the eye muscles and helping with overall eye agility / motility and brain eye-movement response',
      id: 2,
      logo: 'Color Path',
      title: 'Color Stimulation',
      slide: 3,
      animation: 'colorfull_path',
      activity: 0),
  EyeExcerciesFile(
      link:
          'https://www.cell.com/current-biology/fulltext/S0960-9822(14)00005-0?_returnURL=https%3A%2F%2Flinkinghub.elsevier.com%2Fretrieve%2Fpii%2FS0960982214000050%3Fshowall%3Dtrue',
      source:
          'As we get older, the lenses in our eyes become less elastic, and so can’t readily be adjusted to focus on nearby objects. Known as presbyopia, the condition is almost ubiquitous among people in their early fifties and older. In addition to the obvious reading problems, symptoms include tired eyes and headaches.The Gabor Patch Blur exercise helps people compensate for deterioration in their eyes’ ability to focus on nearby objects by training the brain to process the resulting blurred images. As we get older, the lenses in our eyes become less elastic, and so can’t readily be adjusted to focus on nearby objects. Known as presbyopia, the condition is almost ubiquitous among people in their early fifties and older. In addition to the obvious reading problems, symptoms include tired eyes and headaches.The Blurry Gabor exercise helps people compensate for deterioration in their eyes’ ability to focus on nearby objects by training the brain to process the resulting blurred images.',
      id: 3,
      logo: 'Blurry Gabor',
      title: 'Gabor Patch Blur',
      slide: 3,
      animation: 'blurry_gabor',
      activity: 0),
  EyeExcerciesFile(
      link:
          'https://www.cell.com/current-biology/fulltext/S0960-9822(14)00005-0?_returnURL=https%3A%2F%2Flinkinghub.elsevier.com%2Fretrieve%2Fpii%2FS0960982214000050%3Fshowall%3Dtrue',
      source:
          'As we get older, the lenses in our eyes become less elastic, and so can’t readily be adjusted to focus on nearby objects. Known as presbyopia, the condition is almost ubiquitous among people in their early fifties and older. In addition to the obvious reading problems, symptoms include tired eyes and headaches.The Gabor Patch Blink exercise helps people compensate for deterioration in their eyes’ ability to focus on nearby objects by training the brain to process the resulting blurred images.',
      id: 4,
      logo: 'Gabor Blinking',
      title: 'Gabor Patch Blink',
      slide: 3,
      animation: 'gabor_blinking',
      activity: 0),

  EyeExcerciesFile(
      link: '',
      source: '',
      id: 5,
      logo: 'Gabor Patches',
      title: 'Gabor Patches',
      slide: 3,
      animation: '',
      activity: 0), //nai

  EyeExcerciesFile(
      link: 'http://www.speedyeyes.com/learn-eye-movement-exercises/',
      source:
          'This exercise helps with up-down mobility, working the eye muscles and helping with overall eye agility / motility and brain eye-movement response',
      id: 6,
      logo: 'Color Stripes',
      title: 'Color blocks',
      slide: 3,
      animation: 'color_stripes',
      activity: 0),
  EyeExcerciesFile(
      link: 'http://cleareyesight-batesmethod.info/id13.html',
      source:
          'This exercise is a form of sunning eye exercise.both relaxes and re-hydrates our eyes, and it’s incredibly important for eye health and strong vision.',
      id: 7,
      logo: 'Traffic Lights',
      title: 'Hypno Stimulate',
      slide: 2,
      animation: 'traffic_light_flicker',
      activity: 0),
  EyeExcerciesFile(
      link: 'http://cleareyesight-batesmethod.info/id13.html',
      source:
          'This exercise is a form of sunning eye exercise.both relaxes and re-hydrates our eyes, and it’s incredibly important for eye health and strong vision.',
      id: 8,
      logo: 'Yin Yang Flicker',
      title: 'Dark-Light Flicker',
      slide: 1,
      animation: 'yan_ying_flicker',
      activity: 0),
  EyeExcerciesFile(
      link: 'https://www.webmd.com/eye-health/eye-exercises',
      source:
          'Dark-Light Focus is a variation of focus change exercise.  This exercise helps you This helps with trouble focusing reading and depth perception to some extent.',
      id: 9,
      logo: 'Yin Yang Focus',
      title: 'Dark-Light Focus',
      slide: 2,
      animation: 'yin_yang_focus',
      activity: 0),
  EyeExcerciesFile(
      link: 'http://www.speedyeyes.com/learn-eye-movement-exercises/',
      source:
          'This exercise helps with overall eye agility / motility and brain eye-movement response.',
      id: 10,
      logo: 'Roller Coaster',
      title: 'Roller Coaster',
      slide: 4,
      animation: 'roller_coaster',
      activity: 0), //nai
  EyeExcerciesFile(
      link: '',
      source: '',
      id: 11,
      logo: 'Flashing Shapes',
      title: 'Shape Illusion',
      slide: 2,
      animation: 'flashing_shapes',
      activity: 0),
  EyeExcerciesFile(
      link: 'http://www.speedyeyes.com/learn-eye-movement-exercises/',
      source:
          'This exercise helps with overall eye agility / motility and brain eye-movement response.',
      id: 12,
      logo: 'Wave Move',
      title: 'Curve Move',
      slide: 4,
      animation: 'wave_move',
      activity: 1),
  EyeExcerciesFile(
      link: 'http://cleareyesight-batesmethod.info/id13.html',
      source:
          'This exercise is a form of sunning eye exercise.   both relaxes and re-hydrates our eyes, and it’s incredibly important for eye health and strong vision.',
      id: 13,
      logo: 'Light Flare',
      title: 'Spiral Illusion',
      slide: 2,
      animation: 'light_flare',
      activity: 0),
  EyeExcerciesFile(
      link: 'http://www.speedyeyes.com/learn-eye-movement-exercises/',
      source:
          'This exercise helps with overall eye agility / motility and brain eye-movement response.',
      id: 14,
      logo: 'Cross Move',
      title: 'Open Eye Move',
      slide: 3,
      animation: 'cross_move',
      activity: 2),
  EyeExcerciesFile(
      link: 'http://www.speedyeyes.com/learn-eye-movement-exercises/',
      source:
          'This exercise helps with overall eye agility / motility and brain eye-movement response.',
      id: 15,
      logo: 'Jumping Move',
      title: 'Vertical Move',
      slide: 4,
      animation: 'jumping_move',
      activity: 1),
  EyeExcerciesFile(
      link: 'http://www.speedyeyes.com/learn-eye-movement-exercises/',
      source:
          'This exercise helps with overall eye agility / motility and brain eye-movement response.',
      id: 16,
      logo: 'Bouncing Ball',
      title: 'Bouncing Ball',
      slide: 4,
      animation: 'bouncing_ball',
      activity: 0),
  EyeExcerciesFile(
      link: 'Ghttps://www.webmd.com/eye-health/eye-exercises',
      source:
          'The Growing Pattern exercise helps with widening peripheral focus and recognition on the page. This helps with maintaining context as you perceive phrases, multiple words, and multiple lines, which can increase general comprehension. The goal of this exercise is to focus on the center of the pattern, while using peripheral vision to maintain site of the expanding pattern.',
      id: 17,
      logo: 'Growing Pattern',
      title: 'Expansion Focus',
      slide: 2,
      animation: 'growing_pattern',
      activity: 0),
  EyeExcerciesFile(
      link: 'http://cleareyesight-batesmethod.info/id13.html',
      source:
          'This exercise is a form of sunning eye exercise. both relaxes and re-hydrates our eyes, and it’s incredibly important for eye health and strong vision.',
      id: 18,
      logo: 'Chessboard Flicker',
      title: 'Chessboard Flicker',
      slide: 2,
      animation: 'chessboard_flicker',
      activity: 0),
  EyeExcerciesFile(
      link: 'http://www.speedyeyes.com/learn-eye-movement-exercises/',
      source:
          'Diagonal move is a variation of Directional eye exercises.  Diagonal exercises work on the diagonal motility associated with moving between lines and pages. This exercise help to improve focusing skills, develop better eye movements, and stimulate the vision center in the brain',
      id: 19,
      logo: 'Diagonal Move',
      title: 'Diagonal Move',
      slide: 4,
      animation: 'diagonal_move',
      activity: 1),
  EyeExcerciesFile(
      link: 'http://www.speedyeyes.com/learn-eye-movement-exercises/',
      source:
          'This exercise helps with overall eye agility / motility and brain eye-movement response.',
      id: 20,
      logo: 'Ellipsis Move',
      title: 'Orbit Move',
      slide: 4,
      animation: 'ellipsis_move',
      activity: 1),
  EyeExcerciesFile(
      link: 'http://www.speedyeyes.com/learn-eye-movement-exercises/',
      source:
          'This exercise helps with overall eye agility / motility and brain eye-movement response.',
      id: 21,
      logo: 'Flower Move',
      title: 'Flower Move',
      slide: 4,
      animation: 'flower_move',
      activity: 1),
  EyeExcerciesFile(
      link: 'http://www.speedyeyes.com/learn-eye-movement-exercises/',
      source:
          'This exercise helps with overall eye agility / motility and brain eye-movement response.',
      id: 22,
      logo: 'Spiral Move',
      title: 'Tornado Move',
      slide: 4,
      animation: 'spiral_move',
      activity: 1),
  EyeExcerciesFile(
      link: 'http://www.speedyeyes.com/learn-eye-movement-exercises/',
      source:
          'This exercise helps with overall eye agility / motility and brain eye-movement response.',
      id: 23,
      logo: 'Spring Move',
      title: 'Spring Move',
      slide: 4,
      animation: 'spring_move',
      activity: 1),
  EyeExcerciesFile(
      link: 'http://www.speedyeyes.com/learn-eye-movement-exercises/',
      source:
          'This exercise helps with overall eye agility / motility and brain eye-movement response.',
      id: 24,
      logo: 'Trajectory Move',
      title: 'Flight Move',
      slide: 4,
      animation: 'trajectory_move',
      activity: 1),
  EyeExcerciesFile(
      link: 'http://www.speedyeyes.com/learn-eye-movement-exercises/',
      source:
          'This exercise helps with overall eye agility / motility and brain eye-movement response.',
      id: 25,
      logo: 'Butterfly Move',
      title: 'Butterfly Move',
      slide: 4,
      animation: 'butterfly_move',
      activity: 1),
  EyeExcerciesFile(
      link: 'http://www.speedyeyes.com/learn-eye-movement-exercises/',
      source:
          'This exercise is designed to increase your eyes’ flexibility and is particularly helpful for people who suffer from myopia or astigmatism. As you might expect, it involves moving your eyes in a pattern that ‘traces’ an infinity symbol, which is a figure eight laying on its side. ',
      id: 26,
      logo: 'Infinity Move',
      title: '8-move',
      slide: 4,
      animation: 'infinity_move',
      activity: 1),
  EyeExcerciesFile(
      link: 'http://www.speedyeyes.com/learn-eye-movement-exercises/',
      source:
          'Circle Move is a great exercise for your eyes as it thoroughly stretches them – something which can help counteract presbyopia, which is a condition where the eyes become less flexible with age and vision is compromised.When you roll your eyes, do it clockwise very slowly. Then repeat going the same way but holding your gaze for a few seconds in each of the north, east, south and west position. Then repeat both steps going counterclockwise.',
      id: 27,
      logo: 'Circle Move',
      title: 'Circle Move',
      slide: 3,
      animation: 'coming_soon',
      activity: 1),
  EyeExcerciesFile(
      link: 'http://www.speedyeyes.com/learn-eye-movement-exercises/',
      source:
          'This exercise helps with up-down mobility and left-right motion of eye, working the eye muscles and helping with overall eye agility / motility and brain eye-movement response',
      id: 28,
      logo: 'Ractangular Move',
      title: 'Square Move',
      slide: 4,
      animation: 'ractangular_move',
      activity: 1),
  EyeExcerciesFile(
      link: 'https://www.webmd.com/eye-health/eye-exercises',
      source:
          'Pattern focus is a variation of focus change eye exercise. This exercise trains your eye to recognize and focus on fast pattern changes. This helps with trouble focusing reading and depth perception to some extent.',
      id: 29,
      logo: 'Pattern Focus',
      title: 'Focus Pattern',
      slide: 2,
      animation: 'pattern_focus',
      activity: 0),
  EyeExcerciesFile(
      link: 'http://cleareyesight-batesmethod.info/id13.html',
      source:
          'This exercise is a form of sunning eye exercise.both relaxes and re-hydrates our eyes, and it’s incredibly important for eye health and strong vision.',
      id: 30,
      logo: 'Light Flicker',
      title: 'Light Flicker',
      slide: 2,
      animation: 'light_flicker',
      activity: 0), //nai
  EyeExcerciesFile(
      link: 'http://www.speedyeyes.com/learn-eye-movement-exercises/',
      source:
          'This exercise helps with overall eye agility / motility and brain eye-movement response.',
      id: 31,
      logo: 'Random Move',
      title: 'Random Move',
      slide: 3,
      animation: 'random_move',
      activity: 1),
  EyeExcerciesFile(
      link: 'http://www.speedyeyes.com/learn-eye-movement-exercises/',
      source:
          'This exercise helps with left-right motion of eye, working the eye muscles and helping with overall eye agility / motility and brain eye-movement response',
      id: 32,
      logo: 'Left Right Move',
      title: 'Left Right Move',
      slide: 4,
      animation: 'left_right_move',
      activity: 1),
  EyeExcerciesFile(
      link:
          'https://youreyesite.com/blinking-exercises-you-can-try-for-greater-eye-comfort/',
      source:
          'Blinking exercises can help keep the right amount of moisture in your eyes surface. Blinking coats the eye with three beneficial layers of tears. The first creates an even coat of protein-rich moisture for the second layer. The second layer helps wash away foreign debris and nourishes the eyes. The third prevents evaporation and provides lubrication for your eyelids and eyes.     For people with keratoconus, this blinking exercise might help',
      id: 33,
      logo: 'Blinking',
      title: 'Eye Blinking',
      slide: 2,
      animation: 'eye_blinking',
      activity: 5), //nai
  EyeExcerciesFile(
      link: 'https://www.webmd.com/eye-health/eye-exercises',
      source:
          'Circle focus is a variation of the focus change eye exercise. This exercise helps you change your focus from near objects to far objects. This helps with trouble focusing reading and depth perception to some extent.',
      id: 34,
      logo: 'Circle Focus',
      title: 'Focus C',
      slide: 3,
      animation: 'circle_focus',
      activity: 0),
  EyeExcerciesFile(
      link:
          'https://brightside.me/inspiration-health/11-simple-eye-exercises-to-restore-clear-vision-716310/',
      source:
          'This exercise strengthens the eyelid muscles, improves blood circulation, and helps to relax the muscles of the eyes.',
      id: 35,
      logo: 'Closing Tight',
      title: 'Tight Shut',
      slide: 2,
      animation: 'closing_tight_eyes',
      activity: 3),
  EyeExcerciesFile(
      link:
          'https://brightside.me/inspiration-health/11-simple-eye-exercises-to-restore-clear-vision-716310/',
      source:
          'This exercise strengthens the eyelid muscles, improves blood circulation, and helps to relax the muscles of the eyes.',
      id: 36,
      logo: 'closed_eye_moved',
      title: 'Closed-Eye Move',
      slide: 3,
      animation: 'closed_eye_move',
      // animation: 'closed_eye_move',
      activity: 2),
  EyeExcerciesFile(
      link:
          'https://www.lenspure.com/articles/eye-exercises-alleviate-eye-strain',
      source:
          'Palming is one of the best eye exercises you can do to relieve tired, worn eyes. It\'s like a warm eye compress on the go!.Palming is one of the best eye exercises you can do to relieve tired, worn eyes. It\'s like a warm eye compress on the go!Rub both palms together until they are nice and warm. Or you can wash them in very warm water to heat them up.Then place both palms over your closed eyelids. The warmth of your hands will gently heat your eyes. You will feel the muscles of your eyes begin to relax. Keep your palms there until all the heat has been absorbed by your eyes.Repeat once (or twice) for best results.',
      id: 37,
      logo: 'clap',
      title: 'Palming',
      slide: 6,
      // animation: 'eye_blinking',
      animation: 'palming',
      activity: 4),
  EyeExcerciesFile(
      link: 'http://www.speedyeyes.com/learn-eye-movement-exercises/',
      source:
          'This exercise helps with left-right motion of eye, working the eye muscles and helping with overall eye agility / motility and brain eye-movement response',
      id: 38,
      logo: 'Two Objects',
      title: 'Elastic Move',
      slide: 3,
      animation: 'two_objects',
      activity: 0),
  EyeExcerciesFile(
      link: 'https://catalystmagazine.net/tibetan-eye-chart/',
      source:
          'Using the Tibetan eye chart this exercise stimulates the muscles and nerves of the optical system. It feels great.',
      id: 39,
      logo: 'Tibetan Eye Chart',
      title: 'Tibetan Eye Chart',
      slide: 2,
      animation: 'tibetian_eye_chart',
      activity: 0),
  EyeExcerciesFile(
      link: 'https://www.healthline.com/health/kaleidoscope-vision',
      source:
          'The Kaleidoscope exercise helps with widening peripheral focus and recognition on the page. This helps with maintaining context as you perceive phrases, multiple words, and multiple lines, which can increase general comprehension. The goal of this exercise is to focus on the center of the pattern, while using peripheral vision to maintain site of the expanding pattern.',
      id: 40,
      logo: 'Kaleidoscope',
      title: 'Kaleidoscope',
      slide: 2,
      animation: 'kaleidoscope',
      activity: 0),
  EyeExcerciesFile(
      id: 41,
      logo: 'Split Images',
      title: 'Split Images',
      slide: 2,
      animation: 'Split Images'),
  EyeExcerciesFile(
      id: 42,
      logo: 'Convergence',
      title: 'Converging Eyes',
      slide: 2,
      animation: 'convergence'),
  EyeExcerciesFile(
      link:
          'https://www.janetgoodrichmethod.com/2007/04/11/breathing-and-eyesight-part-1/',
      source:
          'This exercise helps to reduce Upper Body Tension by allowing the ribs to move, all the way in and out.The rib cage is an articulated unit that extends from waist to neck, front and back, and its state can have an impact on the condition of your spine, neck, and shoulders.  Practicing full relaxed breathing then, will also have a loosening effect on the entire upper body.',
      id: 43,
      logo: '3_part_breathing',
      title: 'Three Part Breath',
      slide: 1,
      animation: '3_part_breathing'),
  EyeExcerciesFile(
      link: 'https://healthy-ojas.com/eye/eye-massage.html',
      source:
          'This exercise helps to massage pressure points for the eyes and help relieve tension and headaches, and provide a sense of relaxation. Also focusing on these points may also help alleviate eye twitching or weakness.',
      id: 44,
      logo: 'finger_tapping',
      title: 'Finger Tapping',
      slide: 1,
      animation: 'fingertap'),
  EyeExcerciesFile(
      link: 'https://healthy-ojas.com/eye/eye-massage.html',
      source:
          'This exercise helps to massage pressure points for the eyes and help relieve tension and headaches and provide a sense of relaxation. Also focusing on these points may also help alleviate eye twitching or weakness.',
      id: 45,
      logo: 'head_palm_rub',
      title: 'Head Palm Rub',
      slide: 1,
      animation: 'head_palm'),
  EyeExcerciesFile(
      link: 'https://healthy-ojas.com/eye/eye-massage.html',
      source:
          'This exercise helps to clear the heart of toxins, relax the brain, calm nerves, invigorate the lymph nodes, and improve eyesight by bringing blood circulation to the head and eye region. It also lessens tension and stress.',
      id: 46,
      logo: 'lymph_cleanse',
      title: 'Lymph Cleanse',
      slide: 1,
      animation: 'lymph'),
  EyeExcerciesFile(
      link:
          'https://www.janetgoodrichmethod.com/2007/04/11/breathing-and-eyesight-part-1/',
      source:
          'This exercise helps to reduce Upper Body Tension by allowing the ribs to move, all the way in and out.The rib cage is an articulated unit that extends from waist to neck, front and back, and its state can have an impact on the condition of your spine, neck, and shoulders.  Practicing full relaxed breathing then, will also have a loosening effect on the entire upper body.',
      id: 47,
      logo: 'rhythmic_breathing',
      title: 'Rhythmic Breathing',
      slide: 2,
      animation: 'rhythemic'),
  EyeExcerciesFile(
      link:
          'https://www.janetgoodrichmethod.com/2007/04/11/breathing-and-eyesight-part-1/',
      source:
          'Breathing through the nose with awareness activates nerve receptors inside the nasal cavities that stimulate the frontal lobes of the brain, triggering the parasympathetic nervous system. This has a calming effect on the brain and emotions.  Nostril breathing also warms and filters the breath; allowing cleaner air and more oxygen to be taken into the body then mouth breathing',
      id: 48,
      logo: 'single_nostril',
      title: 'Single Nostril Breathing',
      slide: 1,
      animation: 'nostril'),
  // EyeExcerciesFile(
  //     id: 7,
  //     logo: 'Splitting Gabor',
  //     title: 'Splitting Gabor',
  //     slide: 3,
  //     animation: ''),
  // EyeExcerciesFile(
  //     id: 9,
  //     logo: 'Growing Gabor',
  //     title: 'Growing Gabor',
  //     slide: 3,
  //     animation: ''),
];
