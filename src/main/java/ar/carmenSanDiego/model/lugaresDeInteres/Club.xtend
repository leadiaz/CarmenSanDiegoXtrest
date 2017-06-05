package ar.carmenSanDiego.model.lugaresDeInteres

import org.eclipse.xtend.lib.annotations.Accessors
import ar.carmenSanDiego.model.lugaresDeInteres.LugarDeInteres
import ar.carmenSanDiego.model.Pais
import ar.carmenSanDiego.model.RandomExamples

@Accessors
class Club extends LugarDeInteres{
	String primerCaracteristicaDELasSeñasParticulares
	String segundaCaracteristicaDELasSeñasParticulares
	
	new(int ids,String p,String nombreL) {
		super(ids,p,nombreL)
		super.nombrelugar= "Club"
	}
	
	new() {
	}
	
	override procesarInformante() {
			"Vi a alguien como describe!
            "+this.pistasRelacionadasConElDestinoDelVillano
	}
	def String pistasRelacionadasConElDestinoDelVillano(){
		this.caracteriscaDeLVillano()
		" recuerdo que la persona tenia estas señas: "+primerCaracteristicaDELasSeñasParticulares+" , "+ segundaCaracteristicaDELasSeñasParticulares+" 
		"+ this.darPistaAdicionalDeHobbies()  
		}
		
	def  void caracteriscaDeLVillano(){
		// inicializa en los valores:
		// "primerCaracteristicaDELasSeñasParticulares"con una caracteristicas random de las señas particulares del villano
		// "segundaCaracteristicaDELasSeñasParticulares" con una caracteristicas random de las señas particulares del villano
		val randomCarac = new RandomExamples()
		primerCaracteristicaDELasSeñasParticulares = randomCarac.randomIn(super.getCaso.getResponsable.getSenhasParticulares)
		segundaCaracteristicaDELasSeñasParticulares = randomCarac.randomIn(super.getCaso.getResponsable.getSenhasParticulares)
	}
	
	def String darPistaAdicionalDeHobbies() {
		//Esto retorna en un 70% de la veces una caracteristica ramdom de los hobbies del villano
		val randomCarac = new RandomExamples()
		val randomnumero = new RandomExamples()
		val int i = randomnumero.nextInt(3)
		if (i== 1 ||i== 2 ){// con este hacemos lo probabilidad del 70 % osea si es 1 o 2 entra al if sino sale
			return " Tambien recuerdo haberlo escuchado decir que uno de sus hobbies es "+randomCarac.randomIn(super.getCaso.getResponsable.getHobbies)
		}else{
				return ""
				
			}
	}		
	override nombreLugar() {
		return "Club"
	}
	
}
						