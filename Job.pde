interface Job{
  void damaged_melee();
  void damaged_magic();
  int attack();
}

class Human implements Job{
  void damaged_melee(){};
  void damaged_magic(){};
  int attack(){return 0;};
  
}
class Spirit implements Job{
  void damaged_melee(){};
  void damaged_magic(){};
  int attack(){return 0;};
}
