package bms.ejb;

import javax.ejb.Remote;

import bms.ejb.model.CustomerInputBean;

@Remote
public interface CustomerRemote {
	public String searchCustomerOnly(CustomerInputBean customer);
	public String searchCustomer(CustomerInputBean customer);
	public String addCustomer(CustomerInputBean customer);
	public String editCustomer(CustomerInputBean customer);
	public String deleteCustomer(String customer);
}
