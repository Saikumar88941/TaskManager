package com.sailaxmi.DMS.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.sailaxmi.DMS.Models.Dog;

/**
 * 
 * 
	@author Sailaxmi Veldanda S560208
	Nov 11, 2023
 */
public interface DogRepository extends CrudRepository<Dog, Integer>{
	List<Dog> findByName(String name);
}