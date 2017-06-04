package ar.carmenSanDiego.model

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Villano {
	int id
	String nombre
	String sexo
    List <String> senhasParticulares = new ArrayList<String>()
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
    
       new(int ids,String n){
    	id = ids
    	nombre = n
    }
    
    def void agregarSeña(String seña){
    	
    	senhasParticulares.add(seña);
    }
    
    def void sacarSeña(String seña){
    	senhasParticulares.remove(seña)
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