package com.mayankkapoor.springboot.rest.example.student;

public class StudentNotFoundException extends RuntimeException {

	/**
	 *
	 */
	private static final long serialVersionUID = -1883174619379091785L;

	public StudentNotFoundException(String exception) {
		super(exception);
	}

}
