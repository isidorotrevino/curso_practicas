package ricardo

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class ServicioController {

    ServicioService servicioService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond servicioService.list(params), model:[servicioCount: servicioService.count()]
    }

    def show(Long id) {
        respond servicioService.get(id)
    }

    def create() {
        respond new Servicio(params)
    }

    def save(Servicio servicio) {
        if (servicio == null) {
            notFound()
            return
        }

        try {
            servicioService.save(servicio)
        } catch (ValidationException e) {
            respond servicio.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'servicio.label', default: 'Servicio'), servicio.id])
                redirect servicio
            }
            '*' { respond servicio, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond servicioService.get(id)
    }

    def update(Servicio servicio) {
        if (servicio == null) {
            notFound()
            return
        }

        try {
            servicioService.save(servicio)
        } catch (ValidationException e) {
            respond servicio.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'servicio.label', default: 'Servicio'), servicio.id])
                redirect servicio
            }
            '*'{ respond servicio, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        servicioService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'servicio.label', default: 'Servicio'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'servicio.label', default: 'Servicio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
