package ricardo

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class OsServiceSpec extends Specification {

    OsService osService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Os(...).save(flush: true, failOnError: true)
        //new Os(...).save(flush: true, failOnError: true)
        //Os os = new Os(...).save(flush: true, failOnError: true)
        //new Os(...).save(flush: true, failOnError: true)
        //new Os(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //os.id
    }

    void "test get"() {
        setupData()

        expect:
        osService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Os> osList = osService.list(max: 2, offset: 2)

        then:
        osList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        osService.count() == 5
    }

    void "test delete"() {
        Long osId = setupData()

        expect:
        osService.count() == 5

        when:
        osService.delete(osId)
        sessionFactory.currentSession.flush()

        then:
        osService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Os os = new Os()
        osService.save(os)

        then:
        os.id != null
    }
}
