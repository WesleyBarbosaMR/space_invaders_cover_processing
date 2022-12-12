class NaveEnemy {
  float enemXpos=0, enemYpos=0, speed=4.0;
  int enemyR, scoreMultiplier;
  boolean enemyAlive;

  NaveEnemy(float x, float y) {
    enemXpos = x;
    enemYpos = y;
    enemyR = 30;
    scoreMultiplier = 0;
    enemyAlive = true;
  }

  void update(float x, float y) {
    drawEnemies(x, y);
  }

  void drawEnemies(float x, float y) {
    fill(255);
    ellipseMode(CENTER);
    circle(x, y, enemyR);
    collision(p1.t1.xposAt, p1.t1.yposAt);
  }

  boolean collision(float xShot, float yShot) {
    float distX = xShot - (enemXpos+45);
    float distY = yShot - (enemYpos+120);
    float distHipotenusa = sqrt( sq(distX) + sq(distY) );

    if (distHipotenusa <= enemyR) {
      collisionDetected = true;
      enemyAlive = false;
      if (scoreMultiplier > 0) {
        hiScore+=(scoreMultiplier*2);
      } else {
        hiScore++;
      }
      return true;
    } else {
      enemyAlive = true;
      return false;
    }
  }
}
