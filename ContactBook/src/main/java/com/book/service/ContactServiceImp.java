package com.book.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.book.model.Contact;
import com.book.repos.ContactRepository;

@Service
public class ContactServiceImp {

	@Autowired
	private ContactRepository repos;
	
	public List<Contact> getAllContact() {
		return (List<Contact>) repos.findAll();
	}
	
	public void save(Contact contact) {
		repos.save(contact);
	}
	
	public Contact get(int id) {
		return  repos.findById(id).get();
	}
	
	public void updateContact(Contact contact) {
		 repos.save(contact);
	}
	
	public void delete(int id) {
		repos.deleteById(id);
	}
}
