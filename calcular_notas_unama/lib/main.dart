import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){

  runApp(MaterialApp(

    title: "Calcular notas",
    home: Home(),
  ));

}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  
  TextEditingController nota1 = TextEditingController();
  TextEditingController notaColegiada = TextEditingController();
  GlobalKey<FormState> validacao = GlobalKey<FormState>();

  String resultado ="";
  String resultFinal = "";


  void _refres(){
    setState(() {
      resultado = " ";
      nota1.text = "";
      notaColegiada.text = "";
      resultFinal = "";
      validacao = GlobalKey<FormState>();
    });
  }


  void _calcular(){
    setState(() {
      double nota1AV = double.parse(nota1.text);
      double nota2AV = double.parse(notaColegiada.text);
      double media = (nota1AV + nota2AV) /2;
      double provaFinal = 10 - media;

    if(nota1AV > 10){
      resultado = "Nota inválida";
      
    }else if(nota2AV >10){
       resultado = "Nota inválida";
       
    }else{
        if(media >=7){
      resultado = "Você passou";

    }else if(media < 7 && media >=4){
      resultado = "Você ficou de prova final";
      resultFinal = "Precisa tirar $provaFinal para passar"; 
      

    }else if(media<4){
      resultado = "Você reprovou";
    }
    }});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Text("Calule sua nota",style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blue,
          
          actions: <Widget>[
            IconButton(icon: Icon(Icons.refresh), onPressed: (){_refres();})
          ],
          
        ),

        body:SingleChildScrollView(

          child: Form(
            key: validacao,
            child: Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[

          Icon(Icons.account_circle,size: 120.0,color: Colors.green,),

          TextFormField(keyboardType: TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(

            labelText: "Digite sua nota",labelStyle: TextStyle(color: Colors.blue,
            fontSize: 15.0),
              ),

            style: TextStyle(color: Colors.blue,fontSize: 15.0),
            controller: nota1,
            validator: (value){
              if(value.isEmpty){
                return "Campo vazio!! Digite sua nota!!";
              }
            },
          ),

          Padding(padding: EdgeInsets.all(15.0)),

          TextFormField(keyboardType: TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            labelText: "Digite sua nota",labelStyle: TextStyle(color: Colors.blue,
            fontSize: 15.0),
              ),

              style: TextStyle(color: Colors.blue,fontSize: 15.0),
              controller: notaColegiada,
              validator: (value){
                if(value.isEmpty){
                  return "Campo vazio!! Digite sua nota!!";
                }
              },
          ),

          Padding(padding: EdgeInsets.all(25.0)),

          Text("Resultado:", style: TextStyle(color: Colors.green,fontSize: 20,),),

          Padding(padding: EdgeInsets.all(20.0)),

          Text(resultado, style: TextStyle(color: Colors.blue,fontSize: 20,),),
           Text(resultFinal, style: TextStyle(color: Colors.blue,fontSize: 20,),),
          ],),)
        
        ),
        
         

        bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Container(height: 50.0,),
            color: Colors.blue,
          ),

        floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: (){
          if(validacao.currentState.validate()){
            _calcular();
          }
        },
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}