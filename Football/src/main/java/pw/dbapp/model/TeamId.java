package pw.dbapp.model;

import javax.persistence.Embeddable;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Embeddable
public class TeamId {
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
    @JoinColumn(name = "Id", updatable = true)
	private Team team;
}
