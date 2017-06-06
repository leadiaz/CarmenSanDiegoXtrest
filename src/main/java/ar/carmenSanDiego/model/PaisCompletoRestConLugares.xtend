package ar.carmenSanDiego.model

import java.util.List
import ar.gaston.carmenSanDiego.Pais
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class PaisCompletoRestConLugares {
	int id
	String nombre
	List <String> caracteristicasDelPaisRest 
	List <LugarDeInteresSimpleRest> lugares
	List <PaisRest> conexiones
	
	new(){} 
	
    new(Pais pais ){
    	this.id = pais.id
    	this.nombre = pais.nombrePais
    	caracteristicasDelPaisRest = pais.caracteristicasDelPais
   		lugares = pais.lugaresDeInteres.map[new LugarDeInteresSimpleRest (it)]
    	conexiones= pais.paisConexiones.map[new PaisRest(it)]
    }
	
	}