//global variable resources for the file

List<String> list = [];

//add item to the list
void addItem(String title) => list.add(title);
//fetch list length
int listLength() => list.length;
//fetch list
get items => list;
