package com.beans;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.math.stat.correlation.Covariance;

public class ExtractData {

	private List<Double> prices = new ArrayList<>();
	public double[] getDataArray(String fileName)throws IOException
    {
        BufferedReader br = new BufferedReader(new FileReader(fileName));
        String line = "";
        prices = new ArrayList<>();
        int row = 0;
        while((line=br.readLine())!=null)
        {
            if(row==0)
            {
                row++;
                continue;
            }
            String[] data = line.split(",");
            prices.add(Double.parseDouble(data[5]));
        }
        List<Double> returns = new ArrayList<>();
        for(int i=0;i<prices.size()-1;i++)
        {
            double ret = (prices.get(i+1)-prices.get(i))/prices.get(i);
            returns.add(ret);
        }
        double[] listToArray = new double[returns.size()];
        for(int i=0;i<returns.size();i++)
            listToArray[i] = returns.get(i);
        return listToArray;
    }
	public List<Double> getPrices() {
		return prices;
	}
	
}
