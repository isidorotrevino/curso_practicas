package alletta

import grails.gorm.services.Service

@Service(SubClasificacion)
interface SubClasificacionService {

    SubClasificacion get(Serializable id)

    List<SubClasificacion> list(Map args)

    Long count()

    void delete(Serializable id)

    SubClasificacion save(SubClasificacion subClasificacion)

}