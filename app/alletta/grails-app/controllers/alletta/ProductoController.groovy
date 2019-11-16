package alletta

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class ProductoController {

    ProductoService productoService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond productoService.list(params), model:[productoCount: productoService.count()]
    }

    def show(Long id) {
        respond productoService.get(id)
    }

    def create() {
        respond new Producto(params)
    }

    def save(Producto producto) {
        if (producto == null) {
            notFound()
            return
        }

        try {
            productoService.save(producto)
        } catch (ValidationException e) {
            respond producto.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'producto.label', default: 'Producto'), producto.id])
                redirect producto
            }
            '*' { respond producto, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond productoService.get(id)
    }

    def update(Producto producto) {
        if (producto == null) {
            notFound()
            return
        }

        try {
            productoService.save(producto)
        } catch (ValidationException e) {
            respond producto.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'producto.label', default: 'Producto'), producto.id])
                redirect producto
            }
            '*'{ respond producto, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        productoService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'producto.label', default: 'Producto'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'producto.label', default: 'Producto'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
