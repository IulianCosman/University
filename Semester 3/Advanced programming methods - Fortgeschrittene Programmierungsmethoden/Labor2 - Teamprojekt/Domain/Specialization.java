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

@Table (name = "specializations")
public class Specialization {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int specializationID;
    private String name;
    @OneToMany(mappedBy = "specialization", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Doctor> doctors;
}