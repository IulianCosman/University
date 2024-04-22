package map.project.demo.Domain;

import jakarta.persistence.*;
import lombok.*;

@Table(name="PCards")
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter

public class PaperCard extends HealthCard {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int writtenID;
    @OneToOne
    @JoinColumn(name = "patientID")  // numele coloanei care face legatura
    private Patient patient;
    public PaperCard(String expirationDate, int pin) {
        super.setExpirationDate(expirationDate);
        super.setPin(pin);
    }

    @Override
    public String toString() {
        return "PaperCard{" +
                "writtenID=" + writtenID +
                "expirationDate=" + getExpirationDate() +
                "pin=" + getPin() +
                '}';
    }

}
