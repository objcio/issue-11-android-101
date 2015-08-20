package com.example.androidforios.app.data.managers;

import android.content.Context;

import com.example.androidforios.app.data.model.TripList;

import org.json.JSONException;

import java.io.BufferedReader;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.json.JSONObject;

import android.content.res.AssetManager;
import android.support.v4.content.AsyncTaskLoader;

/**
 * Created by stephen.barnes on 3/23/14.
 */
public class DataManager {

    private static final DataManager INSTANCE = new DataManager();
    public static DataManager getSharedInstance() { return INSTANCE; }

    public static String stringFromAssetFolder(String fileName, Context context) throws IOException {
        AssetManager manager = context.getAssets();
        InputStream file = manager.open(fileName);
        return readStream(file);
    }

    /**
     * Utility method for pulling plain text from an InputStream object
     * @param in InputStream object retrieved from an HttpResponse
     * @return String contents of stream
     */
    public static String readStream(InputStream in)
    {
        BufferedReader reader = new BufferedReader(new InputStreamReader(in));
        StringBuilder sb = new StringBuilder();
        String line = null;
        try
        {
            while((line = reader.readLine()) != null)
            {
                sb.append(line + "\n");
            }
        }
        catch(Exception ex) { }
        finally
        {
            safeClose(in);
            safeClose(reader);
        }
        return sb.toString();
    }

    /**
     * Safely closes the given {@link Closeable} without throwing
     * any exceptions due to null pointers or {@link IOException}s.
     * @param closeable The {@link Closeable} to close.
     */
    public static void safeClose(Closeable closeable)
    {
        if(closeable != null)
        {
            try
            {
                closeable.close();
            }
            catch (IOException e) { }
        }
    }

    /**
     * Asynchronously load a JSON file with MBTA subway data in the background.
     *
     * @author Stephen Barnes
     */
    public static class SubwayLineLoader extends AsyncTaskLoader<TripList> {

        protected TripList.LineType mLineType;

        public SubwayLineLoader(Context context, TripList.LineType lineType) {
            super(context);
            mLineType = lineType;
        }

        @Override
        public TripList loadInBackground() {
            TripList tripList = new TripList();

            try {
                String subwayLineJSONString = stringFromAssetFolder(mLineType.getFileName(), this.getContext());

                try {
                    JSONObject jsonData = new JSONObject(subwayLineJSONString);
                    tripList.importDataFromJSON(jsonData.getJSONObject("TripList"));
                } catch (JSONException e) {
                    e.printStackTrace();
                }

            } catch (IOException e) {
                e.printStackTrace();
            }

            return tripList;
        }
    }
}
