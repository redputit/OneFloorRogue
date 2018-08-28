class Item{
  
  String name;
  int[] coordinates = new int[2];
  int[] recipe = new int[4];//for ship
  char sort;
  
  int gram;
  int volume;
  
  boolean wand;
  boolean weapon;
  boolean armor;
  boolean bottle;
  
  int[][] tank = new int[2][4];
  
  void check_tank(){
    for(int i =0;i<4;i++){
      if(this.tank[0][i]>this.tank[1][i]){
        this.tank[0][i] = this.tank[1][i];
      }
    }
  }

  void charge(Bottle portion){
    for(int i = 0;i<4;i++){
      this.tank[0][i] += portion.tank[0][i];
    }
    check_tank();
  }
  
  int[] get_blood(){
    return this.tank[0];
  }
  
  int[] get_tank(){
    return this.tank[1];
  }
}

class Weapon extends Item{
  int[] spell = new int[4];
  int attack;
  int power;
  int protect;
}

class Wand extends Item{
  int attack;
  int power;
  int protect;
}


class Armor extends Item{
  int attack;
  int power;
  int protect;
}

class Bottle extends Item{
}
