package map.project.demo.Domain;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;
import map.project.demo.Domain.HealthCard;
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Table(name = "ECards")
public class ECard extends HealthCard {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int electronicID;
    @OneToOne
    @JoinColumn(name = "patientID")  // numele coloanei care face legatura
    private Patient patient;
    public ECard(String expirationDate, int pin) {
        super.setExpirationDate(expirationDate);
        super.setPin(pin);
    }

    @Override
    public String toString() {
        return "ECard{" +
                "electronicID=" + electronicID +
                ", expirationDate=" + getExpirationDate() +
                ", pin=" + getPin() +
                '}';
    }
}
