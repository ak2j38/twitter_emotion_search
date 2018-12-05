package dev.mvc.board;

import java.util.List;

public interface BoardProcInter {
  /**
   * ���
   * @param boardVO
   * @return ó���� ����Ʈ ����
   */
  public abstract int create (BoardVO boardVO); 

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
  public Categrp_BoardVO read(int boardno);
  
  /**
   * ���ڵ带 �����մϴ�.
   * @param boardVO 
   * @return
   */
  public int update(BoardVO categoryVO);

  /**
   * �Ѱ��� ���ڵ� ����
   * @param boardno
   * @return
   */
  public int delete(int boardno);
  
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
