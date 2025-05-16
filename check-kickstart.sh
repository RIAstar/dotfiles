echo -e '[dot] Checking for updates on nvim.kickstart\n'

REPO=nvim-lua/kickstart.nvim
RESOURCE=https://api.github.com/repos/$REPO/commits
COMMIT_URL=https://github.com/$REPO/commit

REF_HASH=$(git l --grep='\[nvim\] kickstart:' -1 | \
  sed -nE 's|.*/commit/([0-9a-f]{40}).*|\1|p')

echo Last cherry-picked commit: $REF_HASH

REF_DATE=$(curl -s "$RESOURCE/$REF_HASH" \
  -H "Accept: application/vnd.github.v3+json" \
  | jq -r '.commit.committer.date')

echo -e on $(date -u -d $REF_DATE) '\n'

REF_DATE=$(date -u -d "$REF_DATE + 1 second" +"%Y-%m-%dT%H:%M:%SZ")

RESULTS=$(curl -s "$RESOURCE?sha=master&since=$REF_DATE" \
  -H "Accept: application/vnd.github.v3+json" \
  | jq -r '.[] | "\(.commit.committer.date | split("T")[0]) - \(.commit.message | split("\n")[0])\n'"$COMMIT_URL"'/\(.sha)\n"')

if [ -n "$RESULTS" ]; then
  echo -e $RESULTS
else
  echo No new commits!
fi
