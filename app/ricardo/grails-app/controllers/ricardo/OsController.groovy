package ricardo

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class OsController {

    OsService osService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond osService.list(params), model:[osCount: osService.count()]
    }

    def show(Long id) {
        respond osService.get(id)
    }

    def create() {
        respond new Os(params)
    }

    def save(Os os) {
        if (os == null) {
            notFound()
            return
        }

        try {
            osService.save(os)
        } catch (ValidationException e) {
            respond os.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'os.label', default: 'Os'), os.id])
                redirect os
            }
            '*' { respond os, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond osService.get(id)
    }

    def update(Os os) {
        if (os == null) {
            notFound()
            return
        }

        try {
            osService.save(os)
        } catch (ValidationException e) {
            respond os.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'os.label', default: 'Os'), os.id])
                redirect os
            }
            '*'{ respond os, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        osService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'os.label', default: 'Os'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'os.label', default: 'Os'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
