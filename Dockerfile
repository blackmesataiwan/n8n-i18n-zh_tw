FROM docker.n8n.io/n8nio/n8n:next

ENV UI_ASSETS_PATH="/usr/local/lib/node_modules/n8n/node_modules/n8n-editor-ui/dist/assets"
ENV UI_INDEX_PATH="/usr/local/lib/node_modules/n8n/node_modules/n8n-editor-ui/dist/index.html"

USER root

COPY ./patch_lang.js ${UI_ASSETS_PATH}/
COPY ./langs/zh-TW.json ${UI_ASSETS_PATH}/

RUN sed -i \
  '/<script type="module" crossorigin src="\/{{BASE_PATH}}\/assets\/patch_lang.js"><\/script>/!s/<\/head>/<script type="module" crossorigin src="\/{{BASE_PATH}}\/assets\/patch_lang.js"><\/script>\n<\/head>/g' \
  ${UI_INDEX_PATH}

USER node