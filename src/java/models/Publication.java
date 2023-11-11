package models;

import java.sql.Timestamp;

public class Publication {
    private int publicationID;
    private String content;
    private String image;
    private boolean isActive;
    private boolean isMarket;
    private Timestamp date;
    private int userID;
    private User user; 

    // Constructor sin parámetros
    public Publication() {
    }

    // Constructor sin User
    public Publication(int publicationID, String content, String image, boolean isActive, boolean isMarket, Timestamp date, int userID) {
        this.publicationID = publicationID;
        this.content = content;
        this.image = image;
        this.isActive = isActive;
        this.isMarket = isMarket;
        this.date = date;
        this.userID = userID;
    }

    // Constructor con User
    public Publication(int publicationID, String content, String image, boolean isActive, boolean isMarket, Timestamp date, int userID, User user) {
        this.publicationID = publicationID;
        this.content = content;
        this.image = image;
        this.isActive = isActive;
        this.isMarket = isMarket;
        this.date = date;
        this.userID = userID;
        this.user = user;
    }


    // Getters y setters

    public int getPublicationID() {
        return publicationID;
    }

    public void setPublicationID(int publicationID) {
        this.publicationID = publicationID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public boolean isMarket() {
        return isMarket;
    }

    public void setMarket(boolean market) {
        isMarket = market;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    // Agregar getter y setter para User
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}

