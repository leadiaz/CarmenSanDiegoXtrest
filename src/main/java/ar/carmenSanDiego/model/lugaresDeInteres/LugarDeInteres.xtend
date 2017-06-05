package ar.carmenSanDiego.model.lugaresDeInteres

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ar.carmenSanDiego.model.Pais
import ar.carmenSanDiego.model.Villano
import ar.carmenSanDiego.model.Caso
import ar.carmenSanDiego.model.CasoSimple

@Accessors
@Observable
  abstract class LugarDeInteres {
 		int id
		String nombrelugar
		Boolean informante = false  //Solo puede haber una persona en el lugar, es decir que solo un booleano puede ser true
		Boolean ocupante = false  
		Boolean cuidador = true
		String nombrePaisLugar 
		Villano vil = null // indica si el villano esta en el lugar de interes o no
		CasoSimple cas // esto sirve para dar las pistas sobre el plan de escape del villano
	new (){
		nombrelugar = ""
		nombrePaisLugar= ""
		id= 0
	}
	
	new (int ids, String p, String nombreL){
		nombrePaisLugar = p;
		id= ids
		nombrelugar = nombreL
	}
	//public enum nombreDeLugares{Embajada, Club, Biblioteca,Banco}
	
	def getCaso(){
			cas
		}
	def abstract String nombreLugar()
	def  hayInformante() {
			informante
		}

	def hayOcupante() {
			ocupante
		}

	def hayCuidador() {
			cuidador
		}
	def void setearInformante() {
			// setea un true para que halla un informante en el lugar de interes
			if (this.hayCuidador() || this.hayOcupante()){
				//System.out.println("Ya hay un individuo en el lugar" );
				this.cuidador=false;
				this.ocupante = false;
			}
		informante = true;		 
	}
		
	def void setearOcupante() {
			//setea un ocupante  que no es el villano  al lugar de interes 
			if (this.hayCuidador() || this.hayInformante()){
				//System.out.println("Ya hay un individuo en el lugar" );
				this.cuidador=false;
				this.informante = false
			}
		 this.ocupante = true;
			     
	}
		
	def void setearOcupante(Villano villano) {
			//setea un ocupante que puede es el villano   al lugar de interes 
			if (this.hayCuidador() || this.hayInformante()){
				//System.out.println("Ya hay un individuo en el lugar" );
				this.cuidador=false;
				this.informante = false
			}
		this.ocupante = true;
		 this.vil = villano
			     
	}

	def void setearCuidador() {
			//setea un true para que halla un cuidador al lugar de interes 
			if (this.hayInformante() || this.hayOcupante()){
				//System.out.println("Ya hay un individuo en el lugar" );
				this.informante = false
				this.ocupante = false;
			}
			this.cuidador = true;
			     
	}
	def String procesarCuidador() {
			//Prop: verifica si hay un cuidador en el lugar y procesar 
				"CUIDADOR: Te equivocaste de pais bato, mejor volve por donde viniste" 
		}
		def String procesarOcupante (){
			// si el villano esta en el lugar se lo detiene sino se le advierte al detective que el villano esta en la
			// ciudad
				if (vil== null ){
					"CUIDADO DETECTIVE! el villano esta en la ciudad" 
				    }else{
				    	  if(cas.ordenDeArrestoAlVillano == null){
				    	  	 "CUIDADO DETECTIVE!El villano escapo por no tener una orden de arresto"
				    	  }else{
				          "Alto!!"+cas.ordenDeArrestoAlVillano.nombre+" Queda Arrestado" 
				          	}
			             }
			}
						     
	def String procesarInformante();
	
	def void setearCaso(CasoSimple c){
		cas = c;
	}		
	def devolverPista(){
		/*if(nombrelugar == "Embajada"){
			"Vi a alguien sospechoso. Quiso cambiar su dinero a Euros. Me impresionó su auto convertible"
		}else{if(nombrelugar == "Club"){
			     "Vi a alguien sospechoso. Quiso cambiar su dinero a Euros,"
				}else{ if(nombrelugar == "Biblioteca"){
							"Vi a alguien sospechoso. Quiso cambiar su dinero a Euros.Me gusto mucho su pelo rojo"
						 }else{ "Vi a alguien sospechoso. Me encantaron sus sandalias color verde "}
					   
					}
			
			}*/
			if(this.hayCuidador()){
				this.procesarCuidador
			}else{if(this.hayOcupante){
					this.procesarOcupante
					
					}else{ this.procesarInformante}
				}
			
	}
	
}
	