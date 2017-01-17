package bms.ejb;

import javax.ejb.Remote;

import bms.ejb.model.BetTranInputBean;

@Remote
public interface BetTranRemote {
	public String getAllBetTran();
	public String saveBetTran(BetTranInputBean btib);
}
