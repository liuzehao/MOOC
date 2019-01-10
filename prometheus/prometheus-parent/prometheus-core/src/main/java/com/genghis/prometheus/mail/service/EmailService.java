package com.genghis.prometheus.mail.service;

public interface EmailService {
    public void sendEmail(String subject, String content, String sendName);
}
