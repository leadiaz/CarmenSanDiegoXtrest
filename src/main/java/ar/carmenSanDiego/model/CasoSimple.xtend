package ar.carmenSanDiego.model

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class CasoSimple {
	List<PaisSimple> planDeEscape = new ArrayList<PaisSimple>();
	Villano responsable
	Villano ordenDeArrestoAlVillano 
	


	new (Caso cas){
		planDeEscape= cas.planDeEscape
		responsable = cas.responsable
		ordenDeArrestoAlVillano = cas.ordenDeArrestoAlVillano
	}
	
}