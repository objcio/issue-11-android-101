package com.example.androidforios.app.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import com.example.androidforios.app.data.model.TripList;

/**
 * An {@link android.widget.ArrayAdapter} which formats {@link com.example.androidforios.app.data.model.TripList.LineType}
 * subway line enumerated values into listview views based on {@code simple_list_item_1}.
 */
public class LineTypeArrayAdapter extends ArrayAdapter<TripList.LineType> {

    int LAYOUT_RESOURCE_ID = android.R.layout.simple_list_item_1;

    public LineTypeArrayAdapter(Context context, TripList.LineType[] objects) {
        super(context, android.R.layout.simple_list_item_1, objects);
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent)
    {
        TripList.LineType lineType = this.getItem(position);
        View inflatedView = convertView;
        if(convertView==null)
        {
            LayoutInflater inflater = (LayoutInflater)getContext().getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            inflatedView = inflater.inflate(LAYOUT_RESOURCE_ID, null);
        }

        TextView title = (TextView)inflatedView.findViewById(android.R.id.text1);
        title.setText(lineType.getLineName());
        title.setTextColor(getContext().getResources().getColor(lineType.getLineColorResourceId()));

        return inflatedView;
    }
}
