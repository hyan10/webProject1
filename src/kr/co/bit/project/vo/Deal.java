package kr.co.bit.project.vo;

public class Deal {
	private int no;
    private String comments;
    private int senderNo;
    private int receiverNo;
    private int money;
    private String startDate;
    private String endDate;

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public int getSenderNo() {
        return senderNo;
    }

    public void setSenderNo(int senderNo) {
        this.senderNo = senderNo;
    }

    public int getReceiverNo() {
        return receiverNo;
    }

    public void setReceiverNo(int receiverNo) {
        this.receiverNo = receiverNo;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }
}
