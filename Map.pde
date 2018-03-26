class Map{ //<>//
  private Maptile[][]  maptiles = new Maptile[dif.mapsize][dif.mapsize];
  char[][] mapchips = new char[dif.mapsize][dif.mapsize];
 // char[][] grounds = new char[dif.mapsize][dif.mapsize];
 
   void set_map(){
    for(int y = 0; y < dif.mapsize; y++){
      for(int x = 0; x < dif.mapsize; x++){
         this.maptiles[y][x].set_tile('.');
         this.mapchips[y][x] = '.';
      }
    }
  }
  
  Maptile maptiles(int y, int x) {
    Maptile tile;
    if(x < 0 || x <= dif.mapsize || y < 0 || y <= dif.mapsize) {
      x = constrain(x,0,dif.mapsize-1);
      y = constrain(y,0,dif.mapsize-1);
    }
    tile = maptiles[y][x];
    return tile;
  }

  void set_field(boolean day){
    for(int i = 0;i < dif.mapsize;i++){
      for(int j = 0;j < dif.mapsize;j++){
        if(day){
          this.mapchips[i][j] = this.maptiles[i][j].get_character();
        }else{
          this.mapchips[i][j] = ' ';
        }
      }
    }
  }
}

class Maptile{
  private String name;
  private char character;
  
  private boolean flag_through = false;
  private boolean flag_slow = false;
  private boolean flag_visible = false;
  private boolean flag_damage = false;
  
  private boolean flag_ladder = false;
  
  void set_tile(char character){
    switch(character){
      case '.':
        this.name = "灰";  this.flag_through = true;  this.flag_slow = false;  this.flag_visible = true;  this.flag_damage = false;  this.character =character;
        break;
      case '^':
        this.name = "木";/*earth aqua*/  this.flag_through = true;  this.flag_slow = true;   this.flag_visible = false;  this.flag_damage = false; this.character = character;
        break;
      case '%':
        this.name = "壁";/*earth*/   this.flag_through = false;  this.flag_slow = false; this.flag_visible = false; this.flag_damage = false; this.character = character;
        break;
      case'~':
        this.name = "沼";/*aqua*/  this.flag_through = true;  this.flag_slow = true;  this.flag_visible = true;  this.flag_damage = false;  this.character = character;
        break;
      case ' ':
        this.name = "奈落";/*wind*/  this.flag_through = false;  this.flag_slow = false;  this.flag_visible = true;  this.flag_damage = false;  this.character = character;
        break;
      case '`':
        this.name = "炎";/*fire*/  this.flag_through = true;  this.flag_slow = false;  this.flag_visible =true;  this.flag_damage = true;  this.character = character;
        break;
      case '"':
        this.name = "溶岩";/*earth fire*/  this.flag_through = true;  this.flag_slow = true;  this.flag_visible = true;  this.flag_damage = true; this.character = character;
        break;
      case '|':
        this.name = "火柱";/*wind fire*/  this.flag_through = true;  this.flag_slow = false;  this.flag_visible = false;  this.flag_damage = true;  this.character = character;
        break;
      case '$':
        this.name = "嵐";/*wind aqua*/  this.flag_through = true;  this.flag_slow = true;  this.flag_visible = false;  this.flag_damage = true;  this.character = character;
        break;
      case '#':
        this.name ="梯";
        this.flag_ladder = true;
        this.flag_through = true;
        this.flag_slow = false;
        this.flag_visible = true;
        this.flag_damage = false;
        this.character = character;
      
      default:
    }
  }
  boolean is_through(){
    return this.flag_through;
  }
  boolean is_visible(){
    return this.flag_visible;
  }
  boolean is_slower(){
    return this.flag_slow;
  }
  boolean is_damage(){
    return this.flag_damage;
  }
  boolean is_ladder(){
    return this.flag_ladder;
  }
  
  char get_character(){
    return this.character;
  }
  String get_name(){
    return this.name;
  }
}