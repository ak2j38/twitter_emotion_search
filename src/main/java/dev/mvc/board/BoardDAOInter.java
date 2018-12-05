package dev.mvc.board;

import java.util.List;

import dev.mvc.categrp.CategrpVO;

public interface BoardDAOInter {
  /**
   * ���
   * @param categoryVO ����� ������
   * @return ó���� ���ڵ� ����
   */
  public abstract int create(BoardVO categoryVO);
  
  /**
   * ���
   * @return Join ���
   */
  public List<Categrp_BoardVO> list();
  
  /**
   * ���
   * @param categrpno ī�װ� �׷� ��ȣ
   * @return Join ���
   */
  public List<Categrp_BoardVO> list_by_categrp(int categrpno);

  /**
   * �Ѱ��� ���ڵ� ��ȸ
   * @param categrpno
   * @return
   */
  public Categrp_BoardVO read(int categoryno);
  
  /**
   * ���ڵ带 �����մϴ�.
   * @param categoryVO 
   * @return
   */
  public int update(BoardVO categoryVO);
  
  /**
   * �Ѱ��� ���ڵ� ����
   * @param categoryno
   * @return
   */
  public int delete(int categoryno);
  
  /**
   * ī�װ� �׷쿡 ���� ī��Ʈ ����
   * @param categrpno
   * @return
   */
  public int count_by_categrp(int categrpno);

  /**
   * ī�װ� �׷쿡 ���� ����
   * @param categrpno
   * @return
   */
  public int delete_by_categrp(int categrpno);
}









