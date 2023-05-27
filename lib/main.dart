import 'package:flutter/material.dart';

void main() {
  runApp(RestaurantApp());
}

class RestaurantApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('Questionnaire'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuestionnairePage()),
                );
              },
            ),
            RaisedButton(
              child: Text('Roue de la Chance'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoueDeLaChancePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionnairePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final questions = [
      {
        'question': 'Question 1',
        'options': ['Option 1', 'Option 2', 'Option 3'],
      },
      {
        'question': 'Question 2',
        'options': ['Option 1', 'Option 2', 'Option 3'],
      },
      {
        'question': 'Question 3',
        'options': ['Option 1', 'Option 2', 'Option 3'],
      },
    ];

    final selectedOption = context.select((MyRouterDelegate value) => value.selectedOption);
    final selectedQuestionIndex = selectedOption != null ? selectedOption.length : 0;

    if (selectedQuestionIndex >= questions.length) {
      // Handle index out of range error
      return Scaffold(
        appBar: AppBar(
          title: Text('Questionnaire'),
        ),
        body: Center(
          child: Text('Invalid question index'),
        ),
      );
    }

    final selectedQuestion = questions[selectedQuestionIndex];

    var raisedButton = RaisedButton;
    return Scaffold(
      appBar: AppBar(
        title: Text('Questionnaire'),
      ),
      body: Column(
        children: [
          Text(selectedQuestion['question']),
          SizedBox(height: 16),
          Column(
            children: [
              for (var option in selectedQuestionIndex['options'])
                raisedButton(
                  child: Text(option),
                  onPressed: () {
                    // Handle button press
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }

  get RaisedButton => RaisedButton;
}

class RoueDeLaChancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Roue de la Chance'),
      ),
      body: Center(
        child: Text('Page de la Roue de la Chance'),
      ),
    );
  }
}