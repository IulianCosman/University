package map.project.demo.Service;

import map.project.demo.Domain.Doctor;
import map.project.demo.Domain.Specialization;
import map.project.demo.Repository.SpecializationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SpecializationService {
    @Autowired
    private SpecializationRepository specializationRepository;

    public List<Specialization> listAll() {
        return (List<Specialization>) specializationRepository.findAll();
    }

    public void save(Specialization specialization) {
        specializationRepository.save(specialization);
    }

    public Specialization get(Integer specializationID) {
        Optional<Specialization> result = specializationRepository.findById(specializationID);
        if (result.isPresent()) {
            return result.get();
        }
        return null;
    }

    public void delete(Integer id) {
        specializationRepository.deleteById(id);
    }
}
