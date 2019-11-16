package ricardo

import grails.gorm.services.Service

@Service(Ingeniero)
interface IngenieroService {

    Ingeniero get(Serializable id)

    List<Ingeniero> list(Map args)

    Long count()

    void delete(Serializable id)

    Ingeniero save(Ingeniero ingeniero)

}