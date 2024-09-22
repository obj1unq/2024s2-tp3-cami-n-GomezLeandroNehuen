import cosas.*

object camion {
	const property cosas = #{}
		
	method cargar(unaCosa) {
		cosas.add(unaCosa)
		unaCosa.reaccionar()
	}

	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}

	method todoPesoPar() {
		return cosas.forAll { cosa => cosa.peso() % 2 == 0 }
	}

	method hayAlgunoQuePesa(peso) {
		return cosas.forAll { cosa => cosa.peso() == peso }
	}

	method elDeNivel(nivel) {
		return cosas.find { cosa => cosa.nivelPeligrosidad() == nivel }
	}

	method pesoTotal() {
		return 1000 + cosas.sum { cosa => cosa.peso() }
	}

	method excedidoDePeso() {
		return self.pesoTotal() > 2500
	}

	method objetosQueSuperanPeligrosidad(nivel) {
		return cosas.filter { cosa => cosa.nivelPeligrosidad() > nivel }
	}

	method objetosMasPeligrososQue(cosa) {
		return cosas.filter { unaCosa => unaCosa.nivelPeligrosidad() > cosa.nivelPeligrosidad() }
	}

	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return not self.excedidoDePeso() and cosas.forAll { cosa => cosa.nivelPeligrosidad() <= nivelMaximoPeligrosidad }
	}


	 method tieneAlgoQuePesaEntre(min, max) {
        return cosas.exists { cosa => cosa.peso() >= min and cosa.peso() <= max }
    }

    method cosaMasPesada() {
        return cosas.max { cosa => cosa.peso() }
    }

    method pesos() {
        return cosas.map { cosa => cosa.peso() }
    }

    method totalBultos() {
        return cosas.sum { cosa => cosa.bultos() }
    }
}


