public class SearchQuery {

  //api_key here
  private String apikey = "73ccf5d56f771e4429753f456f9ae8ac";

  private String searchQuery;
  private String searchFilter;
  private int numPages;

  // Constructor
  public SearchQuery(String qu, int n) {
    searchQuery = qu;
    numPages = n;
    //narrows search
    searchFilter = "sourceResource.title=";
  }

  // Search function
  public JSONArray search() {
    String queryURL = "";

    //search query 
    queryURL = "http://api.dp.la/v2/items?" + searchFilter + searchQuery + "&sourceResource.description=planet+OR+Planet" + "&api_key=" + apikey + "&page_size=" + numPages;

    println("Search: " + queryURL);

    JSONObject dplaData = loadJSONObject(queryURL);

    JSONArray results = dplaData.getJSONArray("docs");  

    return results;
  }
}