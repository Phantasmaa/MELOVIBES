package models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.util.Base64;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Publication {
    private int publicationID;
    private String content;
    private byte[] image;
    private boolean isActive;
    private boolean isMarket;
    private Timestamp date;
    private int userID;
    private User user;
    private int nComment;
    private int nLikes;

    public byte[] getBitImage(){
        return image;
    }
    public String getImage() {
        if (image != null) {
            return "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(image);
        } else {
            return "";
        }
    }

}

