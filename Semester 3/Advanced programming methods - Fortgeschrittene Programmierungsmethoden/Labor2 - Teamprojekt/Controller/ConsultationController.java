package map.project.demo.Controller;

import map.project.demo.Compositekeys.PatientDoctorKey;
import map.project.demo.Domain.Consultation;
import map.project.demo.Service.ConsultationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class ConsultationController {
    @Autowired
    private ConsultationService service;

    @PostMapping("/addConsultation")
    public String add(@RequestBody Consultation consultation) {
        service.save(consultation);
        return "Added successfully.";
    }

    @GetMapping("/findConsultation/{patientID}/{doctorID}")
    public Consultation findConsultationByIdentifier(
            @PathVariable int patientID,
            @PathVariable int doctorID
    ) {
        PatientDoctorKey key = new PatientDoctorKey(patientID, doctorID);
        return service.get(key);
    }

    @GetMapping("/getAllConsultations")
    public List<Consultation> getAll() {
        return service.listAll();
    }

    @GetMapping("/printAllConsultations")
    public String printAll() {
        List<Consultation> consultations = service.listAll();
        consultations.forEach(consultation -> System.out.println(consultation.toString()));
        return "Printed.";
    }

    @DeleteMapping("/deleteConsultation/{patientID}/{doctorID}")
    public String delete(
            @PathVariable int patientID,
            @PathVariable int doctorID
    ) {
        PatientDoctorKey key = new PatientDoctorKey(patientID, doctorID);
        Consultation consultation = service.get(key);
        if (consultation != null) {
            service.delete(key);
            return "Deleted successfully.";
        } else {
            throw new IllegalArgumentException("Nothing was found for the provided identifier.");
        }
    }

    @PutMapping("/updateConsultation/{patientID}/{doctorID}")
    public String update(
            @PathVariable int patientID,
            @PathVariable int doctorID,
            @RequestBody Consultation newObject
    ) {
        PatientDoctorKey key = new PatientDoctorKey(patientID, doctorID);
        Consultation existingConsultation = service.get(key);
        if (existingConsultation != null) {
            service.delete(key);
            service.save(newObject);
            return "Updated successfully.";
        } else {
            throw new IllegalArgumentException("Nothing was found for the provided identifier.");
        }
    }
}
