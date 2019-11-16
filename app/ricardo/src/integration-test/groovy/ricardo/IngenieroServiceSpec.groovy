package ricardo

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class IngenieroServiceSpec extends Specification {

    IngenieroService ingenieroService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Ingeniero(...).save(flush: true, failOnError: true)
        //new Ingeniero(...).save(flush: true, failOnError: true)
        //Ingeniero ingeniero = new Ingeniero(...).save(flush: true, failOnError: true)
        //new Ingeniero(...).save(flush: true, failOnError: true)
        //new Ingeniero(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //ingeniero.id
    }

    void "test get"() {
        setupData()

        expect:
        ingenieroService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Ingeniero> ingenieroList = ingenieroService.list(max: 2, offset: 2)

        then:
        ingenieroList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        ingenieroService.count() == 5
    }

    void "test delete"() {
        Long ingenieroId = setupData()

        expect:
        ingenieroService.count() == 5

        when:
        ingenieroService.delete(ingenieroId)
        sessionFactory.currentSession.flush()

        then:
        ingenieroService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Ingeniero ingeniero = new Ingeniero()
        ingenieroService.save(ingeniero)

        then:
        ingeniero.id != null
    }
}
