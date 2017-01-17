package bms.entity;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the JoinCompanyBank database table.
 * 
 */
@Embeddable
public class JoinCompanyBankPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="BankId")
	private int bankId;

	@Column(name="AccountNo")
	private String accountNo;

	public JoinCompanyBankPK() {
	}
	public int getBankId() {
		return this.bankId;
	}
	public void setBankId(int bankId) {
		this.bankId = bankId;
	}
	public String getAccountNo() {
		return this.accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof JoinCompanyBankPK)) {
			return false;
		}
		JoinCompanyBankPK castOther = (JoinCompanyBankPK)other;
		return 
			(this.bankId == castOther.bankId)
			&& this.accountNo.equals(castOther.accountNo);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.bankId;
		hash = hash * prime + this.accountNo.hashCode();
		
		return hash;
	}
}