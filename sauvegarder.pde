int highscore;
PrintWriter output;
BufferedReader reader;
String line;



void importHighscore() {
  // Open the file from the createWriter()
  reader = createReader(highscoreFile);
  if (reader == null) {
    highscore = 0;
    return;
  }
  String line;
  try {
    line = reader.readLine();
  } catch (IOException e) {
    e.printStackTrace();
    line = null;
  }
  if (line != null) {
    highscore = int(line);
    println(highscore);
  }
  try {
    reader.close();
  } catch (IOException e) {
    e.printStackTrace();
  }
}

void updateHighscore() {
  if (highscore < score) {
    highscore = score;
    output = createWriter(highscoreFile);
    output.println(highscore);
    output.close(); 
  }
}
