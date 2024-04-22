package map.project.demo.Service;

import map.project.demo.Domain.Doctor;
import map.project.demo.Domain.Patient;
import map.project.demo.Iterator.PatientIterator;
import map.project.demo.Repository.PatientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import map.project.demo.Domain.PatientIteratorImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class PatientService {

    @Autowired
    private PatientRepository patientRepository;

    public List<Patient> listAll() {
        return (List<Patient>) patientRepository.findAll();
    }


    public void save(Patient patient) {
        patientRepository.save(patient);
    }


    public Patient get(Integer patientID) {
        Optional<Patient> result = patientRepository.findById(patientID);
        if (result.isPresent()) {
            return result.get();
        }
        return null;
    }

    public void delete(Integer id) {
        patientRepository.deleteById(id);
    }

    public PatientIterator<Patient> createIterator(){
        Iterable<Patient> patients = patientRepository.findAll();
        PatientIteratorImpl iterator = new PatientIteratorImpl(patients);
        return iterator;
    }
}
