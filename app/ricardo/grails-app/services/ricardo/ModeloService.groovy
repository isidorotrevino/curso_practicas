package ricardo

import grails.gorm.services.Service

@Service(Modelo)
interface ModeloService {

    Modelo get(Serializable id)

    List<Modelo> list(Map args)

    Long count()

    void delete(Serializable id)

    Modelo save(Modelo modelo)

}