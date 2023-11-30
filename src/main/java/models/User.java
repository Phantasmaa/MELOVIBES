package models;

import lombok.Data;

import java.util.Base64;

@Data
public class User {
    private int userID;
    private String email;
    private String password;
    private String firstName;
    private String lastName;
    private String userName;
    private byte[] userImage;
    private String city;
    private int age;
    private String bio;
    private String phoneNumber;
    private String gender;


    public String getUserImage() {
        if (userImage != null) {
            return "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(userImage);
        } else {
            return null;
        }
    }

}
