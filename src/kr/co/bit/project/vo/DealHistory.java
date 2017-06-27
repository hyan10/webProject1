package kr.co.bit.project.vo;

public class DealHistory extends Deal {

	private String endDate;

	public DealHistory() {
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	@Override
	public String toString() {
		return super.toString() + " DealHistory [endDate=" + endDate + "]";
	}

}
