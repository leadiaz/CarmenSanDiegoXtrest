package ar.carmenSanDiego.model.lugaresDeInteres

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
 class LugarDeInteres {
	String nombrelugar
	
	new (String n){
		nombrelugar = n
	}
	//public enum nombreDeLugares{Embajada, Club, Biblioteca,Banco}
	
	def devolverPista(){
		if(nombrelugar == "Embajada"){
			"Vi a alguien sospechoso. Quiso cambiar su dinero a Euros. Me impresionó su auto convertible"
		}else{if(nombrelugar == "Club"){
			     "Vi a alguien sospechoso. Quiso cambiar su dinero a Euros,"
				}else{ if(nombrelugar == "Biblioteca"){
							"Vi a alguien sospechoso. Quiso cambiar su dinero a Euros.Me gusto mucho su pelo rojo"
						 }else{ "Vi a alguien sospechoso. Me encantaron sus sandalias color verde "}
					   
					}
			
			}
	}
	
}
	