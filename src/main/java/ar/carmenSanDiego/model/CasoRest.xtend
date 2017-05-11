package ar.carmenSanDiego.model

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import ar.gaston.carmenSanDiego.*

@Accessors
class CasoRest {
	int id
	Pais pais
	List<String> paisesVisitados = new ArrayList<String>();
	List<String> paisesFallidos = new ArrayList<String>();  
	
	new(int i, Pais p){
		id = i
		pais = p
	}
	def getId (){
		id
	}
	
	def getPais(){
		pais
	}
	
	def void setearPaisNuevo(Pais p) {
		if(!paisesVisitados.contains(pais.nombrePais)){
		paisesVisitados.add(pais.nombrePais)
		}
		pais = p
	}
}