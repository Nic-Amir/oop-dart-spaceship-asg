import "dart:math" ;

void main() {

  SpaceShip s1= ArmoredSpaceShip("Merry",1000,200);
  SpaceShip s2 = HighSpeedSpaceShip("Sunny",1200,100);

  BattleField impel = BattleField();

  impel.startBattle(s1,s2);
}


abstract class SpaceShip {

  String name;
  int health;
  int firePower;

  void hit(int atk){

    health= health-atk;
  }

  void isDestroyed(){
    if (health==0){
      print ("this spaceship telah karam");
    }else {
      print ('Ship health; $health');
    }

  }

  SpaceShip(this.name, this.health, this.firePower);

}


class BattleField{
  void startBattle(SpaceShip sp1, SpaceShip sp2){

    bool whoStart = Random().nextBool();

    print("Battle of ImpelDown Begin");
    print("");

    if (whoStart){

      do{
        print("${sp1.name} is attacking ${sp1.firePower} fire power!");
        sp2.hit(sp1.firePower);
        print('${sp2.name} health: ${sp2.health}');

        if(sp1.health<0){//round n ended
          print("${sp1.name} died, ${sp2.name} won");
        }else if(sp2.health<0){
          print("${sp2.name} died, ${sp1.name} won");
        }else {
          print("the war cont.");
          print("");}

        if(sp2.health>0){
          print("${sp2.name} is attacking ${sp2.firePower} fire power!");
          sp1.hit(sp2.firePower);
          print('${sp1.name} health: ${sp1.health}');


          if(sp1.health<0){//round n+1 ended
            print("${sp1.name} died, ${sp2.name} won");
          }else if(sp2.health<0){
            print("${sp2.name} died, ${sp1.name} won");
          }else {
            print("the war cont.");
            print("");}
        }else{}
      }




      while((sp2.health>=0) && (sp1.health >=0));





    }else {

      do{
        print("${sp2.name} is attacking ${sp2.firePower} fire power!");
        sp1.hit(sp2.firePower);
        print('${sp1.name} health: ${sp1.health}');

        if(sp1.health<0){//round n ended
          print("${sp1.name} died, ${sp2.name} won");
        }else if(sp2.health<0){
          print("${sp2.name} died, ${sp1.name} won");
        }else {
          print("the war cont.");
          print("");}

        if(sp1.health>0){
          print("${sp1.name} is attacking ${sp1.firePower} fire power!");
          sp2.hit(sp1.firePower);
          print('${sp2.name} health: ${sp2.health}');


          if(sp1.health<0){//round n+1 ended
            print("${sp1.name} died, ${sp2.name} won");
          }else if(sp2.health<0){
            print("${sp2.name} died, ${sp1.name} won");
          }else {
            print("the war cont.");
            print("");}
        }else{}
      }




      while((sp2.health>0) && (sp1.health >0));
    }



  }
}

class ArmoredSpaceShip extends SpaceShip {


  @override
  void hit(int atk){
    int armor=(Random().nextInt(40)+1);

    health= health - (atk-armor);

    print("$name shield $armor of the attack, firepower: ${atk-armor} ");
  }

  ArmoredSpaceShip(name, health, firePower): super(name, health, firePower);

}

class HighSpeedSpaceShip extends SpaceShip{



  @override
  void hit(int atk){

    bool dodging = Random().nextBool();

    if(dodging){
      print('$name is so swift and manage to dodge the attack!');

      health =health -atk*0;



    }else{
      print('$name failed to dodge, took the full hit!');

      health=health -atk;

    }

  }
  HighSpeedSpaceShip(name, health, firePower): super(name, health, firePower);
}




