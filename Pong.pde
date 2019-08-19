Puck puck; //<>//

Paddle left;
Paddle right;

MainMenu menu;

EndGame endGame;

boolean isGame = false;

int leftScore = 0;
int rightScore = 0;
color winning = #ffffff;

int state=0;
final int mainMenu = 0;
final int game = 1;
final int endGameScreen = 2;

void setup() {
  size(700, 500);
  puck = new Puck();
  left = new Paddle(true);
  right = new Paddle(false);
  menu = new MainMenu();
  endGame = new EndGame();
}

void draw() {
  switch(state) {
  case mainMenu:
    showMenu();
    break;
  }
  switch(state) {
  case game:
    runGame();
    break;
  }
  switch(state) {
  case endGameScreen:
    showEndGame();
    break;
  }
}

void showMenu() {
  menu.show();
}

void showEndGame() {
  endGame.show(winning);
}

void runGame() {
  background(0);

  puck.checkPaddleLeft(left);
  puck.checkPaddleRight(right);

  for (int y = 0; y < height; y+=10) {
    stroke(255);
    line(350, y, 350, y+5);
  }

  for (int x = 0; x < width; x+=10) {
    stroke(winning);
    line(x, 20, x+5, 20);
    line(x, 480, x+5, 480);
  }

  left.colorSelected = #db1d2b;
  right.colorSelected = #339FFF;
  left.show();
  right.show();
  left.update();
  right.update();

  puck.update();
  puck.edges();
  puck.show(winning);

  fill(255);
  textSize(32);
  text(leftScore, 70, 60);
  text(rightScore, width-110, 60);
  if (leftScore == rightScore) winning = #ffffff;
  else if (leftScore < rightScore) winning = #339FFF;
  else if (leftScore > rightScore) winning = #db1d2b;
  
  if(leftScore == 10){
    state = 2;
  }
  
  if(rightScore == 10){
    state = 2;
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') {
    left.move(0);
  } else if (key == 's' || key == 'S') {
    left.move(0);
  }

  if (key == 'o' || key == 'O') {
    right.move(0);
  } else if (key == 'k' || key == 'K') {
    right.move(0);
  }
  if (key=='n'|| key == 'N') state = 1;
}

void keyPressed() {
  if (key == 'w' || key == 'W') {
    left.move(-10);
  } else if (key == 's' || key == 'S') {
    left.move(10);
  }

  if (key == 'o' || key == 'O') {
    right.move(-10);
  } else if (key == 'k' || key == 'K') {
    right.move(10);
  }
}
