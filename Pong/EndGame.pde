class EndGame {
  Puck puck;

  Paddle left;
  Paddle right;
  EndGame() {
    puck = new Puck();
    left = new Paddle(true);
    right = new Paddle(false);
  }

  void show(color winning) {
    background(0);
    puck.edgesMenu();
    puck.update();
    left.colorSelected = winning;
    right.colorSelected = winning;
    left.show();
    right.show();
    puck.show(winning);
    for (int y = 0; y < height; y+=10) {
      stroke(winning);
      line(350, y, 350, y+5);
    }

    for (int x = 0; x < width; x+=10) {
      stroke(winning);
      line(x, 20, x+5, 20);
      line(x, 480, x+5, 480);
    }
    fill(255);
    textSize(24);
    textAlign(CENTER);
    text("!Vencedor!", 350, 250);
  }
}
