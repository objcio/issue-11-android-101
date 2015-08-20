package com.example.androidforios.app.fragments;



import android.os.Bundle;
import android.support.v4.app.ListFragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;


import com.example.androidforios.app.adapters.PredictionArrayAdapter;
import com.example.androidforios.app.data.model.Prediction;
import com.example.androidforios.app.data.model.Trip;
import com.example.androidforios.app.views.TripDetailsView;

/**
 * A simple {@link android.support.v4.app.Fragment} subclass.
 * Use the {@link TripDetailFragment#newInstance} factory method to
 * create an instance of this fragment.
 *
 */
public class TripDetailFragment extends ListFragment {

    /**
     * The configuration flags for the Trip Detail Fragment.
     */
    public static final class TripDetailFragmentState {
        public static final String KEY_FRAGMENT_TRIP_DETAIL = "KEY_FRAGMENT_TRIP_DETAIL";
    }

    protected Trip mTrip;

    /**
     * Use this factory method to create a new instance of
     * this fragment using the provided parameters.
     *
     * @param trip the trip to show details
     * @return A new instance of fragment TripDetailFragment.
     */
    public static TripDetailFragment newInstance(Trip trip) {
        TripDetailFragment fragment = new TripDetailFragment();
        Bundle args = new Bundle();
        args.putParcelable(TripDetailFragmentState.KEY_FRAGMENT_TRIP_DETAIL, trip);
        fragment.setArguments(args);
        return fragment;
    }

    public TripDetailFragment() { }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {
            mTrip = getArguments().getParcelable(TripDetailFragmentState.KEY_FRAGMENT_TRIP_DETAIL);
        }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        Prediction[] predictions= mTrip.predictions.toArray(new Prediction[mTrip.predictions.size()]);
        PredictionArrayAdapter predictionArrayAdapter = new PredictionArrayAdapter(getActivity().getApplicationContext(), predictions);
        setListAdapter(predictionArrayAdapter);
        return super.onCreateView(inflater,container, savedInstanceState);
    }

    @Override
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        TripDetailsView headerView = new TripDetailsView(getActivity());
        headerView.updateFromTripObject(mTrip);
        getListView().addHeaderView(headerView);
    }
}
