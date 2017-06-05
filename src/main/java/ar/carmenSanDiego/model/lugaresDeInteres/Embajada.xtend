package ar.carmenSanDiego.model.lugaresDeInteres


import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import ar.carmenSanDiego.model.lugaresDeInteres.LugarDeInteres
import ar.carmenSanDiego.model.RandomExamples
import ar.carmenSanDiego.model.PaisSimple

@Accessors
class Embajada extends LugarDeInteres { 
	PaisSimple paisProximoDestino
	String primerCaracteristicaDelPaisDestino
	String segundaCaracteristicaDelPaisDestino
	
	new(int ids,String p,String nombreL) {
		super(ids,p,nombreL)
		super.nombrelugar= "Embajada"
	}
	
	new() {
	}
	
	override procesarInformante() {
		this.paisRandomDelDestino()
			if(paisProximoDestino.caracteristicasDelPais.size == 0){
			return "NO HAY CARACTERISTICAS EN EL  PAIS"}else{
		"Vi a alguien como describe!"+this.pistasRelacionadasConElDestinoDelVillano
		}	
	}
	
	def String pistasRelacionadasConElDestinoDelVillano(){
		
		//this.paisRandomDelDestino()
		this.caracteriscaDeLPaisDetinoRandom()
		"creo haber oido que tenia planeado ir a 
         un pais con las siguientes caracteristicas: "+primerCaracteristicaDelPaisDestino+" , "+segundaCaracteristicaDelPaisDestino
		}
	override String nombreLugar() {
		return "Embajada"
	}
	
	def  void caracteriscaDeLPaisDetinoRandom(){
		// inicializa en los valores "primerCaracteristicaDelPaisDestino" y
		// "segundaCaracteristicaDelPaisDestino" caracteristicas random del proximo pais del plan de escape del villano
		val randomCaracPaisDestino = new RandomExamples()
		primerCaracteristicaDelPaisDestino = randomCaracPaisDestino.randomIn(paisProximoDestino.caracteristicasDelPais)
		segundaCaracteristicaDelPaisDestino = randomCaracPaisDestino.randomIn(paisProximoDestino.caracteristicasDelPais)
	}
	def paisRandomDelDestino (){
		//obtiene el proximo pais del plan de escape 
		paisProximoDestino = this.sacarElProximoDestinoDelPlanDeEscape(super.nombrePaisLugar, super.getCaso.planDeEscape)
	}
	
	def PaisSimple sacarElProximoDestinoDelPlanDeEscape(String nombrePais, List<PaisSimple> planDeEscape) { 
		// obtiene el pais siguiente del plan de escape desde el pais donde estoy parado  
		for(var int i = 0 ;i <= planDeEscape.size; i++){	
			if(planDeEscape.get(i).nombrePais ==nombrePais ){
			return planDeEscape.get(i+1)
			}
		}	
	 }
}
