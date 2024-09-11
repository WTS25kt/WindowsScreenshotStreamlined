function insertScreenshots() {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();
  var folder = DriveApp.getFolderById('1mt1k5OfP2NZh5DlnP0EQdlSc4rre4L8t'); // スクリーンショットが保存されているフォルダIDを指定
  var files = folder.getFiles();
  var row = 1;

  while (files.hasNext()) {
    var file = files.next();
    
    // ファイルを公開
    file.setSharing(DriveApp.Access.ANYONE_WITH_LINK, DriveApp.Permission.VIEW);
    
    var imageUrl = "https://drive.google.com/uc?export=view&id=" + file.getId();
    
    // 概要を挿入
    sheet.getRange(row, 1).setValue("クリック");
    row++;
    
    // 画像を挿入
    sheet.insertImage(imageUrl, 1, row);
    row += 20; // 画像の高さに応じて次の概要の位置を調整
  }
}