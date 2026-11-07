 import 'lessons/lesson1.dart';
import 'lessons/lesson2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(RaphalaAcademyApp());
}

class RaphalaAcademyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Raphala Academy',
      theme: ThemeData(primaryColor: Color(0xFF1A3A8F)),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// THIS IS YOUR OLD Main.java - The 4 options
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RAPHALA ACADEMY'), backgroundColor: Color(0xFF1A3A8F)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome back, Mr Raphala', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Ready to keep learning today? • 3 lessons in progress'),
            SizedBox(height: 20),
            // 1. Start Lesson - was case 1 in Main.java
            _menuButton(context, 'Start Lesson', 'Continue where you left off', Colors.red, LessonPage()),
            // 2. Take Quiz - was case 2
            _menuButton(context, 'Take Quiz', 'Test your knowledge • 10 mins', Colors.blue, QuizPage()),
            // 3. View Progress - was case 3
            _menuButton(context, 'View Progress', 'View stats & achievements', Colors.lightBlue, ProgressPage()),
            // 4. Java Hub - YOUR 11 LESSONS
            _menuButton(context, 'Learn Coding - Java', 'Lesson 1 to Lesson 11 • From basics to advanced', Color(0xFF1A3A8F), LessonPage()),
            SizedBox(height: 20),
            Text('Subjects', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children: ['Maths','English','Life Sciences','Physical Sciences','Accounting','Geography']
                .map((s) => Chip(label: Text(s))).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuButton(BuildContext context, String title, String subtitle, Color color, Widget page) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.white70)),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
      ),
    );
  }
}

// THIS IS YOUR LessonMenu.java + Lesson1.java to Lesson11.java
class LessonPage extends StatelessWidget {
  final List<String> lessons = [
    'Lesson 1: What is Java?',
    'Lesson 2: Variables',
    'Lesson 3: Data Types',
    'Lesson 4: If Statements',
    'Lesson 5: Loops',
    'Lesson 6: Methods',
    'Lesson 7: Arrays',
    'Lesson 8: Classes & Objects',
    'Lesson 9: Inheritance',
    'Lesson 10: Exceptions',
    'Lesson 11: Real Project',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Java Learning Hub - 11 Lessons')),
      body: ListView.builder(
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text(lessons[index]),
            trailing: Icon(Icons.play_circle_fill, color: Colors.red),
            onTap: () {
  if (index == 0) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => LessonDetailPage()));
} else if (index == 1) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => Lesson2DetailPage()));
} else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Coming soon: ${lessons[index]}')));
  }
},
              
          );
        },
      ),
    );
  }
}

// THIS IS YOUR Quiz.java + Question.java
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}
class _QuizPageState extends State<QuizPage> {
  int score = 0;
  int current = 0;
  final questions = [
    {'q': 'What does Java run on?', 'options': ['JVM', 'HTML', 'CSS'], 'answer': 0},
    {'q': 'Which keyword creates an object?', 'options': ['new', 'make', 'create'], 'answer': 0},
  ];
  @override
  Widget build(BuildContext context) {
    if (current >= questions.length) {
      return Scaffold(appBar: AppBar(title: Text('Quiz Done')), body: Center(child: Text('Score: $score / ${questions.length}')));
    }
    var q = questions[current];
    return Scaffold(
      appBar: AppBar(title: Text('Take Quiz')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(q['q'] as String, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ...(q['options'] as List<String>).asMap().entries.map((e) {
              return ElevatedButton(
                onPressed: () {
                  if (e.key == q['answer']) score++;
                  setState(() => current++);
                },
                child: Text(e.value),
              );
            }),
          ],
        ),
      ),
    );
  }
}

// THIS IS YOUR Progress.java + User.java
class ProgressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('View Progress')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Java Learning Hub', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('7 of 11 lessons completed', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            SizedBox(width: 200, child: LinearProgressIndicator(value: 0.6, color: Colors.red, backgroundColor: Colors.blue)),
            SizedBox(height: 10),
            Text('60% - Next: Lesson 8 - Loops & Conditionals'),
          ],
        ),
      ),
    );
  }
}
class LessonDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(lesson1Title)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text(lesson1Content, style: TextStyle(fontSize: 17)),
      ),
    );
  }
}
class Lesson2DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(lesson2Title)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text(lesson2Content, style: TextStyle(fontSize: 17)),
      ),
    );
  }
}