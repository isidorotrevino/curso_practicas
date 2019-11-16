package ricardo

class Servicio {

	String fechaEntrega
	String serie
	String apertura
	String fechaInstalacion
	String garantia
	String mantenimiento
	String capacitacion
	String entregaEquipo
	String visita
	Empresa empresa
	Hospital hospital
	Equipo equipo
	Marca marca
	Modelo modelo
	Os os
	Ingeniero ingeniero

    static constraints = {
    }
	static mapping = {
		table 'servicio'
		version false
		id generator:'native', params:[sequence:'SEQ_SERVICIO']
		empresa column:'id_empresa'
		hospital column:'id_hospital'
		equipo column:'id_equipo'
		marca column:'id_marca'
		modelo column:'id_modelo'
		os column:'id_os'
		ingeniero column:'id_ingeniero'
	}
}
