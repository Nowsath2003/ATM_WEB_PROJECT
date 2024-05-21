package javafile;

import java.sql.Timestamp;

public class MTransaction {

	private Timestamp time;
	private String id;
	private int amount;
	private String type;
	private int balance;

	public MTransaction(Timestamp time, String id, int amount, String type, int balance) {
		this.time=time;
		this.id=id;
		this.amount=amount;
		this.type=type;
		this.balance=balance;
	}

	public Timestamp getTime() {
		return time;
	}

	public String getId() {
		return id;
	}

	public int getAmount() {
		return amount;
	}

	public int getBalance() {
		return balance;
	}

	public String getType() {
		return type;
	}

}
