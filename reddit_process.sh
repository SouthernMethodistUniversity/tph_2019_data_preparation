echo "starting Postgres"
pg_ctl -D /nfsscratch/tph_myth/reddit_db -l logfile start &&

echo "running the awesome command"
#psql -h localhost -p 5432 --username=acambre -c "DROP TABLE reddit_new; SELECT comment->>'id' AS id, comment->>'ups' AS ups, comment->>'downs' AS downs, comment->>'parent_id' AS parent_id, comment->>'body' AS body, comment->>'subreddit_id' AS subreddit_id, comment->>'subreddit' AS subreddit, comment->>'link_id' AS link_id, CAST(comment->>'created_utc' AS integer) AS created_utc, to_timestamp(CAST(comment->>'created_utc' AS integer)) AT TIME ZONE 'UTC' AS created_utc_timestamp, comment->>'author' AS author, comment INTO TABLE reddit_new FROM reddit;" reddit &&
#psql -h localhost -p 5432 --username=acambre --file="/nfsscratch/tph_myth/data_sets/reddit_indexes_oopsie.sql" reddit &&
pg_dump reddit -Fc --table=reddit_new --compress=9 --file=/scratch/users/acambre/reddit.backup

echo "stopping postgres"
pg_ctl -D /nfsscratch/tph_myth/reddit_db stop
