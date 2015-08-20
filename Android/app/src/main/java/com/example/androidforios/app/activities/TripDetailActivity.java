package com.example.androidforios.app.activities;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.MenuItem;

import com.example.androidforios.app.R;
import com.example.androidforios.app.data.model.Trip;
import com.example.androidforios.app.data.model.TripList;
import com.example.androidforios.app.fragments.TripDetailFragment;

/**
 * An {@link android.app.Activity} class that shows a detailed list of predictions for a subway trip.
 *
 * Created by Stephen Barnes on 3/23/14.
 */
public class TripDetailActivity extends AppCompatActivity {

    /**
     * Create an Intent to launch a {@link TripDetailActivity} from a unique subway trip.
     * @param context The {@link Context} used to create the {@link Intent}.
     * @param trip The {@link Trip} to show the details of.
     * @param lineType The {@link TripList.LineType} the trip detail is a part of.
     * @return A {@link Intent} that can be used to start a new {@link TripDetailActivity}.
     */
    public static Intent getTripDetailActivityIntent(Context context, Trip trip, TripList.LineType lineType) {
        Intent intent = new Intent(context, TripDetailActivity.class);
        intent.putExtra(TripDetailActivityState.KEY_ACTIVITY_TRIP_OBJECT, trip);
        intent.putExtra(TripDetailActivityState.KEY_ACTIVITY_TRIP_DETAIL_LINE_TYPE, lineType.getLineName());
        return intent;
    }

    /**
     * A class containing the keys used for storing objects on the {@link TripDetailActivity}.
     */
    public static final class TripDetailActivityState {
        public static final String KEY_ACTIVITY_TRIP_OBJECT = "KEY_ACTIVITY_TRIP_OBJECT";
        public static final String KEY_ACTIVITY_TRIP_DETAIL_LINE_TYPE = "KEY_ACTIVITY_TRIP_DETAIL_LINE_TYPE";
    }

    Trip mTrip;
    TripList.LineType mLineType;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        mLineType = TripList.LineType.getLineType(getIntent().getStringExtra(TripDetailActivityState.KEY_ACTIVITY_TRIP_DETAIL_LINE_TYPE));
        setTheme(mLineType.getLineThemeResourceId());

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_trip_detail);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        // Restore the instance variable from the extra on activity create
        mTrip = getIntent().getParcelableExtra(TripDetailActivityState.KEY_ACTIVITY_TRIP_OBJECT);
        setTitle(mTrip.destination);

        if (savedInstanceState == null) {
            TripDetailFragment tripDetailFragment = TripDetailFragment.newInstance(mTrip);
            getSupportFragmentManager().beginTransaction()
                    .add(R.id.activity_trip_detail_container, tripDetailFragment)
                    .commit();
        }
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case android.R.id.home:
                setResult(RESULT_CANCELED);
                finish();
                return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
