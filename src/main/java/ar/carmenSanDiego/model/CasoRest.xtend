package ar.carmenSanDiego.model

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import ar.gaston.carmenSanDiego.*

@Accessors
class CasoRest {
	int id
	PaisRest pais
	List<String> paisesVisitados = new ArrayList<String>();
	List<String> paisesFallidos = new ArrayList<String>();  
	
	new (Caso c){
		this.id = c.id
		this.pais = new PaisRest(c.paisDelRobo)
	}
	new(int i, Pais p){
		id = i
		pais = new PaisRest(p)
	}
//	def getId (){
//		id
//	}
//	
	def getPais(){
		pais
	}
	
	def void setearPaisNuevo(Pais p) {
		if(!paisesVisitados.contains(pais.nombre)){
		paisesVisitados.add(pais.nombre)
		}
		pais =  new PaisRest(p)
	}
}