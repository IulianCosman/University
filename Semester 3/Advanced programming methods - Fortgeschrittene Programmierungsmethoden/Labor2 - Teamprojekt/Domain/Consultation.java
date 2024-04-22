package map.project.demo.Domain;

import jakarta.persistence.*;
import lombok.*;
import map.project.demo.Compositekeys.PatientDoctorKey;
import org.springframework.format.annotation.DateTimeFormat;


@Entity
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString

@Table(name = "consultations")
public class Consultation{

    @EmbeddedId //id compus din mai multe coloane
    private PatientDoctorKey consultationID;
    @ManyToOne
    @MapsId("patientID")
    @JoinColumn(name = "patientID")
    private Patient patient;
    @ManyToOne
    @MapsId("doctorID")
    @JoinColumn(name = "doctorID")
    private Doctor doctor;
    private boolean card;
    private int price;
    @ManyToOne(cascade = CascadeType.ALL)
    private Disease disease;
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    String date;
//
//    private List<Observer> observers;
//
//    public Consultation() {
//        observers = new ArrayList<>();
//    }
//
//
//    public void addObserver(Observer observer) {
//        observers.add(observer);
//    }
//
//    public void removeObserver(Observer observer){
//        observers.remove(observer);
//    }
//
//
//    public void notifyObservers(){
//        for(Observer observer  : observers){
//            observer.updateObservers(this.patientID);
//        }
//    }
}
