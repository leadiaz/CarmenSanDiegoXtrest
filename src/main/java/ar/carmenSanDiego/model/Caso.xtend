package ar.carmenSanDiego.model

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Caso {
	int id
	Pais pais
	List<String> paisesVisitados = new ArrayList<String>();
	List<String> paisesFallidos = new ArrayList<String>();
	List<PaisSimple> planDeEscape = new ArrayList<PaisSimple>();
	Villano ordenDeArrestoAlVillano
	Villano responsable   
	
	new(int i, Pais p, Villano vilResponsable){
		id = i
		pais = p
		responsable = vilResponsable
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
	
	def setearOrdenDeArrestoAlVillano(Villano villano) {
		ordenDeArrestoAlVillano = villano
	}
	
	def agregarPaisPlanDeEscape(PaisSimple p){
		planDeEscape.add(p)
	}
}