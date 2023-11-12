package models;

import java.sql.Timestamp;
import lombok.Data;

@Data
public class Comment {
    private int commentID;
    private String contentComment;
    private int publicationID;
    private int userID;
    private Timestamp date;
}
