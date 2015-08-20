package com.example.androidforios.app.activities;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.ActivityCompat;
import android.support.v4.app.ActivityOptionsCompat;
import android.support.v4.app.Fragment;
import android.support.v7.app.AppCompatActivity;
import android.view.Menu;
import android.view.MenuItem;

import com.example.androidforios.app.R;
import com.example.androidforios.app.data.model.TripList;
import com.example.androidforios.app.fragments.SubwayListFragment;
import com.example.androidforios.app.fragments.SubwayListFragment.SubwayLineFragmentInteractionListener;

/**
 * Class that is the primary entry point for the MBTA Subway Sample app.  It contains
 * one fragment that shows a list of subways to choose from.
 *
 * Created by Stephen Barnes on 3/23/14.
 */
public class MainActivity extends AppCompatActivity implements SubwayLineFragmentInteractionListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        if (savedInstanceState == null) {
            Fragment subwayListFragment = SubwayListFragment.newInstance();
            getSupportFragmentManager().beginTransaction()
                    .add(R.id.activity_main_container, subwayListFragment)
                    .commit();
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();
        return (id == R.id.action_about) || (super.onOptionsItemSelected(item));
    }

    /**
     * Move to the next activity after a user has selected a subway line.
     * @param lineType the subway line the user wants to see details for
     */
    public void onLineTypeSelected(TripList.LineType lineType) {
        Intent intent = TripListActivity.getTripListActivityIntent(getApplicationContext(), lineType);
        ActivityCompat.startActivity(this, intent, ActivityOptionsCompat.makeSceneTransitionAnimation(this).toBundle());
    }
}
