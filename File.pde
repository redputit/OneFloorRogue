class File{
  JSONObject config = new JSONObject();
  JSONObject user = new JSONObject();
  
  void save_config(){
    config.setInt("fontsize_stat",dif.fontsize_stat);
    config.setInt("fontsize_log",dif.fontsize_log);
    config.setInt("fontsize_field",dif.fontsize_field);
    config.setInt("letters_stat",dif.letters_stat);
    config.setInt("lines_log",dif.lines_log);
    
    config.setInt("chara_sum",dif.chara_sum);
    config.setInt("mapsize",dif.mapsize);
  }
    
  void load_config(){
    dif.fontsize_stat = config.getInt("fontsize_stat");
    dif.fontsize_log = config.getInt("fontsize_log");
    dif.fontsize_field = config.getInt("fontsize_field");
    dif.letters_stat = config.getInt("letters_stat");
    dif.lines_log = config.getInt("lines_log");
    
    dif.chara_sum = config.getInt("chara_sum");
    dif.mapsize = config.getInt("mapsize");
  
  }
  
  void save_PC(){
    user.setBoolean("user",Mobs[0].user);
    user.setInt("tag_num",Mobs[0].tag_num);
    user.setString("visual",str(Mobs[0].visual));
    user.setInt("Body_y",Mobs[0].coordinates_body[0]);
    user.setInt("Body_x",Mobs[0].coordinates_body[1]);
    user.setInt("look_y",Mobs[0].coordinates_look[0]);
    user.setInt("look_x",Mobs[0].coordinates_look[1]);
    user.setBoolean("flag_targetting",Mobs[0].flag_targetting);
    user.setInt("target",Mobs[0].target);
    user.setInt("role",Mobs[0].role);
    user.setBoolean("active",Mobs[0].active);
    user.setBoolean("living",Mobs[0].living);
    
    user.setString("name",Mobs[0].name);
    user.setInt("str",Mobs[0].strength);
    user.setInt("siz",Mobs[0].size);
    user.setInt("con",Mobs[0].constitution);
    user.setInt("dex",Mobs[0].dexterity);
    user.setInt("int",Mobs[0].intelligence);
    user.setInt("edu",Mobs[0].education);
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