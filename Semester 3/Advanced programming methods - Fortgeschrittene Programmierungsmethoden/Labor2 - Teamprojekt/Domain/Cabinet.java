package map.project.demo.Domain;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Getter
@Entity
@Setter
@NoArgsConstructor
@ToString
@Table(name = "cabinets")
public class Cabinet {
    public static Cabinet instance;
    private Cabinet(String name) {
        this.name = name;
    }
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int cabinetID;
    private String name;
    public static Cabinet getInstance() {
        if (instance == null) {
            instance = new Cabinet();
        }
        return instance;
    }
    @OneToMany(mappedBy = "cabinet", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Doctor> doctors;
}