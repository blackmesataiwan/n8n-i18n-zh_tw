#!/bin/sh

# Define common paths as variables
N8N_PATH="/usr/local/lib/node_modules/n8n"
UI_ASSETS_PATH="${N8N_PATH}/node_modules/n8n-editor-ui/dist/assets"
UI_INDEX_PATH="${N8N_PATH}/node_modules/n8n-editor-ui/dist/index.html"

# Copy files to destination
cp ./patch_lang.js ${UI_ASSETS_PATH}/
cp ./langs/zh-TW.json ${UI_ASSETS_PATH}/

# Add script tag to index.html
sed -i '/<script type="module" crossorigin src="\/{{BASE_PATH}}\/assets\/patch_lang.js"><\/script>/!s/<\/head>/<script type="module" crossorigin src="\/{{BASE_PATH}}\/assets\/patch_lang.js"><\/script>\n<\/head>/g' ${UI_INDEX_PATH}
