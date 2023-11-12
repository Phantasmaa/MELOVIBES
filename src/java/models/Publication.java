package models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Publication {
    private int publicationID;
    private String content;
    private String image;
    private boolean isActive;
    private boolean isMarket;
    private Timestamp date;
    private int userID;
    private User user;
}

