
/// Database ENUM
/// This Enum Contains our database URL and for each collection
/// We create a new field and pass the collection name as parameter
enum DbEnum {
  dbUrl("mongodb+srv://horse:horse@cluster0.qwtugl3.mongodb.net/horse?retryWrites=true&w=majority"),
  usersCollection("users"),
  horseCollection("horses");

  const DbEnum(this.value);

  /// As we are passing String parameter to our field
  /// We define a value field that we pass to the Constructor
  /// This allows us to pass String parameter to our Enum fields
  /// And to retrieve the Value we will do as below
  /// Eg : DbEnum.dbUrl.value this will return the String value specified in the parameter
  final String value;

}

