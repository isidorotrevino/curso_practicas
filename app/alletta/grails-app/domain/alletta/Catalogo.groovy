package alletta

class Catalogo {

	String clasificacion
	String clave
	String nombre

    static constraints = {
		clave nullable:true
		nombre nullable:true
    }
	static mapping = {
		table 'catalogo'
		version false
		id generator:'native', params:[sequence:'SEQ_CATALOGO']
	}
	String toString(){
		return "[${clave}] - ${nombre}"
	}
}
