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
    LeeryDig();
  }

  void LeeryDig() {
    fill(#00ff00);
    stroke(#00ff00);
    rectMode(CENTER);
    rect(40, 20, 50, 30);

    fill(#ffff00);
    stroke(#ffff00);
    triangle(16, 20, 40, 35, 40, 6);
    triangle(65, 20, 40, 35, 40, 6);

    fill(#0000ff);
    stroke(#0000ff);
    ellipseMode(CENTER);
    ellipse(40, 20, 18, 18);

    fill(#ffffff);
    textAlign(LEFT);
    textSize(14);
    text("feito por - ", 85, 30);
    fill(#ffff00);
    text("LeeryDig ", 162, 30);
    
    stroke(#ffffff);
  }
}
