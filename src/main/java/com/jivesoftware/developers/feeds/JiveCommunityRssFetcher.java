package com.jivesoftware.developers.feeds;

import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.fetcher.FeedFetcher;
import com.sun.syndication.fetcher.FetcherException;
import com.sun.syndication.fetcher.impl.FeedFetcherCache;
import com.sun.syndication.fetcher.impl.HashMapFeedInfoCache;
import com.sun.syndication.fetcher.impl.HttpURLFeedFetcher;
import com.sun.syndication.io.FeedException;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * Main class that wil use Rome to fetch RSS feeds from Jive Community
 */
public class JiveCommunityRssFetcher {
  public static final String DEFAULT_JIVE_COMMUNITY_BASE_FEEDS_URL =
      "https://developers.jivesoftware.com/community";

  private static final String FEEDS = "feeds";
  private static final String SEARCH = "search";

  private static final String TAGS = "tags";
  private static final String TAGS_SEPARATOR = "AND";
  private static final String TAGS_ASSIGN = ":";

  private static final FeedFetcherCache feedInfoCache = HashMapFeedInfoCache.getInstance();

  private String communityBaseFeedUrl;
  private String container;
  private String content;
  private String searchParams;

  static JiveCommunityRssFetcher fetcherInstance;

  public static JiveCommunityRssFetcher getInstance() {
    if (fetcherInstance == null) {
      fetcherInstance = new JiveCommunityRssFetcher();
    }
    return fetcherInstance;
  }

  /**
   * Default constructor
   */
  public JiveCommunityRssFetcher() {
    this(DEFAULT_JIVE_COMMUNITY_BASE_FEEDS_URL);
  }

  public JiveCommunityRssFetcher(String baseURl) {
    this.communityBaseFeedUrl = baseURl;
  }

  /*  Bean accessors */

  public String getCommunityBaseFeedUrl() {
    return communityBaseFeedUrl;
  }

  public void setCommunityBaseFeedUrl(String communityBaseFeedUrl) {
    this.communityBaseFeedUrl = communityBaseFeedUrl;
  }

  public String getSearchParams() {
    return searchParams;
  }

  public void setSearchParams(String searchParams) {
    this.searchParams = searchParams;
  }

  public String getContainer() {
    return container;
  }

  public void setContainer(String container) {
    this.container = container;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  /**
   * Bean accessor for feeds from content and container.
   *
   * @return feeds
   * @throws IOException
   * @throws FeedException
   * @throws FetcherException
   */
  public List<SyndEntry> getContentFeeds() throws IOException, FeedException, FetcherException {
    SyndFeed feed = this.getFeedsFromJiveContentType(container, content);
    if(feed == null || feed.getEntries() == null) {
      return Collections.emptyList();
    } else {
      return (List<SyndEntry>) feed.getEntries();
    }
  }

  /**
   * Get RSS 2.0 feeds from a particular Jive content type
   *
   * @param container
   * @param content
   * @return An instance of {@link SyndFeed} or null if error happened
   * @throws MalformedURLException
   * @throws IOException
   * @throws FeedException
   * @throws FetcherException
   */
  public SyndFeed getFeedsFromJiveContentType(String container, String content)
      throws IOException, FeedException, FetcherException {

    StringBuilder feedUrlBuilder = new StringBuilder(communityBaseFeedUrl);
    feedUrlBuilder.append("/");
    feedUrlBuilder.append(container);
    feedUrlBuilder.append("/");
    feedUrlBuilder.append(FEEDS);
    feedUrlBuilder.append("/");
    feedUrlBuilder.append(content);

    SyndFeed feed = executeFeedUrl(feedUrlBuilder.toString());
    return feed;
  }

  /**
   * Bean accessor for getting search feed from search params
   * @return
   * @throws IOException
   * @throws FeedException
   * @throws FetcherException
   */
  public List<SyndEntry> getSearchFeeds() throws IOException, FeedException, FetcherException {
    SyndFeed feed = this.getFeedFromSearch(searchParams);
    if(feed == null || feed.getEntries() == null) {
      return Collections.emptyList();
    } else {
      return (List<SyndEntry>) feed.getEntries();
    }
  }

  /**
   * Use the search feeds endpoint to search feeds based on certain params
   *
   * @param encodedParams
   * @return An instance of {@link SyndFeed} or null if error happened
   * @throws IOException
   * @throws FeedException
   * @throws FetcherException
   */
  public SyndFeed getFeedsFromSearch(Map<String, String> encodedParams)
      throws IOException, FeedException, FetcherException {
    // construct the search params
    StringBuilder paramsBuilder = new StringBuilder(10);
    boolean first = true;
    for (Map.Entry<String, String> entry : encodedParams.entrySet()) {
      if(!first) {
        paramsBuilder.append("&");
      } else {
        first = false;
      }
      String key = entry.getKey();
      String value = entry.getValue();
      paramsBuilder.append(key);
      paramsBuilder.append("=");
      paramsBuilder.append(value);
    }

    return getFeedFromSearch(paramsBuilder.toString());
  }

  /**
   * Use the search feeds endpoint to search feeds based on certain params
   *
   * @param params
   * @return
   * @throws IOException
   * @throws FeedException
   * @throws FetcherException
   */
  public SyndFeed getFeedFromSearch(String params)
      throws IOException, FeedException, FetcherException {
    // construct base search URL
    StringBuilder feedUrlBuilder = new StringBuilder(communityBaseFeedUrl);
    feedUrlBuilder.append("/");
    feedUrlBuilder.append(FEEDS);
    feedUrlBuilder.append("/");
    feedUrlBuilder.append(SEARCH);
    feedUrlBuilder.append("?");
    feedUrlBuilder.append((params.isEmpty() ? "" : params));

    SyndFeed feed = executeFeedUrl(feedUrlBuilder.toString());
    return feed;
  }

  private SyndFeed executeFeedUrl(String feedUrl) throws IOException, FeedException, FetcherException {
    FeedFetcher feedFetcher = new HttpURLFeedFetcher(feedInfoCache);
    SyndFeed feed = feedFetcher.retrieveFeed(new URL(feedUrl));
    System.out.println(feed);

    return feed;
  }

  public static String buildUrlEncodedTagParam(List<String> tags) {
    StringBuilder tagsParamBuilder = new StringBuilder("q=");
    boolean first = true;
    for(String tag : tags) {
      StringBuilder tagParamBuilder = new StringBuilder(10);
      if(!first) {
        tagParamBuilder.append(" ");
        tagParamBuilder.append(TAGS_SEPARATOR);
        tagParamBuilder.append(" ");
      } else {
        first = false;
      }
      tagParamBuilder.append(TAGS);
      tagParamBuilder.append(TAGS_ASSIGN);
      tagParamBuilder.append(tag);

      tagsParamBuilder.append(tagParamBuilder.toString());
    }

    String urlEncodedTagParam = tagsParamBuilder.toString();
    try {
      urlEncodedTagParam = URLEncoder.encode(urlEncodedTagParam, "UTF-8");
    } catch (UnsupportedEncodingException e) {
      // Almost impossible to get here
      e.printStackTrace();
    }

    return urlEncodedTagParam;
  }
}
