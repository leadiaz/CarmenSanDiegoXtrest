package ar.carmenSanDiego.model

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class EmitirOrdenRequest {
   int villanoId
   int casoId
   
   new (){
   	villanoId = 0
   	casoId = 0
   }
   
   new (int vilId, int casId){
   	villanoId = vilId
   	casoId = casId
   }
}