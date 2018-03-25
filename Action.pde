class Action{
   int second, minute,hour,day;
    String time;
//  Action(){ //<>//
//   area.set_map();
//  user.is_he();
//   window.rewrite();
//  } //<>//
  
  void roll(){
      window.rewrite();
      if(stopper !=true){
        for(int i = 0; i < dif.chara_sum;i++){        
          Mobs[i].charge();
          this.grobalturn();
        }

      }
      for(int i = 0; i < dif.chara_sum; i++){
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
    if(this.hour>= 19){
      this.time ="夜";
    }else if(this.hour >= 17){
      this.time = "夕";
    }else if(this.hour >= 9){
      this.time = "昼";
    }else if(this.hour >= 4){
      this.time = "朝";
    }else {
      this.time = "深夜";
    }
    
    
    
  }
  }