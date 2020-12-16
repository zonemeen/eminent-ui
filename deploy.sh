rm -rf dist &&
yarn build &&
cd dist &&
git init &&
git add . &&
git commit -m "update" &&
git branch -M master &&
git remote add origin git@gitee.com:miqilin21/eminent-ui.git &&
git push -f -u origin master &&
cd -
echo https://miqilin21.gitee.io/eminent-ui