package ricardo

class Marca {

	String nombre

    static constraints = {
    }
	static mapping = {
		table 'marca'
		version false
		id generator:'native', params:[sequence:'SEQ_MARCA']
	}
	String toString(){
		return nombre
	}
}
