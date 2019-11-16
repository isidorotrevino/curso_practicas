package ricardo

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class ModeloServiceSpec extends Specification {

    ModeloService modeloService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Modelo(...).save(flush: true, failOnError: true)
        //new Modelo(...).save(flush: true, failOnError: true)
        //Modelo modelo = new Modelo(...).save(flush: true, failOnError: true)
        //new Modelo(...).save(flush: true, failOnError: true)
        //new Modelo(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //modelo.id
    }

    void "test get"() {
        setupData()

        expect:
        modeloService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Modelo> modeloList = modeloService.list(max: 2, offset: 2)

        then:
        modeloList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        modeloService.count() == 5
    }

    void "test delete"() {
        Long modeloId = setupData()

        expect:
        modeloService.count() == 5

        when:
        modeloService.delete(modeloId)
        sessionFactory.currentSession.flush()

        then:
        modeloService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Modelo modelo = new Modelo()
        modeloService.save(modelo)

        then:
        modelo.id != null
    }
}
