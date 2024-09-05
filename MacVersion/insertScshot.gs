
function insertScreenshots() {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();
  var folder = DriveApp.getFolderById('YOUR_FOLDER_ID'); // スクリーンショットが保存されているフォルダIDを指定
  var files = folder.getFiles();
  var row = 1;

  while (files.hasNext()) {
    var file = files.next();
    var imageUrl = "https://drive.google.com/uc?export=view&id=" + file.getId();
    
    // 概要を挿入
    sheet.getRange(row, 1).setValue("クリック");
    row++;
    
    // 画像を挿入
    sheet.insertImage(imageUrl, 1, row);
    row += 20; // 画像の高さに応じて次の概要の位置を調整
  }
}
