  class Ones{
    
    boolean user;
    int tag_num;
    char visual;
    int[] coordinates_body = new int[2];//0 : y , 1: x
    int[] coordinates_look = new int[2];
    boolean flag_targetting;
    int target;
    int role;
    boolean active;
    boolean living;
    
    String name;
    int strength;
    int size;
    int constitution;
    int dexterity;
    int intelligence;
    int education;
    int power;
    int agility;
    int appearance;
    
    int[] hitpoint = new int[2];//0:HP, 1:MHP
    String HP;
    String[] job = new String[2];
    int tag_job;//0;blooduser,1:phlebotomy, 2:child, 3: butterfly
    boolean human = false;
    boolean spirit = false;
    int[] tolerance = new int[4];//0:fire,1:wind,2:aqua,3:earth
    int[][] bloodtank = new int[3][4];//0:for magic 1:for tank 2:limit
    int energy = 0;
    
    String get_HP(){
      if(this.hitpoint[0] == this.hitpoint[1]){
        this.HP = "無傷";
      }else if(this.hitpoint[0]/this.hitpoint[1] >= 0.6){
        this.HP = "軽傷";
      }else if(this.hitpoint[0]/this.hitpoint[1] >= 0.1){
        this.HP = "重症";
      }else if(this.hitpoint[0]/this.hitpoint[1] >= 0){
        this.HP = "瀕死";
      }else if(this.hitpoint[0] < 0){
        this.HP = "死亡";
      }
      return this.HP;
    }
    
    void set_job(int i){
      switch (i){
        case 0:
          this.tag_job = 0;
          this.job[0] = "BU";
          this.job[1] = "user";
          this.human = true;
          this.visual = 'p';
          break;
        case 1:
          this.tag_job = 1;
          this.job[0] = "SP";
          this.job[1] = "self_phlebotomist";
          this.human =true;
          this.visual = 'h';
          break;
        case 2:
          this.tag_job = 2;
          this.job[0] = "CH";
          this.job[1] ="child";
          this.human = true;
          this.spirit = true;
          this.visual = 'h';
        case 3:
          this.tag_job =3;
          this.job[0] = "BF";
          this.job[1] = "Butterfly";
          this.spirit =true;
          this.visual ='B';
        
          
      }
    }
      
    void is_he(){//test
      this.user = true;
      this.living =true;
      this.name = "つぇt";
      this.tag_num = 0;
      this.agility = 18000;
      this.strength = 10;
      this.hitpoint[0] = 10000; this.hitpoint[1] = 10000;
      this.coordinates_body[0] = 6; this.coordinates_body[1] = 5;
      this.coordinates_look[0] = this.coordinates_body[0]; this.coordinates_look[1] = this.coordinates_body[1];
      this.set_job(0);
      this.visual = '@';
    }
    void is_mob(){//test
      this.user =false;
      this.living = true;
      this.hitpoint[0] = 30;
      this.name = "test";
      this.tag_num =1;
      this.agility = 10000;
      this.coordinates_body[0] = 5; this.coordinates_body[1] = 5;
      this.set_job(3);
    }
    int getX(boolean look){
      if(look ==false){
        return this.coordinates_body[1];
      }else{
        return this.coordinates_look[1];
      }
    }
    int getY(boolean look){
      if(look ==false){
        return this.coordinates_body[0];
      }else{
        return this.coordinates_look[0];
      }
    }
    
    void damage(int atk){
      this.hitpoint[0] -= atk;
      this.dead();
    }
    
    void dead(){
      if(this.hitpoint[0] <= 0){
        this.living = false;
        window.scroll_log(this.name + "は死んだ");
        if(this.user == true){
          dispose();
        }
      }
    }
    
      
      void spawn(){
        this.is_mob();
      }
    
    void charge(){
      this.energy += this.agility/5;
    }
    void act(){
      if(this.energy >=20000){
        this.energy -= 20000;
        this.active = true;
        if(this.user == true){
          stopper = true;
        }
      }  
      if (this.active == true){
        
        if(this.user != true && this.living ==true){
          this.role = int(random(26)) + 'a';
        }else if(this.user == true){
          this.role = plrole;
          //println(this.role);
        }else{
          this.spawn();
          this.active =  false;
        }
        
        switch(this.role){
          
          case 'h': behavior.move(0,-1,this.tag_num,look); break;
          case 'j': behavior.move(1,0,this.tag_num,look); break;
          case 'k': behavior.move(-1,0,this.tag_num,look); break;
          case 'l': behavior.move(0,1,this.tag_num,look); break;
          case 'b': behavior.move(1,-1,this.tag_num,look); break;
          case 'n': behavior.move(1,1,this.tag_num,look); break;
          case 'y': behavior.move(-1,-1,this.tag_num,look); break;
          case 'u': behavior.move(-1,1,this.tag_num,look); break;
          case '.': behavior.move(0,0,this.tag_num,look); break;
          case '*':
            if(this.user == true){
              if(look == false){
                look = true;
                this.flag_targetting = false;
              }else{
                look =false;
              }
              plrole = '#';
            }
            break;
          case't':
            if(look){
              behavior.targetting(this.tag_num);
            }else{
              behavior.trigger(this.tag_num);   
            }
            break;
          case 'a':
            behavior.cast(this.tag_num,2);
            break;
          case 'w':
            behavior.cast(this.tag_num,1);
            break;
          case 'e':
            behavior.cast(this.tag_num,3);
            break;
          case 'f':
            behavior.cast(this.tag_num,0);
            break;
          default: plrole ='#';
        }
      }
    }
  }
     

  