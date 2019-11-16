package alletta

class SubClasificacion {

	Catalogo clasificacion
	Catalogo ropa
	Catalogo accesorios
	Catalogo hogar
	Catalogo papeleria
	Catalogo ocasionesEspeciales

    static constraints = {
		clasificacion nullable:true
		ropa nullable:true
		accesorios nullable:true
		hogar nullable:true
		papeleria nullable:true
		ocasionesEspeciales nullable: true
    }
	static mapping = {
		table 'sub_clasificacion'
		version false
		id generator:'native', params:[sequence:'SEQ_SUB_CLASIFICACION']
	}
}
