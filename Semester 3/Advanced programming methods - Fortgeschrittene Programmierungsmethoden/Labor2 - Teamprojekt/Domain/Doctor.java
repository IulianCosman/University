package map.project.demo.Domain;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.ArrayList;
import java.util.List;


@Entity
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@Builder
@ToString
@Table (name = "doctors")
public class Doctor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int doctorID;
    private String name;
    private String firstName;
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private String birthdate;
    @ManyToOne(cascade = CascadeType.ALL)
    private Hospital hospital;
    @ManyToOne(cascade = CascadeType.ALL)
    private Specialization specialization;
    @ManyToOne(cascade = CascadeType.ALL)
    private Cabinet cabinet;
    @OneToMany(mappedBy = "doctor")
    private List<Consultation> consultations;

}
