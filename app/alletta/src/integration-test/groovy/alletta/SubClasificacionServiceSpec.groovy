package alletta

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class SubClasificacionServiceSpec extends Specification {

    SubClasificacionService subClasificacionService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new SubClasificacion(...).save(flush: true, failOnError: true)
        //new SubClasificacion(...).save(flush: true, failOnError: true)
        //SubClasificacion subClasificacion = new SubClasificacion(...).save(flush: true, failOnError: true)
        //new SubClasificacion(...).save(flush: true, failOnError: true)
        //new SubClasificacion(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //subClasificacion.id
    }

    void "test get"() {
        setupData()

        expect:
        subClasificacionService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<SubClasificacion> subClasificacionList = subClasificacionService.list(max: 2, offset: 2)

        then:
        subClasificacionList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        subClasificacionService.count() == 5
    }

    void "test delete"() {
        Long subClasificacionId = setupData()

        expect:
        subClasificacionService.count() == 5

        when:
        subClasificacionService.delete(subClasificacionId)
        sessionFactory.currentSession.flush()

        then:
        subClasificacionService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        SubClasificacion subClasificacion = new SubClasificacion()
        subClasificacionService.save(subClasificacion)

        then:
        subClasificacion.id != null
    }
}
