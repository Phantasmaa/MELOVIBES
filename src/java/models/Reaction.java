package models;

import lombok.Data;



@Data
public class Reaction {
    private int userID;
    private int publicationID;
    PublicationNormal publication;
}
