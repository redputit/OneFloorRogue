class Command{

      void move(int i,int j,int m,boolean look){
      if(look != true){
        for(int n = 0; n < dif.chara_sum;n++){
          if(Mobs[m].get_bodyY() + i == Mobs[n].get_bodyY() && Mobs[m].get_bodyX() + j == Mobs[n].get_bodyX() &&Mobs[m].tag_num != n){
            window.scroll_log(Mobs[m].name + "が" + Mobs[n].name + "に攻撃した");
            Mobs[n].damage(Mobs[m].strength);

            plrole = '#';
            Mobs[m].active = false;
            return;
          }
        }
      
        if(Mobs[m].get_bodyY() + i < 0 || Mobs[m].get_bodyY() +i > dif .mapsize-1 || Mobs[m].get_bodyX() + j < 0 || Mobs[m].get_bodyX() + j > dif.mapsize-1){
          if(Mobs[m].user == true){
            window.scroll_log("「そちらは作戦範囲外だ、引き返せ」");
            plrole = '#';
          }else if(Mobs[m].user != true){
            Mobs[m].living = false;
          }
        }else if(area.maptiles(Mobs[m].get_bodyY() + i,Mobs[m].get_bodyX() +j).is_through() != true){
          if(Mobs[m].user == true){
            window.scroll_log("行く手を" + area.maptiles(Mobs[m].get_bodyY() + i,Mobs[m].get_bodyX() +j).get_name() + "が阻んでいる");
          }
          plrole ='#';
          return;
        }else{
            Mobs[m].set_bodyY(i); Mobs[m].set_bodyX(j);
            if(Mobs[m].target != dif.chara_sum){
              Mobs[m].set_lookdefault();
            }
 
            plrole = '#';
            Mobs[m].active = false;
        }
      }else if(look ==true){
        for(int n = 0; n < dif.chara_sum;n++){
          if(Mobs[m].get_lookY() + i == Mobs[n].get_bodyY() && Mobs[m].get_lookX() + j == Mobs[n].get_bodyX() &&los(m,n)){
            Mobs[m].set_lookY(i); Mobs[m].set_lookX(j);
            window.scroll_log(Mobs[n].name + "(" + Mobs[n].get_HP() + ")" + "だ");
            plrole = '#';
            return;
          }
        }
      
        if(Mobs[m].get_lookY() + i < 0 || Mobs[m].get_lookY() +i > dif .mapsize-1 || Mobs[m].get_lookX() + j < 0 || Mobs[m].get_lookX() + j > dif.mapsize-1){
            window.scroll_log("作戦範囲外だ");
            plrole = '#';
            
          }else if(area.maptiles[Mobs[m].get_lookY() + i][Mobs[m].get_lookX() + j].get_name() != "灰"){
            Mobs[m].set_lookY(i);
            Mobs[m].set_lookX(j);
            window.scroll_log(area.maptiles(Mobs[m].get_lookY(),Mobs[m].get_lookX()).get_name() + "だ");
            plrole = '#';
          }else{
            Mobs[m].set_lookY(i);
            Mobs[m].set_lookX(j);
            plrole = '#';
          }

        }
      }
      
      void targetting(int m){
        for(int i = 0; i < dif.chara_sum;i++){
          if(Mobs[m].get_lookY() == Mobs[i].get_bodyY() && Mobs[m].get_lookX() == Mobs[i].get_bodyX()){
            Mobs[m].flag_targetting = true;
            Mobs[m].target = i;
            window.scroll_log(Mobs[i].name + "に狙いを定めた");
          }
        }
        if(Mobs[m].flag_targetting != true){
          Mobs[m].flag_targetting = true;
          Mobs[m].target = dif.chara_sum;
          window.scroll_log(area.maptiles(Mobs[m].get_lookY(),Mobs[m].get_lookX()).get_name() + "に狙いを定めた");
        }
        look = false;
        plrole = '#';
      }
      
      boolean los(int n, int m){

        return los(n,Mobs[m].get_bodyY(),Mobs[m].get_bodyX());
        
      }
      
      boolean los(int n, int y, int x){
        int dx = x - Mobs[n].get_bodyX();
        int dy = y - Mobs[n].get_bodyY();
        int ay = abs(dy);
        int ax = abs(dx);
        
        if(dx == 0){
          if(dy > 0){
            for(int i = 1; i < ay; i++){
              if(area.maptiles(Mobs[n].get_bodyY() + i,Mobs[n].get_bodyX()).is_visible()){
                continue;
              }
              return false;
            }
            return true;
          }else{
            for(int i = 1; i < ay; i++){
              if(area.maptiles(Mobs[n].get_bodyY() - i,Mobs[n].get_bodyX()).is_visible()){
                continue;
              }
              return false;
            }
            return true;
          }
        }else{
          if(dx >= 0){
            if(dy / dx > 1){
              for(int i = 1; i < ay; i++){
                if(area.maptiles(Mobs[n].get_bodyY() + i,Mobs[n].get_bodyX() + round(dx / dy * i)).is_visible()){
                  continue;
                }
                return false;
              }
              return true;
            }else if(dy / dx < -1){
              for(int i = 1; i < ay; i++){
                if(area.maptiles(Mobs[n].get_bodyY() - i,Mobs[n].get_bodyX() - round(dx / dy * i)).is_visible()){
                  continue;
                }
                return false;
              }
              return true;
            }else{
              for(int i = 1; i < ax; i++){
                if(area.maptiles( Mobs[n].get_bodyY() + round(dy / dx * i),Mobs[n].get_bodyX() + i).is_visible()){
                  continue;
                }
                return false;
              }
              return true;
            }
          }else{
            if(dy / dx > 1){
              for(int i = 1; i < ay;i++){
                if(area.maptiles(Mobs[n].get_bodyY()-i,Mobs[n].get_bodyX() - round(dx/dy * i)).is_visible()){
                  continue;
                }
                return false;
              }
              return true;
            }else if(dy /dx < -1){
              for(int i = 1; i < ay;i++){
                if(area.maptiles(Mobs[n].get_bodyY() + i,Mobs[n].get_bodyX() + round(dx/dy * i)).is_visible()){
                  continue;
                }
                return false;
              }
              return true;
            }else{
              for(int i = 1;i< ax;i++){
                if(area.maptiles(Mobs[n].get_bodyY() - round(dy/dx *i),Mobs[n].get_bodyX() - i).is_visible()){
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
        if(Mobs[tag].target == dif.chara_sum && Mobs[tag].flag_targetting){
          magic.cast(Mobs[tag].get_lookY(),Mobs[tag].get_lookX(),tag);
          Mobs[tag].active = false;
          plrole = '#';
          return;
        }else if(tag == Mobs[tag].target
                 || dist(Mobs[constrain(Mobs[tag].target,0,dif.chara_sum-1)].get_bodyX(),Mobs[constrain(Mobs[tag].target,0,dif.chara_sum-1)].get_bodyY(),Mobs[tag].get_bodyX(),Mobs[tag].get_bodyY()) > 5
                 || Mobs[tag].flag_targetting == false){
          for(int i = 0; i < dif.chara_sum;i++){
            if(dist(Mobs[i].get_bodyX(),Mobs[i].get_bodyY(),Mobs[tag].get_bodyX(),Mobs[tag].get_bodyY()) < 5
               && i != tag
               && los(tag,i)){
              magic.cast(Mobs[i].get_bodyY(),Mobs[i].get_bodyX(),tag);
              Mobs[tag].active = false;
              plrole = '#';
              return;
            }
          }
        }else{
          magic.cast(Mobs[Mobs[tag].target].get_bodyY(),Mobs[Mobs[tag].target].get_bodyX(),tag);
          Mobs[tag].active = false;
          plrole = '#';
          return;
        }
      }
      
      void spelling(int i,int c){
        switch(c){
          case 0:
            Mobs[i].set_fire();
            break;
          case 1:
            Mobs[i].set_wind();
            break;
          case 2:
            Mobs[i].set_aqua();
            break;
          case 3:
            Mobs[i].set_earth();
            break;
        }
        plrole = '#';        
      }

}
    void keyPressed(){
          plrole = key;
          //println(plrole);
    }