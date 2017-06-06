package ar.carmenSanDiego.model

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import ar.gaston.carmenSanDiego.*

@Accessors
class CasoRest {
	int id
	PaisCompletoRest pais
	List<String> paisesVisitados = new ArrayList<String>();
	List<String> paisesFallidos = new ArrayList<String>();  
	
	new (Caso c){
		this.id = c.id
		this.pais = new PaisCompletoRest(c.paisDelRobo)
	}
	new(int i, Pais p){
		id = i
		pais = new PaisCompletoRest(p)
	}
//	def getId (){
//		id
//	}
//	
	def getPais(){
		pais
	}
	
	def void agregarPaisFallido(String p){
		paisesFallidos.add(p)
	}
	
	def void agregarPaisesVisitados(String p){
		paisesVisitados.add(p)
	}
	def void setearPaisNuevo(Pais p) {
		if(!paisesVisitados.contains(pais.nombre)){
		paisesVisitados.add(pais.nombre)
		}
		pais =  new PaisCompletoRest(p)
	}
	
	def actualizarPista(Pais p) {
		pais.actualizarPistaDadas(p)
	}
	
}