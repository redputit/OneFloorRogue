class Action{
  private int second, minute,hour,day = 1;
//  Action(){ //<>// //<>//
//   area.set_map();
//  user.is_he();
//   window.rewrite();
//  } //<>// //<>//
  
  void roll(){
      window.rewrite_field();
      if(stopper !=true){
        for(int i = 0; i < def.chara_sum;i++){        
          Mobs[i].charge();
          this.grobalturn();
        }

      }
      for(int i = 0; i < def.chara_sum; i++){
        Mobs[i].act();
      }
  }
    
  void grobalturn(){
    this.second++;
    if(this.second>=60){
      this.second -= 60;
      this.minute++;
    }
    if(this.minute >=60){
      this.minute-=60;
      this.hour++;
    }
    if(this.hour>=24){
      this.hour-=24;
      this.day++;
    }
  }
  
  int get_day(){
    return this.day;
  }
  String get_time(){
    String time = new String();
    if(this.hour>= 19){
      time ="夜";
    }else if(this.hour >= 17){
      time = "夕";
    }else if(this.hour >= 9){
      time = "昼";
    }else if(this.hour >= 4){
      time = "朝";
    }else {
      time = "深夜";
    }
    return time;
  }
    
    
}
