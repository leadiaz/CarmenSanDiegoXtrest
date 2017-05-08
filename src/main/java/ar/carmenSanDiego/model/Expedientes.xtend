package ar.carmenSanDiego.model

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import org.apache.commons.lang.StringUtils

@Accessors
class Expedientes {
	var ArrayList<Villano> villanos = new ArrayList
	
	
	def setVillano(Villano vil) {
		eliminarVillano(vil.id) // Elimina un eventual duplicado con mismo id
		villanos.add(vil)
	}
	
	def getVillano(int id) {
		villanos.findFirst[ it.getId == id ]
	}
	
	def eliminarVillano(Integer id) {
        villanos.removeIf[ it.getId == id ]
	}
	def searchVillanos(String substring) {
		if (StringUtils.isBlank(substring)) {
			this.villanos
		} else {
			this.villanos.filter[ it.getNombre.toLowerCase.contains(substring.toLowerCase) ].toList			
		}
	}
	
}