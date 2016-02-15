package br.com.hermeto.test;

import java.security.NoSuchAlgorithmException;

import br.com.hermeto.util.EncryptPassword;

public class TestEncript {
	
	public static void main(String[] args) throws NoSuchAlgorithmException {
		String password = EncryptPassword.convertPassword("12345");
		
		System.out.println(password);
	}

}
