class NaveEnemy {
  float enemXpos=0, enemYpos=0, speed=4.0, enemDropXpos, enemDropYpos;
  int enemyR, scoreMultiplier;
  boolean enemyAlive;
  int i = int(random(0, 30));


  NaveEnemy(float x, float y) {
    enemXpos = x;
    enemYpos = y;
    enemDropXpos =  enemXpos;
    enemDropYpos =  enemYpos;
    enemyR = 30;
    scoreMultiplier = 0;
    enemyAlive = true;
  }

  void update(float x, float y) {
    if (enemyAlive == true) {
      drawEnemies(x, y);
    } else {
      if (i<=15) {
        bonusDrop(x);
      }
    }
  }

  void drawEnemies(float x, float y) {
    fill(255);
    ellipseMode(CENTER);
    circle(x, y, enemyR);
    collision(p1.t1.xposAt, p1.t1.yposAt);
  }

  void bonusDrop(float x) {
    enemDropXpos = x;
    enemDropYpos += 2;
    fill(255);
    circle(enemDropXpos, enemDropYpos, 30);
    if (collisionDrop(p1.xpos, p1.ypos) == true) {
    } else {
    }
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

  boolean collisionDrop(float xPlayer, float yPlayer) {
    float distX = xPlayer - (enemDropXpos);
    float distY = yPlayer - (enemDropYpos);
    float distHipotenusa = sqrt( sq(distX) + sq(distY) );

    if (distHipotenusa <= 15) {
      return true;
    } else {
      return false;
    }
  }
}
