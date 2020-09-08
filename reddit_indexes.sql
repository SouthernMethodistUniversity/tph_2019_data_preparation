-- this adds a key and indexes to the reddit_new table

ALTER TABLE public.reddit_new
    ADD CONSTRAINT id_key PRIMARY KEY (id);

CREATE INDEX ups_index
    ON public.reddit_new USING btree
    (ups ASC NULLS LAST)
    TABLESPACE pg_default;

CREATE INDEX downs_index
    ON public.reddit_new USING btree
    (downs ASC NULLS LAST)
    TABLESPACE pg_default;

CREATE INDEX parent_id_index
    ON public.reddit_new USING btree
    (parent_id ASC NULLS LAST)
    TABLESPACE pg_default;

CREATE INDEX body_index
    ON public.reddit_new USING gist
    (body)
    TABLESPACE pg_default;

CREATE INDEX subreddit_index
    ON public.reddit_new USING btree
    (subreddit ASC NULLS LAST)
    TABLESPACE pg_default;

CREATE INDEX subreddit_id_index
    ON public.reddit_new USING btree
    (subreddit_id ASC NULLS LAST)
    TABLESPACE pg_default;

CREATE INDEX link_id_index
    ON public.reddit_new USING btree
    (link_id ASC NULLS LAST)
    TABLESPACE pg_default;

CREATE INDEX created_utc_index
    ON public.reddit_new USING btree
    (created_utc ASC NULLS LAST)
    TABLESPACE pg_default;

CREATE INDEX created_utc_timestamp_index
    ON public.reddit_new USING btree
    (created_utc_timestamp ASC NULLS LAST)
    TABLESPACE pg_default;

CREATE INDEX author_index
    ON public.reddit_new USING btree
    (author ASC NULLS LAST)
    TABLESPACE pg_default;

CREATE INDEX comment_index
    ON public.reddit_new USING gin
    (comment)
    TABLESPACE pg_default;