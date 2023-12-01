package models;

import lombok.Data;

import java.sql.Date;

@Data
public class Message {
    private int messageId;
    private int senderId;
    private int receiverId;
    private String content;
    private Date date;
}
