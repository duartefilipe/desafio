package com.globo.DesafioDevops.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
public class Desafio {
    @Id
    @Column(name = "content_id", nullable = false)
    private Long content_id;
    private String comment;
    private String email;

}