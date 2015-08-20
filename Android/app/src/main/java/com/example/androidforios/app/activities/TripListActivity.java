package com.example.androidforios.app.activities;

import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.MenuItem;

import com.example.androidforios.app.R;
import com.example.androidforios.app.data.model.Trip;
import com.example.androidforios.app.data.model.TripList;
import com.example.androidforios.app.fragments.TripListFragment;
import com.example.androidforios.app.fragments.TripListFragment.TripListFragmentInteractionListener;

/**
 * An {@link android.app.Activity} class that shows a list of trips for a
 * subway line.
 *
 * Created by Stephen Barnes on 3/23/14.
 */
public class TripListActivity extends AppCompatActivity implements TripListFragmentInteractionListener {

    /**
     * Create an {@link Intent} to launch a new {@link TripListActivity} for a particular subway line.
     * @param context The {@link Context} used to create the {@link Intent}.
     * @param lineType The subway line to show trips for.
     * @return A {@link Intent} that can be used to start a new {@link TripListActivity}.
     */
    public static Intent getTripListActivityIntent(Context context, TripList.LineType lineType) {
        Intent intent = new Intent(context, TripListActivity.class);
        intent.putExtra(TripListActivityState.KEY_ACTIVITY_TRIP_LIST_LINE_TYPE, lineType.getLineName());
        return intent;
    }

    /**
     * A class containing the keys used for storing objects on the {@link TripListActivity}.
     */
    public static final class TripListActivityState {
        public static final String KEY_ACTIVITY_TRIP_LIST_LINE_TYPE = "KEY_ACTIVITY_TRIP_LIST_LINE_TYPE";
    }

    TripList.LineType mLineType;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        // Restore the instance variable from the extra on activity create
        mLineType = TripList.LineType.getLineType(getIntent().getStringExtra(TripListActivityState.KEY_ACTIVITY_TRIP_LIST_LINE_TYPE));
        setTheme(mLineType.getLineThemeResourceId());

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_trip_list);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        setTitle(mLineType.getLineName());

        if (savedInstanceState == null) {
            TripListFragment tripListFragment = TripListFragment.newInstance(mLineType);
            getSupportFragmentManager().beginTransaction()
                    .add(R.id.activity_trip_list_container, tripListFragment)
                    .commit();
        }
    }

    /**
     * Create and show the {@link TripDetailActivity} for a particular trip.
     * @param trip The {@link Trip} to show details for.
     */
    public void onTripSelected(Trip trip) {
        Intent tripDetailIntent = TripDetailActivity.getTripDetailActivityIntent(this, trip, mLineType);
        startActivity(tripDetailIntent);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case android.R.id.home:
                setResult(RESULT_CANCELED);
                finish();

                if (android.os.Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP){
                    overridePendingTransition(R.anim.abc_fade_in, R.anim.abc_fade_out);
                }

                return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
