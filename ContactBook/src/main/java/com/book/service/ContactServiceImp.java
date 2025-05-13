package com.book.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import com.book.entity.Contact;
import com.book.repository.ContactRepository;

@Service
public class ContactServiceImp {

	@Autowired
	private ContactRepository repos;
	
	public Page<Contact> getAllContact(int pageNum) {
		//return (List<Contact>) repos.findAll();
		/*Below code is added for pagination of 1-10 on single page */
		Pageable page = PageRequest.of(pageNum - 1, 5);
		return repos.findAll(page);
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
