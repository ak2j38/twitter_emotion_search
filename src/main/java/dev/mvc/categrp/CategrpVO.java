package dev.mvc.categrp;

public class CategrpVO {
  /** ī�װ� ��ȣ */
  private int categrpno;
  /** ī�װ� �׷� �з� */
  private int classification;
  /**  ī�װ� �̸� */
  private String name;
  /** ����� */
  private String rdate;
  
  public CategrpVO() {
    super();
  }
  public CategrpVO(int categrpno, int classification, String name, String rdate) {
    super();
    this.categrpno = categrpno;
    this.classification = classification;
    this.name = name;
    this.rdate = rdate;
  }
  public int getCategrpno() {
    return categrpno;
  }
  public void setCategrpno(int categrpno) {
    this.categrpno = categrpno;
  }
  public int getClassification() {
    return classification;
  }
  public void setClassification(int classification) {
    this.classification = classification;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
}