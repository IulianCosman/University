package map.project.demo.Domain;
import jakarta.persistence.*;
import lombok.*;
import map.project.demo.Iterator.PatientIterator;
import map.project.demo.Observers.Observer;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.ArrayList;
import java.util.List;

@Getter
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Setter
@ToString

@Table (name = "patients")
public class Patient{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int patientID;
    private String name;
    private String firstName;
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private String birthdate;


    @OneToOne(mappedBy = "patient", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private ECard eCard;

    @OneToOne(mappedBy = "patient", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private PaperCard paperCard;

    @OneToMany(mappedBy = "patient",fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Consultation> consultations;

}