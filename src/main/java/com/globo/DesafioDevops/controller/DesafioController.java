package com.globo.DesafioDevops.controller;

import com.globo.DesafioDevops.model.Desafio;
import com.globo.DesafioDevops.repository.DesafioRepository;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping({"/api"})
public class DesafioController {

    private DesafioRepository repository;
    DesafioController(DesafioRepository desafioRepository) {
        this.repository = desafioRepository;
    }


    @GetMapping
    @RequestMapping("/comment/list")
    public List<Desafio> findAll(){
        return repository.findAll();
    }

    @PostMapping
    @RequestMapping("/comment/new")
    public Desafio create(@RequestBody Desafio desafio){
        return repository.save(desafio);
    }


    @GetMapping("/comment/list/{content_id}")
    public ResponseEntity<Desafio> getDesafioById(@PathVariable("content_id") long content_id) {
        Optional<Desafio> tutorialData = repository.findById(content_id);
        if (tutorialData.isPresent()) {
            return new ResponseEntity<>(tutorialData.get(), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

/*teste*/
}