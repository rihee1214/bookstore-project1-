package com.sb.s1.member.membercart;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sb.s1.util.Pager;

@Service
public class MembercartService {

	@Autowired
	private MembercartDAO membercartDAO;
	
	public List<MembercartDTO> getCartList(Pager pager)throws Exception{
		pager.setCurPage(pager.getCurPage() == 0 ? 1 : pager.getCurPage());
		pager.setCurBlock(pager.getCurBlock() == 0 ? 1 : pager.getCurBlock());
		pager.makecal(membercartDAO.getTotalCount(pager));
		return membercartDAO.getCartList(pager);
	}
	
	public MembercartDTO checkBook(MembercartDTO membercartDTO)throws Exception{
		return membercartDAO.checkBook(membercartDTO);
	}
	
	public long addCart(MembercartDTO membercartDTO)throws Exception{
		return membercartDAO.addCart(membercartDTO);
	}
	
	public long delete(MembercartDTO membercartDTO)throws Exception{
		return membercartDAO.delItem(membercartDTO);
	}
	
	public long deleteList(ArrayList<Long> list)throws Exception{
		return membercartDAO.deleteList(list);
	}
	
	public long updateCart(MembercartDTO membercartDTO)throws Exception{
		return membercartDAO.updateCart(membercartDTO);
	}
}
