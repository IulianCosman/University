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

@Table (name = "medications")
public class Medication {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int medicationID;
    private String name;
    private String administrationRoute;
    private int storageAmount;
    private String expirationDate;
    @OneToMany(mappedBy = "medication", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Surgery> surgeries;
}
