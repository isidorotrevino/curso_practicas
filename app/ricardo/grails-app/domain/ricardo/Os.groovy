package ricardo

class Os {

	String nombre

    static constraints = {
    }
	
	static mapping = { 
		table 'os'
		version false
		id generator:'native', params:[sequence:'SEQ_OS']
	}
	String toString(){
		return nombre
	}
}
