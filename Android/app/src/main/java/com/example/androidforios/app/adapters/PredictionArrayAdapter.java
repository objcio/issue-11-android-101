package com.example.androidforios.app.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import com.example.androidforios.app.R;
import com.example.androidforios.app.data.model.Prediction;

/**
 * An {@link android.widget.ArrayAdapter} that adapts {@link com.example.androidforios.app.data.model.Prediction} model
 * objects to {@code view_three_item_list_view} views.
 */
public class PredictionArrayAdapter extends ArrayAdapter<Prediction> {

    int LAYOUT_RESOURCE_ID = R.layout.view_three_item_list_view;

    public PredictionArrayAdapter(Context context) {
        super(context, R.layout.view_three_item_list_view);
    }

    public PredictionArrayAdapter(Context context, Prediction[] objects) {
        super(context, R.layout.view_three_item_list_view, objects);
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent)
    {
        Prediction prediction = this.getItem(position);
        View inflatedView = convertView;
        if(convertView==null)
        {
            LayoutInflater inflater = (LayoutInflater)getContext().getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            inflatedView = inflater.inflate(LAYOUT_RESOURCE_ID, parent, false);
        }

        TextView stopNameTextView = (TextView)inflatedView.findViewById(R.id.view_three_item_list_view_left_text_view);
        TextView middleTextView = (TextView)inflatedView.findViewById(R.id.view_three_item_list_view_middle_text_view);
        TextView stopSecondsTextView = (TextView)inflatedView.findViewById(R.id.view_three_item_list_view_right_text_view);

        stopNameTextView.setText(prediction.stopName);
        middleTextView.setVisibility(View.GONE);
        stopSecondsTextView.setText(prediction.stopSeconds.toString());

        return inflatedView;
    }
}
