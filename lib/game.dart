import 'dart:math';

import 'package:flutter/material.dart';
import 'package:game_app/action_button.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  String playerChoice = '';
  String computerChoice = '';
  int playerScore = 0;
  int computerScore = 0;
  String resultMessage = '';
  var choices = ['rock', 'paper', 'scissors'];
  void play(String playerSelection) {
    final compSelection = choices[Random().nextInt(3)];
    String result;

    if (playerSelection == compSelection) {
      result = "It's a tie! 🤝";
    } else if ((playerSelection == 'rock' && compSelection == 'scissors') ||
        (playerSelection == 'paper' && compSelection == 'rock') ||
        (playerSelection == 'scissors' && compSelection == 'paper')) {
      result = "You win! 😎";
      playerScore++;
    } else {
      result = "You lose! 😢";
      computerScore++;
    }

    setState(() {
      playerChoice = playerSelection;
      computerChoice = compSelection;
      resultMessage = result;
    });
  }

  void resetGame() {
    setState(() {
      playerChoice = '';
      computerChoice = '';
      playerScore = 0;
      computerScore = 0;
      resultMessage = '';
    });
  }

  String getImagePath(String choice) {
    if (choice.isEmpty) return '';
    return 'assets/$choice.png';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Let's Play Rock-Paper-Scissors",
            style: TextStyle(fontSize: 26),
          ),
          SizedBox(height: 60),
          Text(
            'You: $playerChoice',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(height: 10),
          Text(
            'Computer: $computerChoice',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(height: 26),
          Text(
            resultMessage,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ActionButton(
                imagePath: 'assets/rock.png',
                onTap: () => play('rock'),
              ),
              const SizedBox(width: 5),
              ActionButton(
                imagePath: 'assets/paper.png',
                onTap: () => play('paper'),
              ),
              const SizedBox(width: 5),
              ActionButton(
                imagePath: 'assets/scissors.png',
                onTap: () => play('scissors'),
              ),
            ],
          ),

          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Score: $playerScore',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 30),
              Text(
                'Computer Score: $computerScore',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          IconButton(
            icon: const Icon(Icons.refresh, size: 40, color: Colors.red),
            onPressed: resetGame,
          ),
        ],
      ),
    );
  }
}
