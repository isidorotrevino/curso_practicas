package ricardo

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class IngenieroController {

    IngenieroService ingenieroService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ingenieroService.list(params), model:[ingenieroCount: ingenieroService.count()]
    }

    def show(Long id) {
        respond ingenieroService.get(id)
    }

    def create() {
        respond new Ingeniero(params)
    }

    def save(Ingeniero ingeniero) {
        if (ingeniero == null) {
            notFound()
            return
        }

        try {
            ingenieroService.save(ingeniero)
        } catch (ValidationException e) {
            respond ingeniero.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'ingeniero.label', default: 'Ingeniero'), ingeniero.id])
                redirect ingeniero
            }
            '*' { respond ingeniero, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond ingenieroService.get(id)
    }

    def update(Ingeniero ingeniero) {
        if (ingeniero == null) {
            notFound()
            return
        }

        try {
            ingenieroService.save(ingeniero)
        } catch (ValidationException e) {
            respond ingeniero.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ingeniero.label', default: 'Ingeniero'), ingeniero.id])
                redirect ingeniero
            }
            '*'{ respond ingeniero, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        ingenieroService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ingeniero.label', default: 'Ingeniero'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'ingeniero.label', default: 'Ingeniero'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
