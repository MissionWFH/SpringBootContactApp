package com.book.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.book.entity.Contact;
import com.book.service.ContactServiceImp;

@Controller
public class ContactController {
	
	@Autowired
	private ContactServiceImp service;
	
	@RequestMapping(value = "/")
	public String home(Model m) {
		System.out.println("Invoking home method from controller class as First Request ....");
		return listByPageReq(1, m);
	}
	
	@RequestMapping(value = "/page/{PageNum}")
	public String listByPageReq(@PathVariable int PageNum, Model m) {
	
		Page<Contact> page = service.getAllContact(PageNum);
		long totalContcat = page.getTotalElements();
		int totalPages = page.getTotalPages();
		
		List<Contact> list = page.getContent();
		
		m.addAttribute("currPage", PageNum);
		m.addAttribute("totalContcat", totalContcat);
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("listContact", list);
		return "index";
	}
	
	@RequestMapping(value = "/addContact")
	public String addContact(Model m) {
		Contact c = new Contact();
		m.addAttribute("command", c);
		return "addContact";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String Save(Contact contact, RedirectAttributes redirectAttr) {
		System.out.println("Saving Contact of --> "+contact.getName());
		service.save(contact);
		redirectAttr.addFlashAttribute("addCon", "Contact Has been Saved !");
		return "redirect:/";
	}
 
	@RequestMapping(value = "/editcontact/{id}")
	public String edit(@PathVariable int id, Model m) {
		Contact c = service.get(id);
		System.out.println("updating contact of ----------"+c.getName());
		m.addAttribute("contact", c);
		return "contacteditform";
	}
 
	@RequestMapping(value = "/editsave", method = RequestMethod.POST)
	public String editsave(Contact contact, RedirectAttributes redirectAtt) { 
		System.out.println("updating contact of "+contact.getId());
		service.updateContact(contact);
		redirectAtt.addFlashAttribute("updateCon", "Contact Updated");
		return "redirect:/";
	}

	@RequestMapping(value = "/deletecontact/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable int id, RedirectAttributes redirectAtt) {
		service.delete(id);
		redirectAtt.addFlashAttribute("delCon", "Contact Deleted ");
		return "redirect:/";
	}
}