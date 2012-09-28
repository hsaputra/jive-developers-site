import com.jivesoftware.developers.feeds.JiveCommunityRssFetcher;

/**
 * Main Test Class
 */
public class MainTest {

  public static void main(String[] args) {
    System.out.println("Hello World");

    JiveCommunityRssFetcher fetcher = new JiveCommunityRssFetcher("https://community.jivesoftware.com/blogs");

    try {
      fetcher.getFeedsFromJiveContentType("jivetalks", "posts");
    } catch (Exception e) {
      e.printStackTrace();
    }

  }
}
