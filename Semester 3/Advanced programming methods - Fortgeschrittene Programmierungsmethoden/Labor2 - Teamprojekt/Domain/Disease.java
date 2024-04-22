package map.project.demo.Domain;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Getter
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Setter
@ToString

@Table(name = "diseases")
public class Disease {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int diseaseID;
    private String name;
    @OneToMany(mappedBy = "disease", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Consultation> consultations;
    @OneToMany(mappedBy = "disease", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Surgery> surgeries;
}