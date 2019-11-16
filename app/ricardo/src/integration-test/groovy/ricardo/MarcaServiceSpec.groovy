package ricardo

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class MarcaServiceSpec extends Specification {

    MarcaService marcaService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Marca(...).save(flush: true, failOnError: true)
        //new Marca(...).save(flush: true, failOnError: true)
        //Marca marca = new Marca(...).save(flush: true, failOnError: true)
        //new Marca(...).save(flush: true, failOnError: true)
        //new Marca(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //marca.id
    }

    void "test get"() {
        setupData()

        expect:
        marcaService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Marca> marcaList = marcaService.list(max: 2, offset: 2)

        then:
        marcaList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        marcaService.count() == 5
    }

    void "test delete"() {
        Long marcaId = setupData()

        expect:
        marcaService.count() == 5

        when:
        marcaService.delete(marcaId)
        sessionFactory.currentSession.flush()

        then:
        marcaService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Marca marca = new Marca()
        marcaService.save(marca)

        then:
        marca.id != null
    }
}
