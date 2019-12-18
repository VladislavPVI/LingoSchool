package com.webschool.engschool.service;

import com.webschool.engschool.domain.Email;
import com.webschool.engschool.domain.Logging;
import com.webschool.engschool.repos.EmailRepo;
import com.webschool.engschool.repos.LoggingRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.stereotype.Service;

@Service
public class Receiver {
    @Autowired
    private LoggingRepo loggingRepo;

    @Autowired
    private EmailRepo emailRepo;

    @Autowired
    public MailSender mailSender;

    @JmsListener(destination = "editTask", containerFactory = "myFactory")
    public void receiveMessageKek(Logging logg) {
        System.out.println("Task (" + logg.getKindOfChange() + "). See DB to get additional information");
        loggingRepo.save(logg);

    }

    @JmsListener(destination = "sendEmail", containerFactory = "myFactory")
    public void receiveEmail(Email email) {
        emailRepo.save(email);
        mailSender.send("otori86@gmail.com", "Удаление пользователя", "Пользователь " + email.getBody() + " был удален!\n" + email.getSender());

    }
}