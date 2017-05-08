package ar.carmenSanDiego.model

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Villano {
	int id
	String nombre
	String sexo
    List <String> señasParticulares = new ArrayList<String>()
    List<String> hobbies = new ArrayList<String>()
   
   
     new() {
		this.id = 0
		this.nombre = ""
		this.sexo = ""
	} 
   new(int ids,String n, String s ){
    	id = ids
    	nombre = n
    	sexo = s
    }
    
    def void agregarSeña(String seña){
    	
    	señasParticulares.add(seña);
    }
    
    def void sacarSeña(String seña){
    	señasParticulares.remove(seña)
    }
    
    def void agregarHobbie (String h){
    	
    	hobbies.add(h);
    }
      
    def sacarHobbie(String h){
    	hobbies.remove(h)
    }
	
	def getNombre() {
		nombre
	}
	
	def getId() {
		id
	}
	
}