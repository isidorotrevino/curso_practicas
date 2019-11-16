package ricardo

class Empresa {

	String nombre

    static constraints = {
    }
	static mapping = {
		table 'empresa'
		version false
		id generator:'native', params:[sequence:'SEQ_EMPRESA']
	}
	String toString(){
		return nombre
	}
}
