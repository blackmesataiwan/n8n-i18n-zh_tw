# N8N 正體中文化補丁

這個專案提供了N8N的正體中文(zh-TW)介面翻譯補丁。

## 安裝方式

### 使用官方Docker映像檔

如果你正在使用官方的N8N Docker映像檔，請按照以下步驟操作(範例container name為n8n)：

1. 將所有補丁檔案複製到容器內：
```bash
docker cp . n8n:/tmp/n8n-i18n-zh_tw/
```

2. 進入容器(請用root)：
```bash
docker exec -it -u root n8n sh
```

3. 進入補丁目錄：
```bash
cd /tmp/n8n-i18n-zh_tw/
```

4. 給予patch.sh執行權限：
```bash
chmod +x patch.sh
```

5. 執行補丁腳本：
```bash
./patch.sh
```

6. 重啟容器：
```bash
exit
docker restart n8n
```

### 其他架設方式

如果你使用其他方式架設N8N，你需要根據你的環境修改patch.sh中的路徑變數：

```bash
# 修改以下路徑變數以符合你的環境
N8N_PATH="/usr/local/lib/node_modules/n8n"  # N8N的安裝路徑
UI_ASSETS_PATH="${N8N_PATH}/node_modules/n8n-editor-ui/dist/assets"  # n8n-editor-ui的assets目錄
UI_INDEX_PATH="${N8N_PATH}/node_modules/n8n-editor-ui/dist/index.html"  # n8n-editor-ui的index.html檔案
```

修改完成後，執行patch.sh即可完成安裝。

## 翻譯說明

- 翻譯內容基於官方倉庫的英文翻譯檔案：[en.json](https://github.com/n8n-io/n8n/blob/master/packages/frontend/editor-ui/src/plugins/i18n/locales/en.json)
- 使用gemma3:4b/qwen3:8b模型進行翻譯，使用[繁化姬](https://zhconvert.org/)進行用語修正，可能存在不完整或錯誤的部分，歡迎自行修改優化
- 目前nodes的相關文字尚未進行翻譯

## 注意事項

- 安裝補丁後必須重啟N8N服務才能生效
- 建議在安裝補丁前先備份相關檔案
