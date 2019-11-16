package ricardo

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class EquipoController {

    EquipoService equipoService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond equipoService.list(params), model:[equipoCount: equipoService.count()]
    }

    def show(Long id) {
        respond equipoService.get(id)
    }

    def create() {
        respond new Equipo(params)
    }

    def save(Equipo equipo) {
        if (equipo == null) {
            notFound()
            return
        }

        try {
            equipoService.save(equipo)
        } catch (ValidationException e) {
            respond equipo.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'equipo.label', default: 'Equipo'), equipo.id])
                redirect equipo
            }
            '*' { respond equipo, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond equipoService.get(id)
    }

    def update(Equipo equipo) {
        if (equipo == null) {
            notFound()
            return
        }

        try {
            equipoService.save(equipo)
        } catch (ValidationException e) {
            respond equipo.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'equipo.label', default: 'Equipo'), equipo.id])
                redirect equipo
            }
            '*'{ respond equipo, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        equipoService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'equipo.label', default: 'Equipo'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipo.label', default: 'Equipo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
