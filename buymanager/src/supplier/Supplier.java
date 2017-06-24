package supplier;

public class Supplier {
	int se_num;
	String name;
	String address;
	String telephone;
	int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	Supplier(int id,int se_num,String name,
	String address,
	String telephone){
		this.id=id;
		this.se_num=se_num;
		this.name=name;
		this.address=address;
		this.telephone=telephone;
	}
	public int getSe_nm() {
		return se_num;
	}
	public void setSe_nm(int se_nm) {
		this.se_num = se_nm;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	
}
