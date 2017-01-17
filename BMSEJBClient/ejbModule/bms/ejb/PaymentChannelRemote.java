package bms.ejb;

import javax.ejb.Remote;

@Remote
public interface PaymentChannelRemote {
	public String getAllPaymentChannel();
}
