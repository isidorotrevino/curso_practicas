package ricardo

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class ModeloController {

    ModeloService modeloService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond modeloService.list(params), model:[modeloCount: modeloService.count()]
    }

    def show(Long id) {
        respond modeloService.get(id)
    }

    def create() {
        respond new Modelo(params)
    }

    def save(Modelo modelo) {
        if (modelo == null) {
            notFound()
            return
        }

        try {
            modeloService.save(modelo)
        } catch (ValidationException e) {
            respond modelo.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'modelo.label', default: 'Modelo'), modelo.id])
                redirect modelo
            }
            '*' { respond modelo, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond modeloService.get(id)
    }

    def update(Modelo modelo) {
        if (modelo == null) {
            notFound()
            return
        }

        try {
            modeloService.save(modelo)
        } catch (ValidationException e) {
            respond modelo.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'modelo.label', default: 'Modelo'), modelo.id])
                redirect modelo
            }
            '*'{ respond modelo, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        modeloService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'modelo.label', default: 'Modelo'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'modelo.label', default: 'Modelo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
