class Command{
  void choice(){

  }
      void move(int i,int j,int m,boolean look){
      if(look != true){
        for(int n = 0; n < dif.chara_sum;n++){
          if(Mobs[m].getY(false) + i == Mobs[n].getY(false) && Mobs[m].getX(false) + j == Mobs[n].getX(false) &&Mobs[m].tag_num != n){
            window.scroll_log(Mobs[m].name + "が" + Mobs[n].name + "に攻撃した");
            Mobs[n].damage(Mobs[m].strength);

            plrole = '#';
            Mobs[m].active = false;
            return;
          }
        }
      
        if(Mobs[m].getY(false) + i < 0 || Mobs[m].getY(false) +i > dif .mapsize-1 || Mobs[m].getX(false) + j < 0 || Mobs[m].getX(false) + j > dif.mapsize-1){
          if(Mobs[m].user == true){
            window.scroll_log("「そちらは作戦範囲外だ、引き返せ」");
            plrole = '#';
          }else if(Mobs[m].user != true){
            Mobs[m].living = false;
          }
        }else if(area.maptiles(Mobs[m].getY(false) + i,Mobs[m].getX(false) +j).is_through() != true){
          if(Mobs[m].user == true){
            window.scroll_log("行く手を" + area.maptiles(Mobs[m].getY(false) + i,Mobs[m].getX(false) +j).get_name() + "が阻んでいる");
          }
          plrole ='#';
          return;
        }else{
            Mobs[m].coordinates_body[0] += i; Mobs[m].coordinates_body[1] += j;
            if(Mobs[m].target != dif.chara_sum){
              Mobs[m].coordinates_look[0] = Mobs[m].coordinates_body[0]; Mobs[m].coordinates_look[1] = Mobs[m].coordinates_body[1];
            }
 
            plrole = '#';
            Mobs[m].active = false;
        }
      }else if(look ==true){
        for(int n = 0; n < dif.chara_sum;n++){
          if(Mobs[m].getY(false) + i == Mobs[n].getY(false) && Mobs[m].getX(false) + j == Mobs[n].getX(false) &&los(m,n)){
            Mobs[m].coordinates_look[0] += i; Mobs[m].coordinates_look[1] += j;
            window.scroll_log(Mobs[n].name + "(" + Mobs[n].get_HP() + ")" + "だ");
            plrole = '#';
            return;
          }
        }
      
        if(Mobs[m].getY(true) + i < 0 || Mobs[m].getY(true) +i > dif .mapsize-1 || Mobs[m].getX(true) + j < 0 || Mobs[m].getX(true) + j > dif.mapsize-1){
            window.scroll_log("作戦範囲外だ");
            plrole = '#';
            
          }else if(area.maptiles[Mobs[m].getY(true) + i][Mobs[m].getX(true) + j].get_name() != "灰"){
            Mobs[m].coordinates_look[0] += i;
            Mobs[m].coordinates_look[1] += j;
            window.scroll_log(area.maptiles(Mobs[m].getY(true),Mobs[m].getX(true)).get_name() + "だ");
            plrole = '#';
          }else{
            Mobs[m].coordinates_look[0] += i;
            Mobs[m].coordinates_look[1] += j;
            plrole = '#';
          }

        }
      }
      
      void targetting(int m){
        for(int i = 0; i < dif.chara_sum;i++){
          if(Mobs[m].getY(true) == Mobs[i].getY(false) && Mobs[m].getX(true) == Mobs[i].getX(false)){
            Mobs[m].flag_targetting = true;
            Mobs[m].target = i;
            window.scroll_log(Mobs[i].name + "に狙いを定めた");
          }
        }
        if(Mobs[m].flag_targetting != true){
          Mobs[m].flag_targetting = true;
          Mobs[m].target = dif.chara_sum;
          window.scroll_log(area.maptiles(Mobs[m].getY(true),Mobs[m].getX(true)).get_name() + "に狙いを定めた");
        }
        look = false;
        plrole = '#';
      }
      
      boolean los(int n, int m){

        return los(n,Mobs[m].getY(false),Mobs[m].getX(false));
        
      }
      
      boolean los(int n, int y, int x){
        int dx = x - Mobs[n].getX(false);
        int dy = y - Mobs[n].getY(false);
        int ay = abs(dy);
        int ax = abs(dx);
        
        if(dx == 0){
          if(dy > 0){
            for(int i = 1; i < ay; i++){
              if(area.maptiles(Mobs[n].getY(false) + i,Mobs[n].getX(false)).is_visible()){
                continue;
              }
              return false;
            }
            return true;
          }else{
            for(int i = 1; i < ay; i++){
              if(area.maptiles(Mobs[n].getY(false) - i,Mobs[n].getX(false)).is_visible()){
                continue;
              }
              return false;
            }
            return true;
          }
        }else{
          if(dx > 0){
            if(dy / dx > 1){
              for(int i = 1; i < ay; i++){
                if(area.maptiles(Mobs[n].getY(false) + i,Mobs[n].getX(false) + round(dx / dy * i)).is_visible()){
                  continue;
                }
                return false;
              }
              return true;
            }else if(dy / dx < -1){
              for(int i = 1; i < ay; i++){
                if(area.maptiles(Mobs[n].getY(false) - i,Mobs[n].getX(false) - round(dx / dy * i)).is_visible()){
                  continue;
                }
                return false;
              }
              return true;
            }else{
              for(int i = 1; i < ax; i++){
                if(area.maptiles( Mobs[n].getY(false) + round(dy / dx * i),Mobs[n].getX(false) + i).is_visible()){
                  continue;
                }
                return false;
              }
              return true;
            }
          }else{
            if(dy / dx > 1){
              for(int i = 1; i < ay;i++){
                if(area.maptiles(Mobs[n].getY(false)-i,Mobs[n].getX(false) - round(dx/dy * i)).is_visible()){
                  continue;
                }
                return false;
              }
              return true;
            }else if(dy /dx < -1){
              for(int i = 1; i < ay;i++){
                if(area.maptiles(Mobs[n].getY(false) + i,Mobs[n].getX(false) + round(dx/dy * i)).is_visible()){
                  continue;
                }
                return false;
              }
              return true;
            }else{
              for(int i = 1;i< ax;i++){
                if(area.maptiles(Mobs[n].getY(false) - round(dy/dx *i),Mobs[n].getX(false) - i).is_visible()){
                  continue;
                }
                return false;
              }
              return true;
            }
          }          
        }

      }
      
      void trigger(int tag){
        if(Mobs[tag].target == dif.chara_sum){
        }else{
        }
      }
      
      void cast(int i,int c){
        if(Mobs[i].bloodtank[1][c] > 0 && Mobs[i].bloodtank[0][c] < 4){
          Mobs[i].bloodtank[0][c]++;
          Mobs[i].bloodtank[1][c]--;
        }else{
          Mobs[i].bloodtank[1][c] += Mobs[i].bloodtank[0][c];
          Mobs[i].bloodtank[0][c] -= Mobs[i].bloodtank[0][c];
        }
        plrole = '#';        
      }

}
    void keyPressed(){
          plrole = key;
          //println(plrole);
    }