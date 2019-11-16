package alletta

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class SubClasificacionController {

    SubClasificacionService subClasificacionService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond subClasificacionService.list(params), model:[subClasificacionCount: subClasificacionService.count()]
    }

    def show(Long id) {
        respond subClasificacionService.get(id)
    }

    def create() {
        respond new SubClasificacion(params)
    }

    def save(SubClasificacion subClasificacion) {
        if (subClasificacion == null) {
            notFound()
            return
        }

        try {
            subClasificacionService.save(subClasificacion)
        } catch (ValidationException e) {
            respond subClasificacion.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'subClasificacion.label', default: 'SubClasificacion'), subClasificacion.id])
                redirect subClasificacion
            }
            '*' { respond subClasificacion, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond subClasificacionService.get(id)
    }

    def update(SubClasificacion subClasificacion) {
        if (subClasificacion == null) {
            notFound()
            return
        }

        try {
            subClasificacionService.save(subClasificacion)
        } catch (ValidationException e) {
            respond subClasificacion.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'subClasificacion.label', default: 'SubClasificacion'), subClasificacion.id])
                redirect subClasificacion
            }
            '*'{ respond subClasificacion, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        subClasificacionService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'subClasificacion.label', default: 'SubClasificacion'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'subClasificacion.label', default: 'SubClasificacion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
