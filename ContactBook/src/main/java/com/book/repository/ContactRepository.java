package com.book.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.book.entity.Contact;

public interface ContactRepository extends JpaRepository<Contact, Integer> {

}
