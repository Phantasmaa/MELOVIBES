package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Calendar {

    private int dateID;
    private java.sql.Timestamp date;
    private int year;
    private int month;
    private int day;
    private int hour;
    private int minute;

    public Calendar() {
    }

    public int getDateID() {
        return dateID;
    }

    public void setDateID(int dateID) {
        this.dateID = dateID;
    }

    public java.sql.Timestamp getDate() {
        return date;
    }

    public void setDate(java.sql.Timestamp date) {
        this.date = date;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public int getHour() {
        return hour;
    }

    public void setHour(int hour) {
        this.hour = hour;
    }

    public int getMinute() {
        return minute;
    }

    public void setMinute(int minute) {
        this.minute = minute;
    }

    public static Calendar retrieveCalendarFromDatabase(int dateID) {
        Conexion c = new Conexion();
        Connection cnx = c.conecta();
        String query = "SELECT * FROM `Calendar` WHERE `DateID` = ?";

        try (PreparedStatement pstmt = cnx.prepareStatement(query)) {
            pstmt.setInt(1, dateID);
            ResultSet result = pstmt.executeQuery();

            if (result.next()) {
                Calendar calendar = new Calendar();
                calendar.setDateID(result.getInt("DateID"));
                calendar.setDate(result.getTimestamp("Date"));
                calendar.setYear(result.getInt("Year"));
                calendar.setMonth(result.getInt("Month"));
                calendar.setDay(result.getInt("Day"));
                calendar.setHour(result.getInt("Hour"));
                calendar.setMinute(result.getInt("Minute"));
                return calendar;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null; 
    }
}

