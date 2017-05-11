package ar.carmenSanDiego.model

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import org.apache.commons.lang.StringUtils
import AplicationModel.Mapamundi
import ar.gaston.carmenSanDiego.Pais

@Accessors
class MapamundiRest {
	var Mapamundi mapamundi = new Mapamundi
	
	def setPais(Pais pais) {
		
		mapamundi.agregarNuevoPais(pais)
	}
	
	def getPais(int id) {
		(mapamundi.getPais(id))
	}
	
		def getPaisCompleto(int id) {
		new PaisCompletoRest(mapamundi.getPais(id))
	}
	
	
	def eliminarPais(int id) {
		mapamundi.eliminarPais(id)
	}
	def searchPaises(String substring) {
		mapamundi.searchPaises(substring).map[new PaisRest(it)]
	}
}