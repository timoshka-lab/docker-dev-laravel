# Introduction
このレポジトリーは社内専用となります。取引先や外部関係者のために公開しています。  
個別のお問い合わせやご要望にはお応えできかねますことをご了承下さい。

# Installation
## 自動インストール
```bash
cd [WORKING_DIR]
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/timoshka-lab/docker-dev-laravel-setup/main/setup.sh)"
```

## 手動インストール
```zsh
cd [WORKING_DIR]
curl -L https://github.com/timoshka-lab/docker-dev-laravel/archive/main.tar.gz | tar xvz -C ./ --strip-components=1
cp .env.example .env

# .envを編集

docker compose build
docker compose up -d
docker compose exec app /setup.sh [--version version] [--skip-laravel]

# 1. '/etc/hosts' ファイルを編集します。詳細はこちら：'docker compose logs web'
# 2. 'docker/nginx/certs' 内の 'server.crt' 証明書をキーチェーンに追加します。
# 3. "$APP_URL" で設定したURLをブラウザで確認できます。
# 4. Mailhogへのアクセスこちら：http://127.0.0.1:8025/.
# 5. プロジェクトの管理方法に応じて '.gitignore' ファイルを編集して下さい。
```

# Usage
```zsh
cd [WORKING_DIR]
docker compose up -d

# Do something...

docker compose down
```

# Notices
このプロジェクトは本番環境を想定していません。  
本番環境やステージング環境での利用は避けて下さい。  
目的外の利用による損害については一切の責任を負いません。

THIS PROJECT IS NOT INTENDED FOR PRODUCTION USE.  
DO NOT USE IT IN PRODUCTION OR STAGING ENVIRONMENT.  
IT IS ONLY FOR LOCAL DEVELOPMENT PURPOSES.
