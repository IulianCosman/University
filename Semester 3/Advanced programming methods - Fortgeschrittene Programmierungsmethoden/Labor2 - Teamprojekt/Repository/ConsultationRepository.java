package map.project.demo.Repository;
import map.project.demo.Compositekeys.PatientDoctorKey;
import map.project.demo.Domain.Consultation;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface ConsultationRepository extends CrudRepository<Consultation, Integer> {
    void deleteByConsultationID(PatientDoctorKey key);

    Optional<Consultation> findByConsultationID(PatientDoctorKey key);
}
