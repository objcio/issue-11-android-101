package com.example.androidforios.app.views;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.Build;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.example.androidforios.app.R;
import com.example.androidforios.app.data.model.Trip;

/**
 * Created by stephen.barnes on 3/25/14.
 */
public class TripDetailsView extends LinearLayout {
    TextView mDestnationTextView, mLatitudeTextView, mLongitudeTextView, mHeadingTextView;

    public TripDetailsView(Context context) {
        super(context);
        init(context);
    }

    private void init(Context context) {
        setOrientation(VERTICAL);
        LayoutInflater.from(context).inflate(R.layout.view_trip_detail, this);

        int padding = getResources().getDimensionPixelOffset(R.dimen.Padding_VeryLarge);
        this.setPadding(padding, padding, padding, padding);
        this.setBackgroundResource(R.color.Header_Background);

        mDestnationTextView = (TextView) findViewById(R.id.view_trip_detail_destination_text_view);
        mLatitudeTextView = (TextView) findViewById(R.id.view_trip_detail_latitude_text_view);
        mLongitudeTextView = (TextView) findViewById(R.id.view_trip_detail_longitude_text_view);
        mHeadingTextView = (TextView) findViewById(R.id.view_trip_detail_heading_text_view);
    }

    public void updateFromTripObject(Trip trip) {
        mDestnationTextView.setText(trip.destination);
        mLatitudeTextView.setText(trip.positionLat.toString());
        mLongitudeTextView.setText(trip.positionLong.toString());
        mHeadingTextView.setText(trip.positionHeading.toString());
    }

}
