package ar.carmenSanDiego.model

class PistaResponse {
	String pista
	
	new() {
	 this.pista= ""
	}
	
	new(String pis){
		pista = pis
	} 
		 
	/*def void searchPista(Caso caso, String lugar) {
		pista = caso.getPais.precesarLugar(lugar)
	}*/
	
}