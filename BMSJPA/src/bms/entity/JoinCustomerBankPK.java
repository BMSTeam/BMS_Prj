package bms.entity;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the JoinCustomerBank database table.
 * 
 */
@Embeddable
public class JoinCustomerBankPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="UserName")
	private String userName;

	@Column(name="BankId")
	private int bankId;

	public JoinCustomerBankPK() {
	}
	public String getUserName() {
		return this.userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getBankId() {
		return this.bankId;
	}
	public void setBankId(int bankId) {
		this.bankId = bankId;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof JoinCustomerBankPK)) {
			return false;
		}
		JoinCustomerBankPK castOther = (JoinCustomerBankPK)other;
		return 
			this.userName.equals(castOther.userName)
			&& (this.bankId == castOther.bankId);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.userName.hashCode();
		hash = hash * prime + this.bankId;
		
		return hash;
	}
}