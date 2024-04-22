package map.project.demo.Repository;
import map.project.demo.Domain.Doctor;
import map.project.demo.Domain.Hospital;
import org.springframework.data.repository.CrudRepository;


public interface DoctorRepository extends CrudRepository<Doctor, Integer> {

}
