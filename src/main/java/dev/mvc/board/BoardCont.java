package dev.mvc.board;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.categrp.CategrpProcInter;
import dev.mvc.categrp.CategrpVO;

@Controller
public class BoardCont {
  @Autowired
  @Qualifier("dev.mvc.board.BoardProc")
  private BoardProcInter boardProc = null;

  @Autowired
  @Qualifier("dev.mvc.categrp.CategrpProc")
  private CategrpProcInter categrpProc = null;

  public BoardCont() {
    System.out.println("--> BoardCont created.");
  }

  // http://localhost:9090/ojt/board/create.do
  @RequestMapping(value = "/board/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/board/create"); // /webapp/board/create.jsp
    
    return mav;
  }

  // http://localhost:9090/ojt/board/create.do
  @RequestMapping(value = "/board/create.do", method = RequestMethod.POST)
  public ModelAndView create(BoardVO boardVO) {
    ModelAndView mav = new ModelAndView();
    int count = boardProc.create(boardVO);
    mav.setViewName("redirect:/board/create_message.jsp?count=" + count); // /webapp/board/create_message.jsp
    
    return mav;
  }

  // http://localhost:9090/ojt/board/create_json.do?categrpno=1&name=���&memberno=1
  // {"msgs":["ī�װ��� ����߽��ϴ�.","��ϵ� ī�װ� ���"]}
  @ResponseBody
  @RequestMapping(value = "/board/create_json.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public ResponseEntity create_json(BoardVO boardVO) {
    HttpHeaders responseHeaders = new HttpHeaders();

    JSONObject json = new JSONObject();
    JSONArray msgs = new JSONArray();

    if (boardProc.create(boardVO) == 1) {
      msgs.put("ī�װ��� ����߽��ϴ�.");
      msgs.put("��ϵ� ī�װ� " + boardVO.getName());
    } else {
      msgs.put("ī�װ� ��Ͽ� �����߽��ϴ�.");
      msgs.put("�ٽ��ѹ� �õ����ּ���. �� ����: 000-0000-0000");
    }
    json.put("msgs", msgs);

    return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
  }

  /**
   * ��ü ���
   * 
   * @return
   */
  // http://localhost:9090/ojt/board/list.do
  @RequestMapping(value = "/board/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();

    List<CategrpVO> categrp_list = categrpProc.list();
    mav.addObject("categrp_list", categrp_list);
    
    mav.setViewName("/board/list"); // /webapp/board/list.jsp

    return mav;
  }

  /**
   * JSON ��� ��ü ���
   * http://localhost:9090/ojt/board/list_json.do
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/board/list_json.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
  public ResponseEntity list_json() {
    HttpHeaders responseHeaders = new HttpHeaders();
    List<Categrp_BoardVO> list = boardProc.list();

    JSONArray json = new JSONArray(list);

    return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
  }

  /**
   * ī�װ� �׷캰 ��ü ���
   * http://localhost:9090/ojt/board/list_by_categrp.do
   * @return
   */
  @RequestMapping(value = "/board/list_by_categrp.do", method = RequestMethod.GET)
  public ModelAndView list_by_categrp(int categrpno) {
    ModelAndView mav = new ModelAndView();

    CategrpVO categrpVO = categrpProc.read(categrpno);
    mav.addObject("categrpVO", categrpVO);
    
    mav.setViewName("/board/list_by_categrp"); // /webapp/board/list_by_categrp.jsp

    return mav;
  }

  /**
   * ī�װ� �׷캰 JSON ��� ��ü ���
   * http://localhost:9090/ojt/board/list_by_categrp_json.do
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/board/list_by_categrp_json.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
  public ResponseEntity list_by_categrp_json(int categrpno) {
    HttpHeaders responseHeaders = new HttpHeaders();
    List<Categrp_BoardVO> list = boardProc.list_by_categrp(categrpno);

    JSONArray json = new JSONArray(list);

    return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
  }

  /*
   * ���� ��
   * http://localhost:9090/ojt/board/update.do?boardno=1
   * @param categrpno
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/board/update.do", 
                           method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
  public String update(int boardno) {
    // System.out.println("--> update() GET executed");
    
    Categrp_BoardVO boardVO = boardProc.read(boardno);
    JSONObject obj = new JSONObject(boardVO);
   
      // �⺻ ���� �����ϴ� ���� ���� ���� ���
//    obj.put("boardno", boardno);
//    obj.put("categrpno", boardVO.getCategrpno());
//    obj.put("title", boardVO.getTitle());
//    obj.put("seqno", boardVO.getSeqno());
//    obj.put("visible", boardVO.getVisible());
//    obj.put("ids", boardVO.getIds());
//    obj.put("rdate", boardVO.getRdate());

    return obj.toString();
  }

  // http://localhost:9090/ojt/board/update_json.do?categrpno=1&boardno=1&title=�״�����&seqno=1&visible=Y&ids=admin
  // {"msgs":["ī�װ��� ����߽��ϴ�.","��ϵ� ī�װ� ���"]}
  @ResponseBody
  @RequestMapping(value = "/board/update_json.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public ResponseEntity update_json(BoardVO boardVO) {
    HttpHeaders responseHeaders = new HttpHeaders();

    JSONObject json = new JSONObject();
    JSONArray msgs = new JSONArray();

    if (boardProc.update(boardVO) == 1) {
      msgs.put("ī�װ��� �����߽��ϴ�.");
      msgs.put("������ ī�װ� " + boardVO.getName());
    } else {
      msgs.put("ī�װ� ������ �����߽��ϴ�.");
      msgs.put("�ٽ��ѹ� �õ����ּ���. �� ����: 000-0000-0000");
    }
    json.put("msgs", msgs);

    return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
  }

  /**
   * ���� ��
   * http://localhost:9090/ojt/board/delete.do?boardno=1
   * @param boardno
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/board/delete.do", 
                           method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
  public String delete(int boardno) {
    Categrp_BoardVO boardVO = boardProc.read(boardno);
    JSONObject obj = new JSONObject(boardVO);

    return obj.toString();
  }
  
  // http://localhost:9090/ojt/board/delete.do?boardno=1
  @ResponseBody
  @RequestMapping(value = "/board/delete.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public ResponseEntity delete_proc(int boardno) {
    HttpHeaders responseHeaders = new HttpHeaders();

    JSONObject json = new JSONObject();
    JSONArray msgs = new JSONArray();
    
    String name = boardProc.read(boardno).getBoard_name();
    
    if (boardProc.delete(boardno) == 1) {
      msgs.put("ī�װ��� �����߽��ϴ�.");
      msgs.put("������ ī�װ� [" + name + "]");
    } else {
      msgs.put("[" + name + "] ī�װ� ������ �����߽��ϴ�.");
      msgs.put("�ٽ��ѹ� �õ����ּ���. �� ����: 000-0000-0000");
    }
    json.put("msgs", msgs);

    return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
  }
}