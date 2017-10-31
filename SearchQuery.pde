public class SearchQuery {

  //Please put in your own api_key here. This page explains how you get one: http://dp.la/info/developers/codex/policies/#get-a-key
  private String apikey = "73ccf5d56f771e4429753f456f9ae8ac";

  private String searchQuery;
  private String searchFilter;
  private int numPages;

  // Constructor
  public SearchQuery(String qu, int n) {
    searchQuery = qu;
    numPages = n;
    //Use this filter to narrow your search. This API page is going to be your biggest help: http://dp.la/info/developers/codex/requests/
    searchFilter = "sourceResource.title=";
  }

  // Search function
  public JSONArray search() {
    String queryURL = "";

    //Modify search query here. You will need to string query parameters together to get the JSON file you want.
    queryURL = "http://api.dp.la/v2/items?" + searchFilter + searchQuery + "&sourceResource.description=planet+OR+Planet" + "&api_key=" + apikey + "&page_size=" + numPages;

    println("Search: " + queryURL);

    JSONObject dplaData = loadJSONObject(queryURL);

    JSONArray results = dplaData.getJSONArray("docs");  

    return results;
  }
}

