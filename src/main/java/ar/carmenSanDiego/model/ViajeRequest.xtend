package ar.carmenSanDiego.model

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class ViajeRequest {
	int destinoId
	
	new (){
   	destinoId = 0
   }
   
   new (int destId){
		destinoId = destId
   }
   
   def getDestinoId(){
   		destinoId
   }
}