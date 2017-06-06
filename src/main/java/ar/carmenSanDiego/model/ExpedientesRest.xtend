package ar.carmenSanDiego.model

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import org.apache.commons.lang.StringUtils
import AplicationModel.ExpedientesAppModel
import ar.gaston.carmenSanDiego.*

@Accessors
class ExpedientesRest {
	var ExpedientesAppModel expediente = new ExpedientesAppModel
	
	new(ExpedientesAppModel model) {
		expediente =  model
	}
	
	
	def setVillano(Villano vil) {
		expediente.eliminarVillano(vil.id)
		expediente.agregarNuevoVillano(vil)
//		eliminarVillano(vil.id) // Elimina un eventual duplicado con mismo id
//		villanos.add(vil)
	}
	
	 def actualizarVillano(Villano vil){
		expediente.actualizarVillano(vil)
	}
	def getVillano(int id) {
		/*new VillanoRest(*/expediente.getVillano(id)
//		villanos.findFirst[ it.getId == id ]
	}
	
	def eliminarVillano(int id) {
		expediente.eliminarVillano(id)
	}
	def searchVillanos(String substring) {
		expediente.searchVillanos(substring)//.map[new VillanoRest(it)]
		
	}
	
}