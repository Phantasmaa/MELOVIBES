package models;

import java.sql.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Comment {
    private int commentID;
    private String contentComment;
    private int publicationID;
    private int userID;
    private Timestamp date;
    private PublicationNormal publicationNormal;
    private PublicationMarket publicationMarket;
}
