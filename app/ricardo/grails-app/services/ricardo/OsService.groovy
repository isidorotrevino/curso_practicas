package ricardo

import grails.gorm.services.Service

@Service(Os)
interface OsService {

    Os get(Serializable id)

    List<Os> list(Map args)

    Long count()

    void delete(Serializable id)

    Os save(Os os)

}