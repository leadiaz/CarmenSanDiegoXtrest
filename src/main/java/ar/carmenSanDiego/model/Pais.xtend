package ar.carmenSanDiego.model

import java.util.ArrayList
import java.util.List
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.UserException
import ar.carmenSanDiego.model.lugaresDeInteres.LugarDeInteres

@Accessors
@Observable
class Pais {
	int id
	String nombrePais
	List <String> caracteristicasDelPais = new ArrayList<String>()
	List <Pais> paisConexiones = new ArrayList<Pais>()
	List<LugarDeInteres> lugaresDeInteres= new ArrayList<LugarDeInteres>() //limite son 3 lugares sin repetidos
	
	new() {
		this.id = 0
		this.nombrePais = ""
	} 
	
    new(int ids,String n ){
    	id = ids
    	nombrePais = n
    }
	
	def void agregarCaracteristica(String c){
		caracteristicasDelPais.add(c)
	}
	
	def sacarCaracteristica(String c){
		caracteristicasDelPais.remove(c)	
	}
	
	def void agregarPaisConexion(Pais p){
		paisConexiones.add(p)
	}
	
	def sacarPaisConexion(Pais p){
		paisConexiones.remove(p)
	}
	
	def void agregarLugarDeInteres(LugarDeInteres l){
		/*if (lugaresDeInteres.contains(l)||lugaresDeInteres.size == 3 ){
			throw new UserException("Error el lugar de interes "+ l.nombrelugar+ " ya esta en la lista" )
		   } 
		    else
		        {
		        lugaresDeInteres.add(l.nombrelugar)	
	            }
	       }*/
	     if (lugaresDeInteres.contains(l)||lugaresDeInteres.size == 3 ){
			throw new UserException("Error el lugar de interes "+ l.nombreLugar+ " ya esta en la lista" )
		   } 
		    else
		        {
		        lugaresDeInteres.add(l)	
	            } 
	       }
	      
	def sacarLugarDeInteres(LugarDeInteres l){
		lugaresDeInteres.remove(l)
	}
	def setearCasoAlugares(CasoSimple caso) {
		for( LugarDeInteres l: lugaresDeInteres){
				l.setearCaso(caso)
			}
	}
	
	/*def String precesarLugar(String lugar) {
		for(String l: lugaresDeInteres){
			if(l== lugar ){
				return (new LugarDeInteres(l)).devolverPista()
			}
		}
	}*/
	def procesarLugar(String lugar)
	{
		for(LugarDeInteres l : lugaresDeInteres)
		{
			if(l.nombreLugar == lugar)
			{
				return l.devolverPista
			}
		}
	}
	       
	/*        
	def setearCasoAlugares(Caso caso) {
		for( LugarDeInteres l: lugaresDeInteres){
				l.setearCaso(caso)
			}
	}*/
		
	
	
}

