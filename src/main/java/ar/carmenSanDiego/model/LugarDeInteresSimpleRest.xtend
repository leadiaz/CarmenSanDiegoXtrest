package ar.carmenSanDiego.model

import ar.gaston.carmenSanDiego.LugarDeInteres
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class LugarDeInteresSimpleRest {
		String nombre
		
	new (){}
	
	new (LugarDeInteres l){
		nombre = l.nombreLugar
	}
	new (String l){
		nombre = l
	}
}