object knightRider {
	
	method peso() { 
		return 500 
	}

	method nivelPeligrosidad() { 
		return 10 
	}

	method bultos() {
		return 1 
	}

	 method reaccionar() { 
		// No hace nada . No se si tengo que poner algo más. 
	 }
}

object bumblebee {
	
	var property estado = auto 

	method peso() { 
		return 800 
	}

	method bultos() {
		return 2
	}

	method reaccionar() {
		estado = robot
    }
}


object robot {
	
	method nivelPeligrosidad() {
		return  30
	} 

}

object  auto {
   
   method nivelPeligrosidad() {
		return  15
	}
}


object paqueteDeLadrillos {
	
	var property cantidadLadrillos = 0

	method peso() {
		return cantidadLadrillos * 2
	}

	method nivelPeligrosidad() {
		return 2
	}

	method bultos() { // usé if porque no se me ocurrió otra cosa. Sé que está mal :(
        if (cantidadLadrillos <= 100) {
            return 1
        } else if (cantidadLadrillos <= 300) {
            return 2
        } else {
            return 3
		}
	}
	
	method reaccionar() {
        cantidadLadrillos += 12
    }

}

object arenaAGranel {
  	
	var property peso = 0

	method peso() {
		return peso
	}

	method nivelPeligrosidad() {
		return 1
	}

	method bultos() {
        return 1
    }

	method reaccionar() {
        peso += 20
    }
}

object bateriaAntiaerea { 
	var estado = descargado

	method peso() {
		return estado.peso()
	}

	method nivelPeligrosidad() {
		return estado.nivelPeligro()
	}

	method estado(_estado) {
		estado = _estado
	}

	method bultos() {
		return estado.bulto()
	}

	method reaccionar() {
		estado = cargado
	}
}

object cargado {
	
	method peso() {
		return 300
	}

	method nivelPeligro() {
	  return 100
	}

	method bulto() {
		return 2
	}
}

object descargado {
	
	method peso() {
		return 200
	}

	method nivelPeligro() {
		return 0
	}

	method bulto() {
		return 1
	}
}

object contenedorPortuario {
    
	var property  cosasDentro = #{} 

    method peso() {
        return 100 + cosasDentro.sum { cosa => cosa.peso() } 
    }

    method nivelPeligrosidad() {
        if (cosasDentro.isEmpty()) {
            return 0 
        } else {
            return cosasDentro.max { cosa => cosa.nivelPeligrosidad() } 
        }
    }

	method bultos() {
        return 1 + cosasDentro.sum { cosa => cosa.bultos() }
    }

	method reaccionar() {
        cosasDentro.forEach { cosa => cosa.reaccionar() } // Revisar.
    }

}

object residuosRadioactivos {

    var property pesoVariable = 0

    method peso() {
        return pesoVariable 
    }

    method nivelPeligrosidad() {
        return 200 
    }

	method bultos() {
        return 1
    }

	method reaccionar() {
        pesoVariable += 15
    }
}


object embalajeDeSeguridad {
    // No pude con este.
}

// Falta la última parte de Transporte. 