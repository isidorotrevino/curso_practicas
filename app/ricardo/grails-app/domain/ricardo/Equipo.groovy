package ricardo

class Equipo {

	String nombre
	
    static constraints = {
    }
	static mapping = {
		table 'equipo'
		version false
		id generator:'native', params:[sequence:'SEQ_EQUIPO']
	}
	String toString(){
		return nombre
	}
}
