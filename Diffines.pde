  class Diffines{
    int fontsize_stat = 36;
    int fontsize_log = 24;
    int fontsize_field =48;
    int letters_stat = 6;
    int lines_log = 4;
    
    int chara_sum = 2;
    int mapsize = 128;
    
    int humanlimit  = 18000;
    final int tanklimit = 20000;
    
    int windowsize_left = fontsize_stat*6;
    
    int get_xnum(){
      return floor((width-fontsize_stat*letters_stat)/(fontsize_field/2));
    }
    int get_ynum(){
      return floor((height-fontsize_log*lines_log)/fontsize_field);
    }
  } //<>//
/*  
  起動
    画面を最大化
    display、Map、Onesを用意
    Actionを立ち上げる
    Action.rollを始める
    
  Action
    rollで時間を進める
    Ones.actで行動させる
    諸々の判定を行う
    戻る
  
  Ones.act
    userか判断する
    userはキー入力で行動
    それ以外はランダムに行動
    
  諸々の判定
    Onesの生死判定
    Itemの取得、消去判定
    
  */