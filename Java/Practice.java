 class Practice extends inhe1 {
    int a=90 ;

void meth1(){

    System.out.print(" the meth1 from practice class" +  b + a );
}

 public static void main(String[] args) {
     
    Practice p = new Practice();
        p.meth1();

 }
 }


//  class first {

//     public  void method1(){
//         System.out.print(" this is the method  ");      }
//  }


//  class  second extends first{

//     @Override
//     public  void method1(){
//         System.out.print(" this is the method  ");     
//     }



//  }


 abstract class abclass {


    // default    String c = " jjj" ;   -> should not use the default keywoek explicitely for a instance variable 
    String c = "jjj";
    void method1(){
        System.out.print(" this is the method  " + c); 

    }

    abstract void abs_method ();


    abclass (){
        System.out.print(" this is the constructor  "); 
    }

    public void method_2 (){
        System.out.print(" this is the method from abclass  "); 
    }
    
 }

 class thrid extends abclass {

    @Override
    void abs_method() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'abs_method'");
    }
    
 
 }



 interface changes {


    int a= 10;

    static void method1(){
        System.out.print(" this is the method  "); 

    }

    static  String method2 (){
        
        return " this is the String ";
    }

    static void method3 (){
        System.out.print(" this is the method from interface  "); 
    }

    
 }


 class inhe1 {

    int b = 20 ;
    public final int  a= 10 ;
 }

//  class  checking   extends inhe1  {


// print

//  }
