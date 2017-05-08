package ar.carmenSanDiego.model

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import org.apache.commons.lang.StringUtils

@Accessors
class Mapamundi {
	var ArrayList<Pais> paises = new ArrayList
	
	def setPais(Pais p) {
		eliminarPais(p.id) // Elimina un eventual duplicado con mismo id
		paises.add(p)
	}
	
	def getPais(int id) {
		paises.findFirst[ it.getId == id ]
	}
	
	def eliminarPais(Integer id) {
        paises.removeIf[ it.getId == id ]
	}
	def searchPaises(String substring) {
		if (StringUtils.isBlank(substring)) {
			this.paises
		} else {
			this.paises.filter[ it.getNombrePais.toLowerCase.contains(substring.toLowerCase) ].toList			
		}
	}
}