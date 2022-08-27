import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;
  currentValue := 300;
  stable var startTime = Time.now();

  let id = 233445678889;
  Debug.print(debug_show(currentValue));

  //function should close with ;
  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };
  
  public func withDrawl(amount : Float){
    let tempValue : Float = currentValue - amount;
    if(tempValue >= 0){
        currentValue -= amount;
        Debug.print(debug_show(currentValue));
    }
    else{
      Debug.print("Amount too large");
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func compound(){
    let currentTime = Time.now();
    let timeElapseNS = currentTime - startTime;
    let timeElapseS = timeElapseNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapseS));
    startTime := currentTime;
  };
}

