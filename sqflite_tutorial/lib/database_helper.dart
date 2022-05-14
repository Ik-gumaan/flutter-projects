class DatabaseHelper{


static final dbName="myDB.db";
static final dbVersion=1;

static final tableName="myTable";
static final columnId="id";
static final columnName="name";


// DatabaseHelper db=new DatabaseHelper();

DatabaseHelper._privateConstructor();
static final DatabaseHelper instance = DatabaseHelper._privateConstructor();


static Database database;


Future<Database> get database async{
if(database  != null){
return database;
}

database= await initaiteDatabase();
return database;
}

// INITAITE DATABASE
initaiteDatabase() async{
  Directory directory=await getApplicationDocumentsDirectory();
  String path= join(directory.path,dbName);
  return await openDatabase(path,version:dbVersion,onCreate:onCreateFunc);

}


// CREATE DATABASE
Future onCreateFunc(Database db, int version) async{
  db.execute(
    '''
    CREATE TABLE $tableName (
    $columnId INTEGER PRIMARY KEY,
    $columnName TEXT NOT NULL
    )  
    '''
    );
}


// INSERT DATA INTO DATABASE
Future<int> insertFunc(Map<String,dynamic> row) async{

Database db= await instance.database;
return await db.insert(tableName,row);

}


// GET ALL DATA FROM DATABASE
Future<List<Map<String,dynamic>>> getAllFunc() async{

Database db= await instance.database;
return await db.query(tableName);

}


// UPDATE DATA FROM DATABASE
Future<int> updateFunc(Map<String,dynamic> row) async{

Database db= await instance.database;
int id=row[columnId];
return await db.update(
  tableName,
  row,
where:'$columnId = ?,' 
whereArgs:[id]
);

}


// DELETE DATA FROM DATABASE
Future<int> deleteFunc(int id) async{

Database db= await instance.database;
return await db.delete(
  tableName,
where:'$columnId = ?,' 
whereArgs:[id]
);

}


}