package ar.carmenSanDiego.model

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import ar.gaston.carmenSanDiego.Villano

@Accessors
class VillanoRest {
	var Villano villano
   
     new() {

	} 	
	new(Villano villano) {
		this.villano = villano
	}	
	def getId() {
		villano.getId
	}
	
}