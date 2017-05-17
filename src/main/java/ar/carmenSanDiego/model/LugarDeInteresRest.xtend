package ar.carmenSanDiego.model

import ar.gaston.carmenSanDiego.LugarDeInteres
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class LugarDeInteresRest {
	String nombre
	String pista
	
	new (){}
	
	new (LugarDeInteres l){
		nombre = l.nombreLugar
		pista = l.devolverPista
	}
	

}