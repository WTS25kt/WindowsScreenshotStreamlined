tell application "Numbers"
    activate
    tell front document
        tell active sheet
            tell table 1
                set currentRow to 1
                set screenshotFolder to POSIX path of "/Users/shigoto/Desktop/" -- スクリーンショットのフォルダパス
                set screenshotFiles to list folder screenshotFolder without invisibles
                
                repeat with screenshotFile in screenshotFiles
                    if screenshotFile ends with ".png" then -- PNGファイルのみを対象
                        set screenshotPath to screenshotFolder & screenshotFile
                        set cell "A" & currentRow to "クリック" -- 概要を挿入
                        set currentRow to currentRow + 1
                        
                        -- 画像を挿入
                        set imageCell to cell "A" & currentRow
                        tell imageCell
                            set value to (screenshotPath as POSIX file)
                        end tell
                        set currentRow to currentRow + 20 -- 画像の高さに応じて次の概要の位置を調整
                    end if
                end repeat
            end tell
        end tell
    end tell
end tell