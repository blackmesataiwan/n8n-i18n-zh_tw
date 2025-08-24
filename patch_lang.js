const app = document.querySelector('#app[data-v-app]').__vue_app__;

const provides = app._context.provides;

const keys = Reflect.ownKeys(provides);

let i18nInstance = null;

for (const key of keys) {
  if (typeof key === 'symbol') {
    const value = provides[key];
    if (
      value &&
      value.global &&
      typeof value.global.setLocaleMessage === 'function'
    ) {
      i18nInstance = value;
      console.log('Found i18n instance:', i18nInstance);
      break;
    }
  }
}

if (i18nInstance && i18nInstance.global) {
  const i18n = i18nInstance.global;
  const response = await fetch('/assets/zh-TW.json');
  const translations = await response.json();

  i18n.setLocaleMessage('zh-TW', translations);

  if ('locale' in i18n) {
    i18n.locale = 'zh-TW';
  }

  if ('$i18n' in app.config.globalProperties) {
    app.config.globalProperties.$i18n.locale = 'zh-TW';
  }
}
