START_DATE="2018-03-03"
COUNT=35
DAYS=14
FILE="README.md"

for ((i=0; i<$COUNT; i++)); do
  COMMIT_DATE=$(date -d "$START_DATE +$DAYS days" "+%Y-%m-%dT12:00:00")
  echo "$(date -d "$START_DATE +$DAYS days" "+%Y-%m-%d")" >> $FILE
  git add $FILE
  GIT_AUTHOR_DATE="$COMMIT_DATE" GIT_COMMITTER_DATE="$COMMIT_DATE" git commit -m "commit on $(date -d "$START_DATE +$DAYS days" "+%Y-%m-%d")"
done

echo "✅ Done generating fake commits."