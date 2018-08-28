  class Magic{
  int[][] cost_1 = {{1,-1},{1,0},{1,1},{0,-1},{0,1},{-1,-1},{-1,0},{-1,1}};
    void cast(int y,int x,int tag){
      int id = 9;
        for(int i = 0; i < cost_1.length; i++){
          if(Mobs[tag].get_wand()[0] - Mobs[tag].get_wand()[2] == cost_1[i][0]//fire - aqua
             && Mobs[tag].get_wand()[1] - Mobs[tag].get_wand()[3] == cost_1[i][1])//wind -earth
            id = i;
        }
        switch(id){
          case 0:
            area.change_tile(y,x,'"');
            window.scroll_log(Mobs[tag].name + "は溶岩を召喚した");
            break;
          case 1:
            area.change_tile(y,x,'`');
            window.scroll_log(Mobs[tag].name +"は炎を召喚した");
            break;
          case 2:
            area.change_tile(y,x,'|');
            window.scroll_log(Mobs[tag].name + "は火柱を召喚した");
            break;
          case 3:
            area.change_tile(y,x,'%');
            window.scroll_log(Mobs[tag].name + "は壁を召喚した");
            break;
          case 4:
            area.change_tile(y,x,' ');
            window.scroll_log(Mobs[tag].name + "は奈落を召喚した");
            break;
          case 5:
            area.change_tile(y,x,'^');
            window.scroll_log(Mobs[tag].name + "は木を召喚した");
            break;
          case 6:
            area.change_tile(y,x,'~');
            window.scroll_log(Mobs[tag].name + "は沼を召喚した");
            break;
          case 7:
            area.change_tile(y,x,'$');
            window.scroll_log(Mobs[tag].name + "は嵐を召喚した");
            break;
          default:
            window.scroll_log(Mobs[tag].name + "は詠唱を失敗した");
            break;
        }
      Mobs[tag].reset_wand();
    }
  }
