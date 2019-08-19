class Puck {
  float puckX = width/2;
  float puckY = height/2;
  float xspeed;
  float yspeed;
  float radius = 10;

  float contador = 0;

  boolean isGame = false;

  Puck() {
    reset();
  }

  void checkPaddleLeft(Paddle p) {
    if (puckY < p.paddleY + p.paddleH/2 && puckY > p.paddleY - p.paddleH/2 && puckX - radius < p.paddleX + p.paddleW/2) {
      if (puckX > p.paddleX) {
        contador = contador + 0.4;
        float diff = puckY - (p.paddleY - p.paddleH/2);
        float rad = radians(44);
        float angle = map(diff, 0, p.paddleH, -rad, rad);
        if (angle < 0) {
          xspeed = 5 + contador * cos(angle);
          yspeed = -5 + contador * sin(angle);
        } else {
          xspeed = 5 + contador * cos(angle);
          yspeed = 5 + contador * sin(angle);
        }
        puckX = p.paddleX + p.paddleW/2 + radius;
        p.paddleSub();
        if (p.paddleH <=40) {
          p.isSub = false;
        }
      }
    }
  }

  void checkPaddleRight(Paddle p) {
    if (puckY < p.paddleY + p.paddleH/2 && puckY > p.paddleY - p.paddleH/2 && puckX + radius > p.paddleX - p.paddleW/2) {
      if (puckX < p.paddleX) {
        contador = contador + 0.4;
        float diff = puckY - (p.paddleY - p.paddleH/2);
        float rad = radians(44);
        float angle = map(diff, 0, p.paddleH, rad, -rad);
        if (angle < 0) {
          xspeed = -5 - contador * cos(angle);
          yspeed = 5 - contador * sin(angle);
        } else {
          xspeed = -5 - contador * cos(-angle);
          yspeed = -5 - contador * sin(angle);
        }
        puckX = p.paddleX - p.paddleW/2 - radius;
        p.paddleSub();
        if (p.paddleH <=40) {
          p.isSub = false;
        }
      }
    }
  }

  void update() {
    puckX = puckX + xspeed;
    puckY = puckY + yspeed;
  }

  void reset() {
    contador = 0;
    puckX = width/2;
    puckY = height/2;
    float angle = random(-PI/4, PI/4);
    xspeed = 5 * cos(angle);
    yspeed = 5 * sin(angle);
    if (random(1) < 0.4) {
      xspeed *= -1;
    }
  }

  void edges() {
    isGame = true;
    if (isGame) {
      if (puckY - radius < 0 || puckY + radius > height) {
        yspeed *=  -1;
      }
      if (puckX - radius > width) {
        leftScore++;
        reset();
      }
      if (puckX + radius < 0) {
        rightScore++;
        reset();
      }
    }
  }

  void edgesMenu() {
    if (!isGame) {
      if (puckY - radius < 0 || puckY + radius > height) {
        yspeed *=  -1;
      }
      if (puckX + radius > width || puckX - radius < 0) {
        xspeed *=  -1;
      }
    }
  }

  void show(color colorSelected) {
    fill(colorSelected);
    ellipse(puckX, puckY, radius*2, radius*2);
  }
}
