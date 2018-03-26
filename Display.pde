 class Display{
  PFont mfont;
  private int cameraX,cameraY;
  private String[] log = new String[dif.lines_log];
  private int[] repeatTimes = new int[dif.lines_log];
//  Diffines test = new Diffines(); //<>//
 //<>//
   
   void set_displaydefault(){
     this.mfont = createFont("Osaka-Mono",48,true);/*Hymmnos*/
     textFont(mfont, dif.fontsize_field);
     
   }
   void scroll_log(String newlog){
     if(newlog.equals(log[0])) {
       this.repeatTimes[0]++;
       println("* " + repeatTimes[0]);
     } else {
       for(int n = log.length - 1; n > 0; n--) {
         this.log[n] = this.log[n - 1];
         this.repeatTimes[n] = this.repeatTimes[n - 1];
       }
       this.log[0] = newlog;
       this.repeatTimes[0] = 0;
     }
   }
    void rewrite(){ 
      background(0,0,0);
//field      
      area.set_field(false);
      for(int i = Mobs[0].coordinates_body[0] - 5;i <= Mobs[0].coordinates_body[0] + 5;i++){
        for(int j = Mobs[0].coordinates_body[1] -5;j <= Mobs[0].coordinates_body[1] + 5; j++){
          if(sq(i - Mobs[0].coordinates_body[0]) + sq(j - Mobs[0].coordinates_body[1]) <=25 && behavior.los(0,i,j)){
            area.mapchips[constrain(i,0,dif.mapsize-1)][constrain(j,0,dif.mapsize-1)] = area.maptiles(i,j).get_character();
          }
        }
      }
      for(int i = 0; i < dif.chara_sum; i++){
        if(Mobs[i].living == true && behavior.los(0,i))
        area.mapchips[Mobs[i].get_bodyY()][Mobs[i].get_bodyX()] = Mobs[i].visual;
      }
      if(look){
        area.mapchips[Mobs[0].coordinates_look[0]][Mobs[0].coordinates_look[1]] = '*';
      }
      if(Mobs[0].getX(look) < floor(dif.get_xnum()/2)) cameraX = 0;
      else if(dif.mapsize - Mobs[0].getX(look) <= floor(dif.get_xnum()/2)) cameraX = dif.mapsize - dif.get_xnum();
      else cameraX = Mobs[0].getX(look) - floor(dif.get_xnum()/2);
      
      if(Mobs[0].getY(look) < floor(dif.get_ynum()/2)) cameraY = 0;
      else if(dif.mapsize - Mobs[0].getY(look) <= floor(dif.get_ynum()/2)) cameraY = dif.mapsize - dif.get_ynum();
      else cameraY = Mobs[0].getY(look) - floor(dif.get_ynum()/2);
      
      for(int y = cameraY; y < cameraY + dif.get_ynum(); y++){
        for(int x = cameraX; x < cameraX + dif.get_xnum(); x++){
          if(displaystr == "t"){
            displaystr  = str(area.mapchips[cameraY][cameraX]);
          }else{
          displaystr += area.mapchips[y][x];
          }
        }
        displaystr += "\n";
      }
      fill(255*(24-abs(demo.hour-12))/24);
      textSize(dif.fontsize_field);
      textLeading(dif.fontsize_field);
      text(displaystr,dif.fontsize_stat*dif.letters_stat,dif.fontsize_field);
//stat      
      displaystr = Mobs[0].job[0] + "\n";
      displaystr += Mobs[0].get_HP() + "\n";
      displaystr += demo.get_day() + "日目\n";
      displaystr += demo.get_time() + "\n\n";
      displaystr += "f " + Mobs[0].bloodtank[0][0] + ":" + Mobs[0].bloodtank[1][0] + "cc\n";
      displaystr += "e " + Mobs[0].bloodtank[0][3] + ":" + Mobs[0].bloodtank[1][3] + "cc\n";
      displaystr += "w " + Mobs[0].bloodtank[0][1] + ":" + Mobs[0].bloodtank[1][1] + "cc\n";      
      displaystr += "a " + Mobs[0].bloodtank[0][2] + ":" + Mobs[0].bloodtank[1][2] + "cc\n";        
      textSize(dif.fontsize_stat);
      textLeading(dif.fontsize_stat);
      text(displaystr,0,dif.fontsize_stat,dif.fontsize_stat*dif.letters_stat);
//log      
      displaystr = log[3] + "\n";
      for(int i = 2;i >= 0; i--){
        displaystr += log[i] + getRepeatText(i) + "\n";
      }
      textSize(dif.fontsize_log);
      textLeading(dif.fontsize_log);
      text(displaystr,0,dif.fontsize_field*(dif.get_ynum()+1)-(dif.fontsize_field-dif.fontsize_log));
      displaystr = "t";
    }
    
    private String getRepeatText(int i) {
      if(repeatTimes[i] > 0) {
        return " x[" + (repeatTimes[i] + 1) + "]";
      }
      
      return "";
    }
  }
//   letters.set(0,"@");
 //   colorMode(RGB,256);
//fill(255);
//textSize(24);
//PFont mfont = loadFont("Osaka-Mono-48.vlw");
//PFont mfont = loadFont("Osaka-Mono-24.vlw");
//textFont(mfont, 18);
//text("@",0,48);
//text("",0,25);
/*マップ用配列４つ　display, 代入用String
*/