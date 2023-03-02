package main.java.com.web.upbit;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;

import main.java.com.web.dto.upbit.UpOrders;
import main.java.com.web.dto.upbit.UpOrdersCallBack;
import main.java.com.web.dto.upbit.UpbitMarket;
import main.java.com.web.dto.upbit.UpbitTicker;
import main.java.com.web.dto.upbit.UpbitUser;
import main.java.com.web.dto.upbit.UpbitUserAccount;

public class UpCmd {
	public List<UpbitUserAccount> GetAccounts(UpbitUser upbitUser) {
		String accessKey = upbitUser.getAccess_key();
        String secretKey = upbitUser.getSecret_key();
        String serverUrl = "https://api.upbit.com";
        
        Algorithm algorithm = Algorithm.HMAC256(secretKey);
        String jwtToken = JWT.create()
                .withClaim("access_key", accessKey)
                .withClaim("nonce", UUID.randomUUID().toString())
                .sign(algorithm);

        String authenticationToken = "Bearer " + jwtToken;

        try {
            HttpClient client = HttpClientBuilder.create().build();
            HttpGet request = new HttpGet(serverUrl + "/v1/accounts");
            request.setHeader("Content-Type", "application/json");
            request.addHeader("Authorization", authenticationToken);

            HttpResponse response = client.execute(request);
            HttpEntity entity = response.getEntity();
            //System.out.println(EntityUtils.toString(entity, "UTF-8"));            
            return new Gson().fromJson(EntityUtils.toString(entity, "UTF-8"), new TypeToken<List<UpbitUserAccount>>() {}.getType());
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        return new ArrayList<UpbitUserAccount>();
	}
	
	public List<UpbitMarket> GetMarketAll() throws IOException {
		OkHttpClient client = new OkHttpClient();

		Request request = new Request.Builder()
		  .url("https://api.upbit.com/v1/market/all?isDetails=false")
		  .get()
		  .addHeader("accept", "application/json")
		  .build();

		Response response = client.newCall(request).execute();
		if(response.code() == 200) {
			return new Gson().fromJson(response.body().string(), new TypeToken<List<UpbitMarket>>() {}.getType());	
		}
		
		return new ArrayList<UpbitMarket>();
	}
	
	public List<UpbitTicker> GetTicket(String market) throws IOException {	
		if(market.substring(0, 3).equals("KRW")) { // 한쿡 인거만
			OkHttpClient client = new OkHttpClient();

			Request request = new Request.Builder()
			  .url("https://api.upbit.com/v1/ticker?markets="+market)
			  .get()
			  .addHeader("accept", "application/json")
			  .build();

			Response response = client.newCall(request).execute();			
			if(response.code() == 200) {			
				return new Gson().fromJson(response.body().string(), new TypeToken<List<UpbitTicker>>() {}.getType());	
			}
		}
		
		return new ArrayList<UpbitTicker>();		
	}
	
	public UpOrdersCallBack PostOrders(UpbitUser upbitUser, UpOrders upOrders) throws IOException, NoSuchAlgorithmException {	
		String accessKey = upbitUser.getAccess_key();
        String secretKey = upbitUser.getSecret_key();
        String serverUrl = "https://api.upbit.com";

        HashMap<String, String> params = new HashMap<>();
        params.put("market", upOrders.getMarket());
        params.put("side", upOrders.getSide());
        params.put("volume", upOrders.getVolume());
        params.put("price", upOrders.getPrice());
        params.put("ord_type", upOrders.getOrd_type());
        params.put("identifier", UUID.randomUUID().toString());
        
        ArrayList<String> queryElements = new ArrayList<>();
        for(Map.Entry<String, String> entity : params.entrySet()) {
            queryElements.add(entity.getKey() + "=" + entity.getValue());
        }

        String queryString = String.join("&", queryElements.toArray(new String[0]));

        MessageDigest md = MessageDigest.getInstance("SHA-512");
        md.update(queryString.getBytes("UTF-8"));

        String queryHash = String.format("%0128x", new BigInteger(1, md.digest()));

        Algorithm algorithm = Algorithm.HMAC256(secretKey);
        String jwtToken = JWT.create()
                .withClaim("access_key", accessKey)
                .withClaim("nonce", UUID.randomUUID().toString())
                .withClaim("query_hash", queryHash)
                .withClaim("query_hash_alg", "SHA512")
                .sign(algorithm);

        String authenticationToken = "Bearer " + jwtToken;

        try {
            HttpClient client = HttpClientBuilder.create().build();
            HttpPost request = new HttpPost(serverUrl + "/v1/orders");
            request.setHeader("Content-Type", "application/json");
            request.addHeader("Authorization", authenticationToken);
            request.setEntity(new StringEntity(new Gson().toJson(params)));

            HttpResponse response = client.execute(request);
            HttpEntity entity = response.getEntity();

            //System.out.println(EntityUtils.toString(entity, "UTF-8"));
            return new Gson().fromJson(EntityUtils.toString(entity, "UTF-8"), UpOrdersCallBack.class);
        } catch (IOException e) {
            e.printStackTrace();
        }	
        return null;
	}
	
	public UpOrdersCallBack PostOrdersCancel(UpbitUser upbitUser, UpOrders upOrders) throws IOException, NoSuchAlgorithmException {	
		String accessKey = upbitUser.getAccess_key();
        String secretKey = upbitUser.getSecret_key();
        String serverUrl = "https://api.upbit.com";
        
        HashMap<String, String> params = new HashMap<>();
        params.put("uuid", upOrders.getUuid());

        ArrayList<String> queryElements = new ArrayList<>();
        for(Map.Entry<String, String> entity : params.entrySet()) {
            queryElements.add(entity.getKey() + "=" + entity.getValue());
        }

        String queryString = String.join("&", queryElements.toArray(new String[0]));

        MessageDigest md = MessageDigest.getInstance("SHA-512");
        md.update(queryString.getBytes("UTF-8"));

        String queryHash = String.format("%0128x", new BigInteger(1, md.digest()));

        Algorithm algorithm = Algorithm.HMAC256(secretKey);
        String jwtToken = JWT.create()
                .withClaim("access_key", accessKey)
                .withClaim("nonce", UUID.randomUUID().toString())
                .withClaim("query_hash", queryHash)
                .withClaim("query_hash_alg", "SHA512")
                .sign(algorithm);

        String authenticationToken = "Bearer " + jwtToken;

        try {
            HttpClient client = HttpClientBuilder.create().build();
            HttpDelete request = new HttpDelete(serverUrl + "/v1/order?" + queryString);
            request.setHeader("Content-Type", "application/json");
            request.addHeader("Authorization", authenticationToken);

            HttpResponse response = client.execute(request);
            HttpEntity entity = response.getEntity();

            return new Gson().fromJson(EntityUtils.toString(entity, "UTF-8"), UpOrdersCallBack.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
	}

	public List<UpOrdersCallBack> PostOrdersStatus(UpbitUser upbitUser, UpOrders upOrders) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		String accessKey = upbitUser.getAccess_key();
        String secretKey = upbitUser.getSecret_key();
        String serverUrl = "https://api.upbit.com";

        HashMap<String, String> params = new HashMap<>();
        params.put("state", upOrders.getState());

        String[] uuids = upOrders.getUuids().stream().toArray(String[]::new);

        ArrayList<String> queryElements = new ArrayList<>();
        for(Map.Entry<String, String> entity : params.entrySet()) {
            queryElements.add(entity.getKey() + "=" + entity.getValue());
        }
        for(String uuid : uuids) {
            queryElements.add("uuids[]=" + uuid);
        }

        String queryString = String.join("&", queryElements.toArray(new String[0]));

        MessageDigest md = MessageDigest.getInstance("SHA-512");
        md.update(queryString.getBytes("UTF-8"));

        String queryHash = String.format("%0128x", new BigInteger(1, md.digest()));

        Algorithm algorithm = Algorithm.HMAC256(secretKey);
        String jwtToken = JWT.create()
                .withClaim("access_key", accessKey)
                .withClaim("nonce", UUID.randomUUID().toString())
                .withClaim("query_hash", queryHash)
                .withClaim("query_hash_alg", "SHA512")
                .sign(algorithm);

        String authenticationToken = "Bearer " + jwtToken;

        try {
            HttpClient client = HttpClientBuilder.create().build();
            HttpGet request = new HttpGet(serverUrl + "/v1/orders?" + queryString);
            request.setHeader("Content-Type", "application/json");
            request.addHeader("Authorization", authenticationToken);

            HttpResponse response = client.execute(request);
            HttpEntity entity = response.getEntity();

            return new Gson().fromJson(EntityUtils.toString(entity, "UTF-8"), new TypeToken<List<UpOrdersCallBack>>() {}.getType());
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        return new ArrayList<UpOrdersCallBack>();
	}
}
