package map.project.demo.Tests;

import map.project.demo.Domain.Cabinet;
import map.project.demo.Domain.Disease;
import map.project.demo.Domain.Patient;
import map.project.demo.Repository.CabinetRepository;
import map.project.demo.Repository.DiseaseRepository;
import map.project.demo.Repository.PatientRepository;
import map.project.demo.Service.CabinetService;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Optional;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

@SpringBootTest
public class TesteSpring {
    @Autowired private PatientRepository repository;

    @Autowired private DiseaseRepository diseaseRepository;

    @Test
    public void testAddNew() {

        Patient patient = new Patient();
        patient.setBirthdate("2002-12-31");
        patient.setFirstName("Alex");
        patient.setName("Stevenson");
        patient.setCardID(16);

        Patient savedUser = repository.save(patient);

        Assertions.assertThat(savedUser).isNotNull();
        Assertions.assertThat(savedUser.getPatientID()).isGreaterThan(0);
    }

    @Test
    public void testDelete() {
        Integer userId = 3012;
        repository.deleteById(userId);

        Optional<Patient> optionalUser = repository.findById(userId);
        Assertions.assertThat(optionalUser).isNotPresent();
    }

    @Test
    public void testListAll() {
        Iterable<Patient> patients = repository.findAll();
        Assertions.assertThat(patients).hasSizeGreaterThan(0);
        for (Patient patient : patients) {
            System.out.println(patient);
        }
    }

    @Test
    public void testAdd2() {
        Disease disease = new Disease();
        disease.setName("test");
        Disease savedUser = diseaseRepository.save(disease);
        Assertions.assertThat(savedUser).isNotNull();
        Assertions.assertThat(savedUser.getDiseaseID()).isGreaterThan(0);
    }

    @Test
    public void testDelete2() {
        Integer userId = 7002;
        diseaseRepository.deleteById(userId);

        Optional<Disease> optionalUser = diseaseRepository.findById(userId);
        Assertions.assertThat(optionalUser).isNotPresent();
    }

}
