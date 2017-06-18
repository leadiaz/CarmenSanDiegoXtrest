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
	List <LugarDeInteresRest> lugares
	List <PaisRest> conexiones
	
	new(){	} 
	
    new(Pais pais ){
    	this.id = pais.id
    	this.nombre = pais.nombrePais
   		lugares = pais.lugaresDeInteres.map[new LugarDeInteresRest (it)]
    	conexiones= pais.paisConexiones.map[new PaisRest(it)]
    }
	
	def procesarLugar(String lugar){
		for(LugarDeInteresRest l : this.lugares)
		{
			if(l.nombre == lugar){
				return l.pista
			}
		}
	}
	
	def actualizarPistaDadas(Pais pais) {
	   lugares = pais.lugaresDeInteres.map[new LugarDeInteresRest (it)]
	}
		
		
	
	
}

	
	
