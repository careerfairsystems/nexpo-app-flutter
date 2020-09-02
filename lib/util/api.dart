class Api {
  static const String liveURL = "arkad-nexpo.herokuapp.com/api";
  static const String localURL = "http://localhost:4000/api";

  //Switch baseURL to switch between local backend and live backend.
  static const String baseURL = localURL;
  static const String login = baseURL + "/login";
}
