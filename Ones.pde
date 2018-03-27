  class Ones{
    
    boolean user;
    int tag_num;
    char visual;
    private int[] coordinates_body = new int[2];//0 : y , 1: x
    private int[] coordinates_look = new int[2];
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
    
    private int[] hitpoint = new int[2];//0:HP, 1:MHP

    String[] job = new String[2];
    int tag_job;//0;blooduser,1:self-phlebotomist, 2:child, 3: butterfly
    boolean human;
    boolean spirit;
    int[] tolerance = new int[4];//0:fire,1:wind,2:aqua,3:earth
    private int[][] bloodtank = new int[3][4];//0:for magic 1:for tank 2:limit
    int energy = 0;
    
    String get_HP(){
      String HP = new String();
      if(this.hitpoint[0] == this.hitpoint[1]){
        HP = "無傷";
      }else if(this.hitpoint[0]/this.hitpoint[1] >= 0.6){
        HP = "軽傷";
      }else if(this.hitpoint[0]/this.hitpoint[1] >= 0.1){
        HP = "重症";
      }else if(this.hitpoint[0]/this.hitpoint[1] >= 0){
        HP = "瀕死";
      }else if(this.hitpoint[0] < 0){
        HP = "死亡";
      }
      return HP;
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
      this.bloodtank[1][0] = 500;
      this.bloodtank[1][1] = 500;
      this.bloodtank[1][2] = 500;
      this.bloodtank[1][3] = 500;
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
      this.hitpoint[1] = 60;
      this.name = "test";
      this.tag_num =1;
      this.agility = 10000;
      this.coordinates_body[0] = 5; this.coordinates_body[1] = 5;
      this.set_job(3);
    }
    
    int getX(boolean look){
      if(look){
        return this.coordinates_look[1];
      }else{
        return this.coordinates_body[1];
      }
    }
    
    int getY(boolean look){
      if(look){
        return this.coordinates_look[0];
      }else{
        return this.coordinates_body[0];
      }
    }
    int get_bodyX(){
      return  this.coordinates_body[1];
    }
    int get_bodyY(){
      return this.coordinates_body[0];
    }
    int get_lookX(){
      return this.coordinates_look[1];
    }
    
    int get_lookY(){
      return this.coordinates_look[0];
    }
    
    void set_bodyX(int i){
      this.coordinates_body[1] += constrain(i,-1,1);
    }
    void set_bodyY(int i){
      this.coordinates_body[0]+= constrain(i,-1,1);
    }
    
    void set_lookX(int i){
      this.coordinates_look[1] += constrain(i,-1,1);
    }
    void set_lookY(int i){
      this.coordinates_look[0] += constrain(i,-1,1);
    }
    
    void set_lookdefault(){
      this.coordinates_look[0] = this.coordinates_body[0];
      this.coordinates_look[1] = this.coordinates_body[1];
    }
    
    void set_fire(){//仮置き
      this.bloodtank[0][0]++;
      if(this.bloodtank[0][0] > 3 || this.bloodtank[1][0] - this.bloodtank[0][0]< 0){
        this.bloodtank[0][0] = 0;
      }
    }
    void set_wind(){
      this.bloodtank[0][1]++;
      if(this.bloodtank[0][1] > 3 || this.bloodtank[1][1] - this.bloodtank[0][1]< 0){
        this.bloodtank[0][1] = 0;
      }
    }
    void set_aqua(){
      this.bloodtank[0][2]++;
      if(this.bloodtank[0][2] > 3 || this.bloodtank[1][2] - this.bloodtank[0][2]< 0){
        this.bloodtank[0][2] = 0;
      }
    }
    void set_earth(){
      this.bloodtank[0][3]++;
      if(this.bloodtank[0][3] > 3 || this.bloodtank[1][3] - this.bloodtank[0][3]< 0){
        this.bloodtank[0][3] = 0;
      }
    }
    
    int[] get_wand(){
      return this.bloodtank[0];
    }
    
    void reset_wand(){
      for(int i = 0; i<4;i++){
      this.bloodtank[1][i] -= this.bloodtank[0][i];
      this.bloodtank[0][i] = 0;
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
          
          case 'h': 
            if(look ==false){
              behavior.move(0,-1,this.tag_num);
            }else{
              behavior.look(0,-1,this.tag_num);
            }
            break;
          case 'j':
            if(look == false){
              behavior.move(1,0,this.tag_num);
            }else{
              behavior.look(1,0,this.tag_num)
            }
            break;
          case 'k':
            if(look==false){
              behavior.move(-1,0,this.tag_num);
            }else{
              behavior.look(-1,0,this.tag_num);
            }
            break;
          case 'l':
            if(look == false){
              behavior.move(0,1,this.tag_num);
            }else{
              behavior.look(0,1,this.tag_num);
            }
            break;
          case 'b': 
            if(look ==false){
              behavior.move(1,-1,this.tag_num);
            }else{
              behavior.look(1,-1,this.tag_num);
            }
            break;
          case 'n':
          if(look == false){
            behavior.move(1,1,this.tag_num);
          }else{
            behavior.look(1,1,this.tag_num);
          }break;
          case 'y':
          if(look==false){
            behavior.move(-1,-1,this.tag_num);
          }else{
            behavior.look(-1,-1,this.tag_num)
          }
          break;
          case 'u':
          if(look==false){
            behavior.move(-1,1,this.tag_num);
          }else{
            behavior.look(-1,1,this.tag_num);
          }
          break;
          case '.':
          if(look==false){
            behavior.move(0,0,this.tag_num);
          }else{
            behavior.look(0,0,this.tag_num);
          }break;
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
            behavior.spelling(this.tag_num,2);
            break;
          case 'w':
            behavior.spelling(this.tag_num,1);
            break;
          case 'e':
            behavior.spelling(this.tag_num,3);
            break;
          case 'f':
            behavior.spelling(this.tag_num,0);
            break;
          default: plrole ='#';
        }
      }
    }
  }
     

  