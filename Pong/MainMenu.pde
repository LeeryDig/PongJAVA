class MainMenu {
  Puck puck;

  Paddle left;
  Paddle right;
  MainMenu() {
    puck = new Puck();
    left = new Paddle(true);
    right = new Paddle(false);
  }

  void show() {
    background(0);
    puck.edgesMenu();
    puck.update();
    left.colorSelected = #db1d2b;
    right.colorSelected = #339FFF;
    left.show();
    right.show();
    puck.show(winning);
    fill(255);
    textSize(24);
    textAlign(CENTER);
    text("PONG", 350, 100  );
    text("W", 20, 190);
    text("S", 20, 328);
    text("O", 680, 190);
    text("K", 680, 328);
    text("Precine 'N' para comecar", 350, 250);
  }
}
