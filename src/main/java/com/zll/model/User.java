package com.zll.model;

public class User {
	private int id;
	private String name;
	private String tel;
	private String pwd;

    public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
}
