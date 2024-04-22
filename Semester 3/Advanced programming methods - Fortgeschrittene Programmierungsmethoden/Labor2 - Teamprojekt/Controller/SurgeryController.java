package map.project.demo.Controller;

import map.project.demo.Compositekeys.PatientDoctorKey;
import map.project.demo.Domain.Surgery;
import map.project.demo.Service.SurgeryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class SurgeryController {
    @Autowired
    private SurgeryService service;

    @PostMapping("/addSurgery")
    public String add(@RequestBody Surgery surgery) {
        service.save(surgery);
        return "Added successfully.";
    }

    @GetMapping("/findSurgery/{patientID}/{doctorID}")
    public Surgery findSurgeryByIdentifier(
            @PathVariable int patientID,
            @PathVariable int doctorID
    ) {
        PatientDoctorKey key = new PatientDoctorKey(patientID, doctorID);
        return service.get(key);
    }

    @GetMapping("/getAllSurgeries")
    public List<Surgery> getAll() {
        return service.listAll();
    }

    @GetMapping("/printAllSurgeries")
    public String printAll() {
        List<Surgery> surgeries = service.listAll();
        surgeries.forEach(surgery -> System.out.println(surgery.toString()));
        return "Printed.";
    }

    @DeleteMapping("/deleteSurgery/{patientID}/{doctorID}")
    public String delete(
            @PathVariable int patientID,
            @PathVariable int doctorID
    ) {
        PatientDoctorKey key = new PatientDoctorKey(patientID, doctorID);
        Surgery surgery = service.get(key);
        if (surgery != null) {
            service.delete(key);
            return "Deleted successfully.";
        } else {
            throw new IllegalArgumentException("Nothing was found for the provided identifier.");
        }
    }

    @PutMapping("/updateSurgery/{patientID}/{doctorID}")
    public String update(
            @PathVariable int patientID,
            @PathVariable int doctorID,
            @RequestBody Surgery newObject
    ) {
        PatientDoctorKey key = new PatientDoctorKey(patientID, doctorID);
        Surgery existingSurgery = service.get(key);
        if (existingSurgery != null) {
            service.delete(key);
            service.save(newObject);
            return "Updated successfully.";
        } else {
            throw new IllegalArgumentException("Nothing was found for the provided identifier.");
        }
    }
}
