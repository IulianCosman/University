package map.project.demo.Repository;
import map.project.demo.Domain.Medication;
import org.springframework.data.repository.CrudRepository;

public interface MedicationRepository extends CrudRepository<Medication, Integer> {
    int countByAdministrationRoute(String administrationRoute);
}
