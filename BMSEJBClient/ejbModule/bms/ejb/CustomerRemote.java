package bms.ejb;

import javax.ejb.Remote;

import bms.ejb.model.CustomerInputBean;

@Remote
public interface CustomerRemote {
	public String searchCustomer(String user, String telelphone);
	public String addCustomer(CustomerInputBean customer);
}
