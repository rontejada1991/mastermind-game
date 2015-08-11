# mastermind-game

My take on the classic Mastermind game. The computer randomly selects 4 random colors (duplicates allowed), and the player must guess them in order within 12 tries.

Features

- Easily scalable. You may add additional colors to make the game that much harder. It comes with the standard 6.
- The game is separated by the Player (keeps track of guesses), Solution (keeps track of the correct answer), and Game (the game loop) classes to be inline with OOP principles.

TO-DO

- Have the player be able to replay the game without having to restart the program.
- Introduce a game master mode, where the player selects their pattern and the computer has 12 tries to find the correct answer.