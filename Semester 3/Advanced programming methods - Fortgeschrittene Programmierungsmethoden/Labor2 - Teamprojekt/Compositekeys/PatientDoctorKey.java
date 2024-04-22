package map.project.demo.Compositekeys;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

@Embeddable
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PatientDoctorKey implements Serializable {
    @Column (name="patientID")
    int patientID;
    @Column (name="doctorID")
    int doctorID;

}
