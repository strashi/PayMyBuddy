package xyz.strashi.PayMyBuddy.service;

import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;

import xyz.strashi.PayMyBuddy.model.Relationship;
import xyz.strashi.PayMyBuddy.model.Role;
import xyz.strashi.PayMyBuddy.model.Status;
import xyz.strashi.PayMyBuddy.model.User;
import xyz.strashi.PayMyBuddy.repository.TransactionRepository;
import xyz.strashi.PayMyBuddy.repository.UserRepository;

@SpringBootTest
public class TransactionServiceTests {
	
	@MockBean
	private UserRepository userRepository;
	
	@MockBean
	private TransactionRepository transactionRepository;
		
	@Autowired
	private TransactionService transactionService;
	
	@Test
	public void executeTransactionTest() {
		
		List<Relationship> relationships = new ArrayList<>();
		User creditor = new User(1L,Role.USER,"email1@xyz","password","firstName","lastName",50.0f, null, relationships);
		User debitor = new User(2L,Role.USER,"email2@xyz","password","firstName2","lastName2",50.0f, null, relationships);
		when(userRepository.save(creditor)).thenReturn(creditor);
		when(userRepository.save(debitor)).thenReturn(debitor);
			
		String status = transactionService.executeTransaction(creditor, debitor, 50, "resto",false);
		
		assertTrue(status.equals(Status.ok.toString()));
	}
	
	@Test
	public void getTaxTest() {
		
		User debitor = new User(0L,Role.USER,"email1@xyz","password","firstName","lastName",50.0f, null, null);
		User admin = new User(0L,Role.ADMIN,"admin","password","firstName","lastName",50.0f, null, null);
		Optional<User> opt = Optional.of(admin);
		when(userRepository.findByEmail(any(String.class))).thenReturn(opt);
				
		String status = transactionService.getTax(debitor, 50d);
		
		assertTrue(status.equals(Status.ok.toString()));
			
		
	}

}
