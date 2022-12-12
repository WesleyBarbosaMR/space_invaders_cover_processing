public class PowerUpDoublePoints extends PowerUp {

  public PowerUpDoublePoints(float xpos) {
    super(xpos);

    this.update(this.xpos, this.ypos);
    this.drawActivePowerUp(this.xpos, this.ypos);
    this.status = true;
    this.type = 2;
  }
  
  void drawType4 (){
    
  }
}
