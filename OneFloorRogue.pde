  Diffines dif = new Diffines();
  int plrole = '#';
  boolean stopper = false;
  String displaystr = "t";
  Action demo = new Action();
  boolean look = false;
  Map area = new Map();
  Ones[] Mobs = new Ones[dif.chara_sum];
  Display window = new Display();
  Command behavior = new Command();
  Magic magic = new Magic();
  File saves = new File();

  
  void setup(){
    fullScreen();
    saves = new File();

    saves.config = loadJSONObject("config.json");
    saves.load_config();
    demo = new Action();
    magic = new Magic();
    for(int i = 0; i < dif.chara_sum;i++){
      Mobs[i] = new Ones();
    }
    for(int i = 0; i < dif.mapsize;i++){
      for(int j = 0; j < dif.mapsize;j++){
        area.maptiles[i][j] =new Maptile();
   
      }
    }
    demo.hour = 8;
    window.set_displaydefault();
    area.set_map();
    for(int i = 0;i< 13;i++){
        area.maptiles(ceil(random(13)),ceil(random(13))).is_tile('$');
    }
    area.maptiles(7,7).is_tile('%');
    area.maptiles(7,8).is_tile('$');
    Mobs[0].is_he();
    Mobs[1].is_mob();
         println(dif.get_ynum());
         println(width);
         println(height);
    frameRate(30);
  }
  
  
  void draw(){
   demo.roll();
   if(Mobs[0].active != true){
     stopper =false;
   }
  }
  
  void dispose(){
    saves.save_config();
    saveJSONObject(saves.config,"data/config.json");
    println("exit");
  }