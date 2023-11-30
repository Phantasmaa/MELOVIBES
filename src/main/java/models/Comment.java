package models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Comment {
    private int commentID;
    private String contentComment;
    private int publicationID;
    private int userID;
    private Timestamp date;
    private User user;
}
