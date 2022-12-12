public class PowerUpLargeEnemies extends PowerUp {

  public PowerUpLargeEnemies(float xpos) {
    super(xpos);

    this.update(this.xpos, this.ypos);
    this.drawActivePowerUp(this.xpos, this.ypos);
    this.status = true;
    this.type = 2;
  }
  void drawType3 (){
    
  }
}
