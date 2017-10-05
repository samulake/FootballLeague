package org.project.controller;

import java.util.List;

import org.project.model.Match;

import static org.springframework.http.MediaType.*;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

//@RestController
@RequestMapping("/matches")
public class MatchRestController {

	@GetMapping(path="/{id}",produces=APPLICATION_JSON_VALUE)
	public Match getMatchById(@PathVariable Long id) {
		return null;
	}
	
	@PutMapping(path="/{id}",produces=APPLICATION_JSON_VALUE, consumes=APPLICATION_XML_VALUE)
	public Match updateMatch(@RequestBody Match updatedMatch, @PathVariable Long id) {
		return null;
	}
	
	
	@GetMapping("/entity")
	public ResponseEntity<Integer> entityTest() {
		HttpHeaders headers = new HttpHeaders();
		headers.add(
				"key", 
				ServletUriComponentsBuilder.fromCurrentRequest()
				.toUriString());
		return new ResponseEntity<Integer>(3, headers, HttpStatus.ACCEPTED);
	}
}
