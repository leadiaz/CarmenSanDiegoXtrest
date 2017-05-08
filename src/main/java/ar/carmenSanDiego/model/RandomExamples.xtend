package ar.carmenSanDiego.model

import java.util.Random
import java.util.List
class RandomExamples {
	static val random = new Random
	
	def <T>randomIn(List<T> lista) {
		lista.get(random.nextInt(lista.size))
	}
	
	def  int nextInt(int i){
		return random.nextInt(i)
	}
}