package bms.ejb;

import javax.ejb.Remote;

@Remote
public interface WebRemote {
	public String getAllWeb();
}
