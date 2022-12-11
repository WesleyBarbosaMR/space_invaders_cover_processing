class NaveEnemy {
  float enemXpos=0, enemYpos=0, speed=4.0;
  int enemyR=30;
  boolean enemyAlive;

  NaveEnemy(float x, float y) {
    enemXpos = x;
    enemYpos = y;
    enemyAlive = true;
  }

  void update(float x, float y) {
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
      rect(enemXpos+45, enemYpos+120, 25, 25);
      collisionDetected = true;
      enemyAlive = false;
      hiScore++;
      return true;
    } else {
      enemyAlive = true;
      return false;
    }
  }
}
