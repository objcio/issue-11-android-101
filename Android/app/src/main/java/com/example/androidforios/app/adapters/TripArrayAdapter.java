package com.example.androidforios.app.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import com.example.androidforios.app.data.model.Trip;
import com.example.androidforios.app.R;

import java.text.DateFormat;

/**
 * An {@link android.widget.ArrayAdapter} that adapts {@link com.example.androidforios.app.data.model.Trip}
 * model objects for {@code view_three_item_list_view} Views.
 */
public class TripArrayAdapter extends ArrayAdapter<Trip> {

    int LAYOUT_RESOURCE_ID = R.layout.view_three_item_list_view;

    public TripArrayAdapter(Context context) {
        super(context, R.layout.view_three_item_list_view);
    }

    public TripArrayAdapter(Context context, Trip[] objects) {
        super(context, R.layout.view_three_item_list_view, objects);
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent)
    {
        Trip trip = this.getItem(position);
        View inflatedView = convertView;
        if(convertView==null)
        {
            LayoutInflater inflater = (LayoutInflater)getContext().getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            inflatedView = inflater.inflate(LAYOUT_RESOURCE_ID, parent, false);
        }

        TextView destinationTextView = (TextView)inflatedView.findViewById(R.id.view_three_item_list_view_left_text_view);
        TextView timeStampTextView = (TextView)inflatedView.findViewById(R.id.view_three_item_list_view_middle_text_view);
        TextView trainNameTextView = (TextView)inflatedView.findViewById(R.id.view_three_item_list_view_right_text_view);

        destinationTextView.setText(trip.destination);
        if (trip.positionTimeStamp != null) {
            timeStampTextView.setText(DateFormat.getDateTimeInstance().format(trip.positionTimeStamp));
            timeStampTextView.setVisibility(View.VISIBLE);
        } else {
            timeStampTextView.setVisibility(View.GONE);
        }
        trainNameTextView.setText(trip.trainName);

        return inflatedView;
    }
}
