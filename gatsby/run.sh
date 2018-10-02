#!/bin/sh

set -x
set -e

ssh-keyscan -t rsa github.com > /root/.ssh/known_hosts

cd /root/gatsby_projects

REPO_FOLDER=${TARGET_GIT_REPO_NAME}
#REPO_FOLDER=`echo ${TARGET_GIT_REPO} | sed -r 's#.*/(.*).git#\1#'`

rm -rf ${REPO_FOLDER}

git clone git@github.com:${TARGET_GIT_REPO_ORG}/${TARGET_GIT_REPO_NAME}.git

cd ${REPO_FOLDER}

node --version
npm --version
git --version
yarn --version
gatsby --version
gh-pages --version

rm -rf ${DOC_FOLDER}

gatsby new ${DOC_FOLDER} ${TEMPLATE_GIT_REPO}

cd ${DOC_FOLDER}

envsubst < "../../../config.tmp" > "./src/content/meta/config.js"
envsubst < "../../../package.tmp" > "package.json"

rm -rf ./src/content/docs

cp -r /root/content/docs ./src/content

cp -r /root/content/images ./src/content

rm ./src/content/meta/categories.js

cp /root/content/categories.js ./src/content/meta

if ! git diff-index --quiet HEAD --; then
    git add .
    git commit -m "Autocommit `date -u +'%Y-%m-%dT%H:%M:%SZ'`"
    git push
fi

gatsby build --prefix-paths

gh-pages -d public

ping 8.8.8.8
# gatsby develop --host=0.0.0.0
# rm -rf public
# gatsby build --prefixPaths
# gh-pages -d public

# gatsby info

# npm start
