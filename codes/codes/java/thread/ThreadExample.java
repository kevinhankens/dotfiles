import java.io.*;

public class ThreadExample {

  public static void main(String[] args) {
    for (int i = 0; i < 10; i++) {
      new MyThread(i).start();
    } 
  }

  private static class MyThread extends Thread {

    private int number;
  
    public MyThread(int number) {
      this.number = number;
    }

    public void run() {
      int t = (10 - number) * 1000;
      System.out.println("Sleep thread " + number + "\n");
      try {
        Thread.sleep(t);
      }
      catch (InterruptedException e) {
      }
      System.out.println("Finish thread " + number + "\n");    
    }

  }

}
