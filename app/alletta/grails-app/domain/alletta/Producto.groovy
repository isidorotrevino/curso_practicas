package alletta

class Producto {

	String nombre
	BigDecimal precio
	SubClasificacion subClasificacion
	Catalogo material
	Catalogo tecnica
	Catalogo tamano
	Catalogo color
	Catalogo genero

    static constraints = {
		nombre nullable:true
		precio nullable:true
		subClasificacion nullable:true
		material nullable:true
		tecnica nullable:true
		tamano nullable:true
		color nullable:true
		genero nullable:true
    }
	static mapping = {
		table 'producto'
		version false
		id generator:'native', params:[sequence:'SEQ_PRODUCTO']
	}
	String toString(){
		return nombre
	}
}
