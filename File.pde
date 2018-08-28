class File{
  JSONObject config = new JSONObject();
  JSONObject user = new JSONObject();
  
  void save_config(){
    config.setInt("fontsize_stat",def.fontsize_stat);
    config.setInt("fontsize_log",def.fontsize_log);
    config.setInt("fontsize_field",def.fontsize_field);
    config.setInt("letters_stat",def.letters_stat);
    config.setInt("lines_log",def.lines_log);
    
    config.setInt("chara_sum",def.chara_sum);
    config.setInt("mapsize",def.mapsize);
  }
    
  void load_config(){
    def.fontsize_stat = config.getInt("fontsize_stat");
    def.fontsize_log = config.getInt("fontsize_log");
    def.fontsize_field = config.getInt("fontsize_field");
    def.letters_stat = config.getInt("letters_stat");
    def.lines_log = config.getInt("lines_log");
    
    def.chara_sum = config.getInt("chara_sum");
    def.mapsize = config.getInt("mapsize");
  
  }
  
  void save_PC(){
    user.setBoolean("user",Mobs[0].user);
    user.setInt("tag_num",Mobs[0].tag_num);
    user.setString("visual",str(Mobs[0].visual));
    user.setInt("Body_y",Mobs[0].get_bodyY());
    user.setInt("Body_x",Mobs[0].get_bodyX());
    user.setBoolean("living",Mobs[0].living);
    
    user.setString("name",Mobs[0].name);
    user.setInt("str",Mobs[0].strength);
    user.setInt("siz",Mobs[0].size);
    user.setInt("con",Mobs[0].constitution);
    user.setInt("dex",Mobs[0].dexterity);
    user.setInt("int",Mobs[0].intelligence);
    user.setInt("pow",Mobs[0].power);
    user.setInt("agi",Mobs[0].agility);
    user.setInt("app",Mobs[0].appearance);
    
    user.setInt("hp",Mobs[0].hitpoint[0]);
    user.setInt("mhp",Mobs[0].hitpoint[1]);
    user.setString("short",Mobs[0].job[0]);
    user.setString("long",Mobs[0].job[1]);
    user.setInt("tag.job",Mobs[0].tag_job);
    user.setBoolean("hum",Mobs[0].human);
    user.setBoolean("spi",Mobs[0].spirit);
    user.setInt("tol_f",Mobs[0].tolerance[0]);
    user.setInt("tol_a",Mobs[0].tolerance[1]);
    user.setInt("tol_e",Mobs[0].tolerance[2]);
    user.setInt("tol_w",Mobs[0].tolerance[3]);
    user.setInt("tank_f",Mobs[0].bloodtank[0][0]);
    user.setInt("tank_a",Mobs[0].bloodtank[0][1]);
    user.setInt("tank_e",Mobs[0].bloodtank[0][2]);
    user.setInt("tank_w",Mobs[0].bloodtank[0][3]);
    user.setInt("tank_f",Mobs[0].bloodtank[1][0]);
    user.setInt("tank_a",Mobs[0].bloodtank[1][1]);
    user.setInt("tank_e",Mobs[0].bloodtank[1][2]);
    user.setInt("tank_w",Mobs[0].bloodtank[1][3]);

  }
}
