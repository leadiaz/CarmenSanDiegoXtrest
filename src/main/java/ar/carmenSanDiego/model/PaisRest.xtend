package ar.carmenSanDiego.model


import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import ar.gaston.carmenSanDiego.Pais
import java.util.ArrayList
import java.util.List

@Accessors
@Observable
class PaisRest {
	Integer id
	String nombre
//	List <String> lugares = new ArrayList<String>
			
	new(){	} 
	
    new(Pais pais ){
    	this.id = pais.id
    	this.nombre = pais.nombrePais
//    	this.lugares = pais.lugaresDeInteres.map[it.nombreLugar]
	}
	
	
	
}

