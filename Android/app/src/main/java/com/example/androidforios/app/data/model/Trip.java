package com.example.androidforios.app.data.model;

import android.os.Parcel;
import android.os.Parcelable;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by stephen.barnes on 3/21/14.
 */
public class Trip implements Parcelable {

    public String tripId;
    public String destination;
    public Date positionTimeStamp;
    public String trainName;
    public Double positionLat;
    public Double positionLong;
    public Integer positionHeading;
    public List<Prediction> predictions;

    public Trip() {
        predictions = new LinkedList<Prediction>();
    }

    public Trip(JSONObject jsonData) {
        predictions = new LinkedList<Prediction>();
        this.importDataFromJSON(jsonData);
    }

    public void importDataFromJSON(JSONObject jsonData) {
        try {
            this.tripId = jsonData.getString("TripID");
            this.destination = jsonData.getString("Destination");

            JSONObject positionData = jsonData.optJSONObject("Position");
            if (positionData != null) {
                // Import the position's timestamp
                this.positionTimeStamp = new Date(positionData.getLong("Timestamp"));
                // TODO: initialize and format unix time correctly

                // Import Train Name
                this.trainName = positionData.getString("Train");

                // Import Lat, Long, and Heading
                this.positionLat = positionData.getDouble("Lat");
                this.positionLong = positionData.getDouble("Long");
                this.positionHeading = positionData.getInt("Heading");
            }

            // Import the predictions list
            JSONArray predictionsJSONArray = jsonData.getJSONArray("Predictions");
            for (int i=0; i < predictionsJSONArray.length(); i++) {
                Prediction prediction = new Prediction(predictionsJSONArray.getJSONObject(i));
                this.predictions.add(prediction);
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    public static Creator<Trip> CREATOR = new Creator<Trip>() {
        @Override
        public Trip[] newArray(int size) {
            return new Trip[size];
        }

        @Override
        public Trip createFromParcel(Parcel source) {
            Trip trip = new Trip();
            trip.tripId = source.readString();
            trip.destination = source.readString();
            source.readList(trip.predictions, Prediction.class.getClassLoader());
            trip.positionTimeStamp = new Date(source.readLong());
            trip.trainName = source.readString();
            trip.positionLat = source.readDouble();
            trip.positionLong = source.readDouble();
            trip.positionHeading = source.readInt();
            return trip;
        }
    };

    public int describeContents()
    {
        return super.hashCode();
    }

    public void writeToParcel(Parcel dest, int flags)
    {
        dest.writeString(tripId);
        dest.writeString(destination);
        dest.writeList(predictions);
        if (positionTimeStamp != null) {
            dest.writeLong(positionTimeStamp.getTime());
            dest.writeString(trainName);
            dest.writeDouble(positionLat);
            dest.writeDouble(positionLong);
            dest.writeInt(positionHeading);
        }
    }
}
