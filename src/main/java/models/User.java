package models;

import lombok.Data;

@Data
public class User {
    private int userID;
    private String email;
    private String password;
    private String firstName;
    private String lastName;
    private String userName;
    private String userImage;
    private String city;
    private int age;
    private String bio;
    private String phoneNumber;
    private String gender;
}
