package com.example.androidforios.app.data.model;

import android.os.Parcel;
import android.os.Parcelable;

import com.example.androidforios.app.R;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by stephen.barnes on 3/21/14.
 */
public class TripList implements Parcelable {

    public enum LineType {
        RED {
            public String getLineName() {return "Red"; }
            public int getLineColorResourceId() {return R.color.LineType_Red;}
            public int getLineThemeResourceId() {return R.style.AppTheme_Red;}
        },
        ORANGE {
            public String getLineName() {return "Orange"; }
            public int getLineColorResourceId() {return R.color.LineType_Orange;}
            public int getLineThemeResourceId() {return R.style.AppTheme_Orange;}
        },
        BLUE {
            public String getLineName() {return "Blue"; }
            public int getLineColorResourceId() {return R.color.LineType_Blue;}
            public int getLineThemeResourceId() {return R.style.AppTheme_Blue;}
        };

        public String getFileName() { return this.getLineName() + ".json"; }

        public abstract String getLineName();
        public abstract int getLineColorResourceId();
        public abstract int getLineThemeResourceId();

        /**
         * Create a linetype object from a string value.
         * @param lineTypeString the string representation for the subway line type. ex: "Red"
         * @return a new linetype enum.
         */
        public static LineType getLineType(String lineTypeString) {
            LineType lineType = LineType.RED;
            if (lineTypeString.equals("Red")) {
                lineType = LineType.RED;
            } else if (lineTypeString.equals("Blue")) {
                lineType = LineType.BLUE;
            } else if (lineTypeString.equals("Orange")) {
                lineType = LineType.ORANGE;
            }
            return lineType;
        }
    }

    public TripList() {
        this.trips = new LinkedList<Trip>();
    }

    public TripList(JSONObject jsonData) {
        this.trips = new LinkedList<Trip>();
        this.importDataFromJSON(jsonData);
    }

    public Date currentTime;
    public LineType subwayLine;
    public List<Trip> trips;

    /**
     * Import Trip data from structured JSON data.
     * @param jsonData the read in JSON data with MBTA trip data.
     */
    public void importDataFromJSON(JSONObject jsonData) {
        try {
            // Import Line Type
            this.subwayLine = LineType.getLineType(jsonData.getString("Line"));

            // Import Timestamp
            this.currentTime = new Date(jsonData.getLong("CurrentTime"));

            // Import Trips List
            JSONArray tripsJSONArray = jsonData.getJSONArray("Trips");
            for (int i=0; i < tripsJSONArray.length(); i++) {
                Trip trip = new Trip(tripsJSONArray.getJSONObject(i));
                this.trips.add(trip);
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    public static Creator<TripList> CREATOR = new Creator<TripList>() {
        @Override
        public TripList[] newArray(int size) {
            return new TripList[size];
        }

        @Override
        public TripList createFromParcel(Parcel source) {
            TripList tripList = new TripList();
            String subwayLineName = source.readString();
            tripList.subwayLine = LineType.getLineType(subwayLineName);
            tripList.currentTime = new Date(source.readLong());
            source.readList(tripList.trips, Trip.class.getClassLoader());
            return tripList;
        }
    };

    @Override
    public int describeContents() {
        return super.hashCode();
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(subwayLine.getLineName());
        dest.writeLong(currentTime.getTime());
        dest.writeList(trips);
    }
}
