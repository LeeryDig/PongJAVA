class Paddle {
  float paddleX;
  float paddleY = height/2;
  float paddleW = 20;
  float paddleH = 100;

  boolean isSub = true;
  
  color colorSelected;
  
  float acce = 0;

  Paddle(boolean left) {
    if (left) {
      paddleX = paddleW;
    } else {
      paddleX = width - paddleW;
    }
  }

  void update() {
    paddleY += acce;
    paddleY = constrain(paddleY, paddleH/2 + 20, height-paddleH/2 - 20);
  }

  void move(float steps) {
    acce = steps;
  }

  void show() {
    fill(colorSelected);
    rectMode(CENTER);
    rect(paddleX, paddleY, paddleW, paddleH);
  }

  void paddleSub() {
    if (isSub) {
      paddleH = paddleH-2;
    }
  }
}
