package map.project.demo.Service;
import map.project.demo.Domain.Medication;
import map.project.demo.Repository.MedicationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class MedicationService {
    @Autowired
    private MedicationRepository medicationRepository;
    public List<Medication> listAll() {
        return (List<Medication>) medicationRepository.findAll();
    }


    public void save(Medication medication) {
        medicationRepository.save(medication);
    }

    public Medication get(Integer medicationID) {
        Optional<Medication> result = medicationRepository.findById(medicationID);
        if (result.isPresent()) {
            return result.get();
        }
        return null;
    }
    public void delete(Integer id) {
        medicationRepository.deleteById(id);
    }
    public int countByAdmin(String administrationRoute){
        return medicationRepository.countByAdministrationRoute(administrationRoute);
    }

}
