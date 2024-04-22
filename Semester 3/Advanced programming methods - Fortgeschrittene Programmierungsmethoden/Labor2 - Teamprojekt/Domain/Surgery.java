package map.project.demo.Domain;

import jakarta.persistence.*;
import lombok.*;
import map.project.demo.Compositekeys.PatientDoctorKey;
import org.springframework.format.annotation.DateTimeFormat;

@Getter
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Setter
@ToString

@Table (name = "surgeries")
public class Surgery {
    @EmbeddedId
    private PatientDoctorKey surgeryID;
    @ManyToOne
    @MapsId("patientID")
    @JoinColumn(name = "patientID")
    private Patient patient;
    @ManyToOne
    @MapsId("doctorID")
    @JoinColumn(name = "doctorID")
    private Doctor doctor;
    private String name;
    @ManyToOne(cascade = CascadeType.ALL)
    private Disease disease;
    @ManyToOne(cascade = CascadeType.ALL)
    private Medication medication;
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    String date;

}