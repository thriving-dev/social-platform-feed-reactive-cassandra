CREATE KEYSPACE IF NOT EXISTS "poc" WITH replication = {'class':'SimpleStrategy', 'replication_factor' : 1};

USE poc;


-- Tables related to `users`
CREATE TABLE user (
    user_id       text,
    username      text,
    password_hash text,
    name          text,
    avatar_url    text,
    created_at    timestamp,
    updated_at    timestamp,
    PRIMARY KEY (user_id)
);


-- Tables related to `feeds`
CREATE TABLE feed (
    feed_id     text,
    feedname    text,
    description text,
    created_at  timestamp,
    updated_at  timestamp,
    PRIMARY KEY (feed_id)
);

CREATE INDEX ON feed (feedname);


-- Tables related to `posts`
CREATE TABLE post (
    feed_id    text,
    post_id    text,
    user_id    text,
    text       text,
    created_at timestamp,
    PRIMARY KEY (feed_id, post_id)
) WITH CLUSTERING ORDER BY (post_id DESC);

-- -- out-of-scope: list all posts of a user (any feed)
-- CREATE MATERIALIZED VIEW post_by_user_mview AS
-- SELECT *
-- FROM post
-- WHERE user_id IS NOT NULL
--   AND feed_id IS NOT NULL
--   AND post_id IS NOT NULL
-- PRIMARY KEY (user_id, post_id, feed_id);

-- out-of-scope: list all posts of a user for a particular feed
CREATE MATERIALIZED VIEW post_by_user_feed_mview AS
SELECT *
FROM post
WHERE user_id IS NOT NULL
  AND feed_id IS NOT NULL
  AND post_id IS NOT NULL
PRIMARY KEY ((user_id, feed_id), post_id);

CREATE TABLE post_stats (
    feed_id     text,
    post_id     text,
    impressions counter,
    bookmarked  counter,
    likes       counter,
    replies     counter,
    PRIMARY KEY (feed_id, post_id)
) WITH CLUSTERING ORDER BY (post_id DESC);


-- Tables related to relations between `users` and `posts`
CREATE TABLE user_x_post_rel (
    user_id    text,
    rel_type   text,
    post_id    text,
    created_at timestamp,
    PRIMARY KEY (user_id, rel_type, post_id)
) WITH CLUSTERING ORDER
    BY (rel_type ASC, post_id DESC);

-- -- out-of-scope: e.g. query all user likes for a specific post
-- CREATE MATERIALIZED VIEW post_x_user_rel_mview AS
-- SELECT *
-- FROM user_x_post_rel
-- WHERE post_id IS NOT NULL
--   AND rel_type IS NOT NULL
--   AND user_id IS NOT NULL
-- PRIMARY KEY (post_id, rel_type, user_id);

