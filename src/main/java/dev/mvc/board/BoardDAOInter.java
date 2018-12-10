package dev.mvc.board;

import java.util.List;

public interface BoardDAOInter {
  /**
   * ���
   * @param boardVO ����� ������
   * @return ó���� ���ڵ� ����
   */
  public abstract int create(BoardVO boardVO);
  
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
  public int update(BoardVO boardVO);
  
  /**
   * �Ѱ��� ���ڵ� ����
   * @param boardno
   * @return
   */
  public int delete(int boardno);
}









