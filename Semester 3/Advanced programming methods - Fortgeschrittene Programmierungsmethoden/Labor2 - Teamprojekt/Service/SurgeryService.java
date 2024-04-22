package map.project.demo.Service;

import map.project.demo.Compositekeys.PatientDoctorKey;
import map.project.demo.Domain.Surgery;
import map.project.demo.Repository.SurgeryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SurgeryService {
    @Autowired
    private SurgeryRepository surgeryRepository;

    public List<Surgery> listAll() {
        return (List<Surgery>) surgeryRepository.findAll();
    }

    public void save(Surgery surgery) {
        surgeryRepository.save(surgery);
    }

    public Surgery get(PatientDoctorKey key) {
        Optional<Surgery> result = surgeryRepository.findBySurgeryID(key);
        return result.orElse(null);
    }

    public void delete(PatientDoctorKey key) {
        surgeryRepository.deleteBySurgeryID(key);
    }
}
