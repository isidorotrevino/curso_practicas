package ricardo

class Modelo {

	String nombre

    static constraints = {
    }
	
	static mapping = {
		table 'modelo'
		version false
		id generator:'native', params:[sequence:'SEQ_MODELO']
	}
	String toString(){
		return nombre
	}
}
