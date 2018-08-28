  Defines def = new Defines();
  int plrole = '#'; //key初期化用
  boolean stopper = false;//key入力用　時止め
  String displaystr = "t";// string 初期化用
  boolean look = false;//ユーザおよび描画用
  Action demo = new Action();
  Map area = new Map();
  Maptile tilecreater;
  Ones[] Mobs = new Ones[def.chara_sum];
  ArrayList<Item> item_field;
  Display window = new Display();
  Command behavior = new Command();
  Magic magic = new Magic();
  File saves = new File();

  
  void setup(){
    fullScreen();
    saves = new File();
    tilecreater = new Maptile();
    saves.config = loadJSONObject("config.json");
    saves.load_config();
    demo = new Action();
    magic = new Magic();
    for(int i = 0; i < def.chara_sum;i++){
      Mobs[i] = new Ones();
    }
    for(int i = 0; i < def.mapsize;i++){
      for(int j = 0; j < def.mapsize;j++){
        area.maptiles[i][j] =new Ash();
   
      }
    }
    demo.hour = 8;
    window.set_displaydefault();
    area.set_map();

    Mobs[0].is_he();
    Mobs[1].is_mob();
         println(def.get_ynum());
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
