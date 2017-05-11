package ar.carmenSanDiego.model


import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import ar.gaston.carmenSanDiego.Pais

@Accessors
@Observable
class PaisRest {
	Integer id
	String nombre
			
	new(){	} 
	
    new(Pais pais ){
    	this.id = pais.id
    	this.nombre = pais.nombrePais
    }
	
	
	
}

