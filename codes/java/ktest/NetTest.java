//package com.kevinhankens.text;

import java.io.Console;
import java.util.Arrays;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

public class NetTest {

  public static void main(String[] args) {
    String urlText = "http://kevinhankens.com";
    BufferedReader in = null;
    try {
      URL url = new URL(urlText);
      in = new BufferedReader(new InputStreamReader(url.openStream()));

      String inputLine;
      while ((inputLine = in.readLine()) != null) {
        System.out.println(inputLine);
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if (in != null) {
        try {
          in.close();
        } catch (IOException e) {
          e.printStackTrace();
        }
      }
    }
  }

}
