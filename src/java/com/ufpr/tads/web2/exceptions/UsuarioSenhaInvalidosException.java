/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.exceptions;

/**
 *
 * @author renata
 */
public class UsuarioSenhaInvalidosException extends AppException {
    public UsuarioSenhaInvalidosException() {
        super("Usuário/Senha inválidos.");
    }
}
