package map.project.demo.Service;

import map.project.demo.Domain.Doctor;

import map.project.demo.Domain.Hospital;
import map.project.demo.Repository.DoctorRepository;
import map.project.demo.Repository.HospitalRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class DoctorService {
    @Autowired
    private DoctorRepository doctorRepository;

    @Autowired
    public DoctorService(DoctorRepository doctorRepository) {
        this.doctorRepository = doctorRepository;
    }
    public List<Doctor> listAll() {
        return (List<Doctor>) doctorRepository.findAll();
    }

    public void save(Doctor doctor) {
        doctorRepository.save(doctor);
    }

    public Doctor get(Integer doctorID) {
        Optional<Doctor> result = doctorRepository.findById(doctorID);
        if (result.isPresent()) {
            return result.get();
        }
        return null;
    }
    public void delete(Integer id) {
        doctorRepository.deleteById(id);
    }
}
