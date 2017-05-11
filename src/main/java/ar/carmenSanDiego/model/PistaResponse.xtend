package ar.carmenSanDiego.model

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class PistaResponse {
	String pista
	
	new() {
	 this.pista= ""
	}
	
	new(String pis){
		this.pista = pis
	} 
		 
	/*def void searchPista(Caso caso, String lugar) {
		pista = caso.getPais.precesarLugar(lugar)
	}*/
	
}