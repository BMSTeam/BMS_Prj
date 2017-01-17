package bms.ejb;

import javax.ejb.Remote;

@Remote
public interface BankRemote {
	public String getBanks();
	public String getCompanryBanksOnlyActiveStatus();
}
