package map.project.demo.Repository;
import map.project.demo.Compositekeys.PatientDoctorKey;
import map.project.demo.Domain.Surgery;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface SurgeryRepository extends CrudRepository<Surgery, Integer> {

    void deleteBySurgeryID(PatientDoctorKey key);

    Optional<Surgery> findBySurgeryID(PatientDoctorKey key);
}
