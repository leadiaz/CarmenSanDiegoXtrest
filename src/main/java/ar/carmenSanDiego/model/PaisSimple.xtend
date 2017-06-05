package ar.carmenSanDiego.model

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class PaisSimple {
	String nombrePais
	List <String> caracteristicasDelPais = new ArrayList<String>()
	
	new(Pais p){
		nombrePais= p.nombrePais
		caracteristicasDelPais = p.caracteristicasDelPais
	}
}