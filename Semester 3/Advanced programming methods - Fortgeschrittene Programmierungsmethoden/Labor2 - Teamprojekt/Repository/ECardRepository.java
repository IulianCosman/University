package map.project.demo.Repository;

import map.project.demo.Domain.ECard;
import map.project.demo.Domain.HealthCard;
import org.springframework.data.repository.CrudRepository;

public interface ECardRepository  extends CrudRepository<ECard, Integer> {
}
