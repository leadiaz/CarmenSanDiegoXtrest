package ar.carmenSanDiego.model

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import ar.gaston.carmenSanDiego.Villano

@Accessors
class VillanoRest {
	int id 
	String nombre 
	String sexo
	List <String> senhasParticulares = new ArrayList<String>()
    List<String> hobbies = new ArrayList<String>()
	   
     new() {

	} 	
	new(Villano villano) {
		this.id = villano.id
		this.nombre = villano.nombre
		this.sexo = villano.sexo
		this.senhasParticulares = villano.señasParticulares
		this.hobbies = villano.hobbies
		
	}	
}