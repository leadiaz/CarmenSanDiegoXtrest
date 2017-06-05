package ar.carmenSanDiego.model.lugaresDeInteres

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import ar.carmenSanDiego.model.lugaresDeInteres.LugarDeInteres
import ar.carmenSanDiego.model.RandomExamples
import ar.carmenSanDiego.model.PaisSimple

@Accessors
class Biblioteca extends LugarDeInteres{
	PaisSimple paisProximoDestino
	String CaracteristicaDelPaisDestino
	String CaracteristicaDELasSeñasParticulares
	
	new(int ids,String p ,String nombreL) {
		super(ids,p,nombreL)
		super.nombrelugar= "Biblioteca"	
	}
	
	new() {
	}
	
	override String  procesarInformante() {
		this.paisRandomDelDestino()
		if(paisProximoDestino.caracteristicasDelPais.size == 0){
			return "NO HAY CARACTERISTICAS EN EL  PAIS"}else{
		"Vi a alguien como describe!"+this.pistasRelacionadasConElDestinoDelVillano
		}
	}
	
	def String pistasRelacionadasConElDestinoDelVillano(){
		//this.paisRandomDelDestino()
		this.caracteriscaDeLPaisDetinoRandom()
		"creo haber oido que tenia planeado ir 
         a un pais con las siguientes caracteristicas: "+CaracteristicaDelPaisDestino+" . 
         "+"Ademas recuerdo que la persona tenia estas señas: "+ CaracteristicaDELasSeñasParticulares+ " .
         "+ this.darPistaAdicionalDeHobbies() 
		}
	
	def String darPistaAdicionalDeHobbies() {
		//Esto retorna en un 50% de la veces una caracteristica ramdom de los hobbies del villano
		val randomCarac = new RandomExamples()
		val randomnumero = new RandomExamples()
		if (randomnumero.nextInt(2)== 1){// con esto hacemos la probabilidad del 50% osea si es 1 entra al if sino sale 
			return " tambien recuerdo haberlo escuchado dicir que uno de sus hobbies es  "+randomCarac.randomIn(super.getCaso.getResponsable.getHobbies)
		}else{
				return ""
				
			}
	}
	
	def  void caracteriscaDeLPaisDetinoRandom(){
		// inicializa en los valores "CaracteristicaDelPaisDestino"con una caracteristica random del pais proximo pais del plan de escape del villano
		// "CaracteristicaDELasSeñasParticulares" caracteristicas random de las señas particulares del villano
		val randomCarac = new RandomExamples()
		CaracteristicaDelPaisDestino = randomCarac.randomIn(paisProximoDestino.caracteristicasDelPais)
		CaracteristicaDELasSeñasParticulares = randomCarac.randomIn(super.getCaso.getResponsable.getSenhasParticulares)
	}
	def paisRandomDelDestino (){
		//obtiene el proximo pais del plan de escape 
		paisProximoDestino = this.sacarElProximoDestinoDelPlanDeEscape(super.nombrePaisLugar, super.getCaso.planDeEscape)
	}
	
	def PaisSimple sacarElProximoDestinoDelPlanDeEscape(String nombrePais, List<PaisSimple> planDeEscape) { 
		// obtiene el pais siguiente del plan de escape desde el pais donde estoy parado  
		for(var int i = 0 ;i <= planDeEscape.size; i++){	
			if(planDeEscape.get(i).nombrePais == nombrePais ){
			return planDeEscape.get(i+1)
			}
		}	
	 }		
	override nombreLugar() {
		return "Biblioteca"
	}
	
}
		