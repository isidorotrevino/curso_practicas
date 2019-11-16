package ricardo

class Ingeniero {

	String nombre

    static constraints = {
    }
	static mapping = {
		table 'ingeniero'
		version false
		id generator:'native', params:[sequence:'SEQ_INGENIERO']
	}
	String toString(){
		return nombre
	}
}
