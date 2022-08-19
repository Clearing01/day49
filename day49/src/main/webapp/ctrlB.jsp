<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.BoardSet, java.util.ArrayList"%>
<jsp:useBean id="bDAO" class="board.BoardDAO"/>    
<jsp:useBean id="bVO" class="board.BoardVO"/>    
<jsp:useBean id="rVO" class="board.ReplyVO"/>
<jsp:setProperty property="*" name="bVO"/>    
<jsp:setProperty property="*" name="rVO"/>    
    
<%   
    
     
	String action=request.getParameter("action");
	System.out.println("로그: "+action);
	String cnt=request.getParameter("cnt");
	if(cnt==null){
		cnt="2";
	}
	else {
		session.setAttribute("cnt", cnt+2);
	}
	
		if(action.equals("main")){
			System.out.println("메인 로그:" );
			bVO.setCnt(Integer.parseInt(cnt));
			System.out.println(cnt);
			ArrayList<BoardSet> datas=bDAO.selectAll(bVO);
			request.setAttribute("datas", datas);
			pageContext.forward("main.jsp"); // forward 액션
		}
    	else if(action.equals("insertB")){
			System.out.println("insertB 로그:" );
			if(bDAO.insert(bVO)){
				response.sendRedirect("ctrlB.jsp?action=main");
			}
			else{
				throw new Exception("insertB 오류");
			}
    	}
    	else if(action.equals("insertR")){
			System.out.println("insertR 로그:" );
			if(bDAO.insert_R(rVO)){
				response.sendRedirect("ctrlB.jsp?action=main");
			}
			else{
				throw new Exception("insertR 오류");
			}
    	}
    	else if(action.equals("deleteB")){
    		
    	}
		else if(action.equals("deleteR")){
    		
    	}
    
    
    
%>		