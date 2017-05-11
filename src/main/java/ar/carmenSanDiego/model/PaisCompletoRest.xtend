package ar.carmenSanDiego.model

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import ar.gaston.carmenSanDiego.Pais
import java.util.List

@Accessors
@Observable

class PaisCompletoRest  {
 Integer id
 String nombre
	List <String> lugares
	List <PaisRest> conexiones
	
	new(){	} 
	
    new(Pais pais ){
    	this.id = pais.id
    	this.nombre = pais.nombrePais
    	lugares = pais.lugaresDeInteres.map[it.nombreLugar]
    	conexiones= pais.paisConexiones.map[new PaisRest(it)]
    }
	
	
	
}

	
	
