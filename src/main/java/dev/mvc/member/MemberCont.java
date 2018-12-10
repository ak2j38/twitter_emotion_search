package dev.mvc.member;
 
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
 
@Controller
public class MemberCont {
  
  @Autowired
  @Qualifier("dev.mvc.member.MemberProc")
  private MemberProcInter memberProc = null;
  
  public MemberCont(){
    System.out.println("--> MemberCont created.");
  }
  
//http://localhost:9090/tea/member/create.do
 @RequestMapping(value = "/member/create.do", method = RequestMethod.GET)
 public ModelAndView create() {
   ModelAndView mav = new ModelAndView();
   
   
   mav.setViewName("/member/create");
   
   return mav;
 }
 

 /**
  * �ߺ� ID �˻�
  * http://localhost:9090/tea/member/checkId.do?id=user1
  * ���: {"cnt":1}
  * @param id
  * @return
  */
 @ResponseBody
 @RequestMapping(value = "/member/checkId.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
 public String checkId(String id) {
  JSONObject json = new JSONObject();
  int cnt = memberProc.checkId(id);
  
  json.put("cnt", cnt);
  
  return json.toString();
 }
 
 /**
  * ȸ������ó��
  * @param redirectAttributes
  * @param request
  * @param memberVO
  * @return
  */
 @RequestMapping(value="/member/create.do", method=RequestMethod.POST)
 public ModelAndView create(RedirectAttributes redirectAttributes,
                                       HttpServletRequest request, MemberVO memberVO){
   // System.out.println("--> update() POST called.");
   ModelAndView mav = new ModelAndView();
   
   int count = memberProc.checkId(memberVO.getId());
   
   if (count == 1) { // ID �ߺ��� �޽��� ���
     redirectAttributes.addAttribute("sw", "id");
     redirectAttributes.addAttribute("count", count); // 1 or 0
     
   } else {
     count = memberProc.create(memberVO); // ���

     redirectAttributes.addAttribute("sw", "create");
     redirectAttributes.addAttribute("count", count); // 1 or 0
   }
   
   mav.setViewName("redirect:/member/create_message.jsp");
  
   return mav;
 }
 
 @RequestMapping(value="/member/list.do", method=RequestMethod.GET)
 public ModelAndView list(HttpSession session){
   // System.out.println("--> create() GET called.");
   ModelAndView mav = new ModelAndView();
   mav.setViewName("/member/list"); // webapp/member/list.jsp
    
   if (memberProc.isMember(session) == true) {
     mav.setViewName("redirect:/member/login_need.jsp"); 
   } else {
     mav.setViewName("/member/list"); // webapp/member/list.jsp
     
     List<MemberVO> list = memberProc.list();
     mav.addObject("list", list);
   }
   
   return mav;
 } 
 
 @RequestMapping(value="/member/read.do", method=RequestMethod.GET)
 public ModelAndView read(int memberno){
   // System.out.println("--> read(int memberno) GET called.");
   ModelAndView mav = new ModelAndView();
   mav.setViewName("/member/read"); // webapp/member/read.jsp
   
   MemberVO memberVO = memberProc.read(memberno);
   mav.addObject("memberVO", memberVO);
   
   return mav;
 }  
 
 @RequestMapping(value="/member/update.do", method=RequestMethod.POST)
 public ModelAndView update(RedirectAttributes redirectAttributes,
                                       HttpServletRequest request, MemberVO memberVO){
   // System.out.println("--> update() POST called.");
   ModelAndView mav = new ModelAndView();
   
   int count = memberProc.update(memberVO); // ����

   redirectAttributes.addAttribute("count", count); // 1 or 0
   redirectAttributes.addAttribute("memberno", memberVO.getMemberno()); // ȸ�� ��ȣ
   
   mav.setViewName("redirect:/member/update_message.jsp");
  
   return mav;
 }

 /**
  * �н����� ������
  * @return
  */
 @RequestMapping(value="/member/passwd_update.do", method=RequestMethod.GET)
 public ModelAndView passwd_update(){
   ModelAndView mav = new ModelAndView();
   mav.setViewName("/member/passwd_update"); // webapp/member/passwd_update.jsp
   
   // mav.addObject("mno", mno);
   
   return mav;
 }  
 
 /**
  * �н����带 �����մϴ�.
  * @param request
  * @param passwd
  * @param new_passwd
  * @return
  */
 @RequestMapping(value="/member/passwd_update.do", method=RequestMethod.POST)
 public ModelAndView passwd_update(HttpServletRequest request,
                                                   HttpSession session,
                                                   String passwd,
                                                   String new_passwd){
   // System.out.println("--> passwd_update() POST called.");
   ModelAndView mav = new ModelAndView();
   
   String id = "user1";
   //String id = (String)session.getAttribute("id"); // session
   int memberno =1;
   //int mno = (Integer)session.getAttribute("mno"); // session
   
   // �α��� ���� �߰� ����
   //int count = memberProc.login(id, passwd); // ���� �н����� �˻�
   int count = 1; // ���� �н����� �˻�
   System.out.println("--> count: " + count);
   if (count == 1) { // �α����� ȸ���� �н����� �˻�
     int count_update = memberProc.passwd_update(memberno, new_passwd);
     System.out.println("--> count_update: " + count_update);
     mav.setViewName("redirect:/member/passwd_update_message.jsp?count=" + count_update + "&memberno=" + memberno);
   } else {
     mav.setViewName("redirect:/member/login.do");      
   }
   
   return mav;
 } 
 
 @RequestMapping(value="/member/delete.do", method=RequestMethod.GET)
 public ModelAndView delete(int memberno){
   ModelAndView mav = new ModelAndView();
   mav.setViewName("/member/delete"); // webapp/member/delete.jsp
   
   MemberVO memberVO = memberProc.read(memberno);
   mav.addObject("memberVO", memberVO);
   
   return mav;
 }  
 
 @RequestMapping(value="/member/delete.do", method=RequestMethod.POST)
 public ModelAndView delete(RedirectAttributes redirectAttributes,
                                       HttpServletRequest request, int memberno){
   ModelAndView mav = new ModelAndView();
   
   int count = memberProc.delete(memberno);

   redirectAttributes.addAttribute("count", count); // 1 or 0
   redirectAttributes.addAttribute("memberno", memberno); // ȸ�� ��ȣ
   
   mav.setViewName("redirect:/member/delete_message.jsp");
  
   return mav;
 }
 
}