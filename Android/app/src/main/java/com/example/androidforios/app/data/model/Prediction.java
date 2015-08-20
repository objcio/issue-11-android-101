package com.example.androidforios.app.data.model;

import android.os.Parcel;
import android.os.Parcelable;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.Date;

/**
 * Created by stephen.barnes on 3/21/14.
 */
public class Prediction implements Parcelable{

    public String stopId;
    public String stopName;
    public Integer stopSeconds;

    public Prediction() {}

    public Prediction(JSONObject jsonData) {
        this.importDataFromJSON(jsonData);
    }

    public void importDataFromJSON(JSONObject jsonData) {
        try {
            this.stopId = jsonData.getString("StopID");
            this.stopName = jsonData.getString("Stop");
            this.stopSeconds = jsonData.getInt("Seconds");
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    public static Creator<Prediction> CREATOR = new Creator<Prediction>() {
        @Override
        public Prediction[] newArray(int size) {
            return new Prediction[size];
        }

        @Override
        public Prediction createFromParcel(Parcel source) {
            Prediction prediction = new Prediction();
            prediction.stopId = source.readString();
            prediction.stopName = source.readString();
            prediction.stopSeconds = source.readInt();
            return prediction;
        }
    };

    @Override
    public int describeContents() {
        return super.hashCode();
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(stopId);
        dest.writeString(stopName);
        dest.writeInt(stopSeconds);
    }
}
