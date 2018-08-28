class Map{ //<>//
  private TileTemplate[][]  maptiles = new TileTemplate[def.mapsize][def.mapsize];
  char[][] mapchips = new char[def.mapsize][def.mapsize];
 // char[][] grounds = new char[def.mapsize][def.mapsize];
 
   void set_map(){
    for(int y = 0; y < def.mapsize; y++){
      for(int x = 0; x < def.mapsize; x++){
         this.maptiles[y][x] = tilecreater.set_tile('.');
         this.mapchips[y][x] = '.';
      }
    }
  }
  
  TileTemplate maptiles(int y, int x) {
    TileTemplate tile;
    if(x < 0 || x <= def.mapsize || y < 0 || y <= def.mapsize) {
      x = constrain(x,0,def.mapsize-1);
      y = constrain(y,0,def.mapsize-1);
    }
    tile = maptiles[y][x];
    return tile;
  }
  
  void change_tile(int y,int x, char tile){
    this.maptiles[y][x] = tilecreater.set_tile(tile);
  }

  void set_field(boolean day){
    for(int i = 0;i < def.mapsize;i++){
      for(int j = 0;j < def.mapsize;j++){
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
  TileTemplate set_tile(char character){
    switch(character){
      case '.':
        return new Ash();
      case '^':
        return new Tree();
      case '%':
        return new Wall();
      case'~':
        return new Swamp();
      case ' ':
        return new Hole();
      case '`':
        return new Fire();
      case '"':
        return new Magma();
      case '|':
        return new BlazingColumn();
      case '$':
        return new Storm();
      case '#':
        return new Ladder();
      default:
      return new Ash();
    }
  }
}

abstract class TileTemplate{
  protected String name;
  protected char character;
  
  protected boolean flag_through;
  protected boolean flag_slow;
  protected boolean flag_visible;
  protected boolean flag_damage;
  
  protected boolean flag_ladder;
  
  protected boolean known;
  
  protected void checked(){this.known = true;}
  
  public boolean is_through(){
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
  
  boolean is_known(){
    return this.known;
  }
  
  char get_character(){
    return this.character;
  }
  String get_name(){
    return this.name;
  }
}

class Ash extends TileTemplate{
  Ash(){
    this.name = "灰";
    this.character = '.';
    this.flag_through = true;
    this.flag_slow = false;
    this.flag_visible = true;
    this.flag_damage = false;
    this.flag_ladder = false;
    this.known = false;
  }
}

class Tree extends TileTemplate/*earth aqua*/{
  Tree(){
    this.name = "木";
    this.character = '^';
    this.flag_through = true;
    this.flag_slow = true;
    this.flag_visible = false;
    this.flag_damage = false; 
    this.flag_ladder = false;
    this.known = false;
  }
}

class Wall extends TileTemplate/*earth*/{
  Wall(){
    this.name = "壁";/*earth*/
    this.flag_through = false;
    this.flag_slow = false;
    this.flag_visible = false;
    this.flag_damage = false;
    this.flag_ladder = false;
    this.character = '%';
    this.known = false;
  }
}

class Swamp extends TileTemplate{
  Swamp(){
    this.name = "沼";/*aqua*/
    this.flag_through = true;
    this.flag_slow = true;
    this.flag_visible = true;
    this.flag_damage = false;
    this.flag_ladder = false;
    this.character = '~';
    this.known = false;
  }
}

class Hole extends TileTemplate{
  Hole(){
    this.name = "奈落";/*wind*/
    this.flag_through = false;
    this.flag_slow = false;
    this.flag_visible = true;
    this.flag_damage = false;
    this.flag_ladder = false;
    this.character = ' ';
    this.known = false;
  }
}

class Fire extends TileTemplate{
  Fire(){
    this.name = "炎";/*fire*/
    this.flag_through = true;
    this.flag_slow = false;
    this.flag_visible =true;
    this.flag_damage = true;
    this.flag_ladder = false;
    this.character = '`';
    this.known = false;
  }
}

class Magma extends TileTemplate{
  Magma(){
    this.name = "溶岩";/*earth fire*/
    this.flag_through = true;
    this.flag_slow = true;
    this.flag_visible = true;
    this.flag_damage = true;
    this.flag_ladder = false;
    this.character = '"';
    this.known = false;
  }
}

class BlazingColumn extends TileTemplate{
  BlazingColumn(){
    this.name = "火柱";/*wind fire*/
    this.flag_through = true;
    this.flag_slow = false;
    this.flag_visible = false;
    this.flag_damage = true;
    this.flag_ladder = false;
    this.character = '|';
    this.known = false;
  }
}

class Storm extends TileTemplate{
  Storm(){
    this.name = "嵐";/*wind aqua*/
    this.flag_through = true;
    this.flag_slow = true;
    this.flag_visible = false;
    this.flag_damage = true;
    this.flag_ladder = false;
    this.character = '$';
    this.known = false;
  }
}

class Ladder extends TileTemplate{
  Ladder(){
    this.name ="梯";
        this.flag_ladder = true;
        this.flag_through = true;
        this.flag_slow = false;
        this.flag_visible = true;
        this.flag_damage = false;
        this.character = '#';
        this.known = false;
  }
}
