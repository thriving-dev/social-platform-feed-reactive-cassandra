SELECT * FROM feed WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6';
SELECT * FROM feed WHERE feedname='thriving-dev';

-- Q0. [feed-post] get a single post by ID
SELECT *
FROM post
WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6'
  AND post_id='01HQ0FDQWBDSK3BZG99NR7JSE6';

-- Q1.a. [feed] get posts, paginated (clustering key default order: post_id DESC)
SELECT *
FROM post
WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6'
LIMIT 20;

-- Q1.b. [feed] get posts, paginated (clustering key default order: post_id DESC)
--        - all posts 'before' (timestamp) a certain post_id
SELECT *
FROM post
WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6'
  AND post_id<'01HQ0FDNEPZR1ES39JX8SHE54Q'
LIMIT 20;

-- Q2.a [post] get stats
SELECT *
FROM post_stats
WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6'
  AND post_id='01HQRE72RQ8RPHYDEAPGD9PZ8E';

-- Q2.b [post] get stats
SELECT *
FROM post_stats
WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6'
  AND post_id IN ('01HQ0FDQWBDSK3BZG99NR7JSE6',
                  '01HQ0FDPY867VHKMQGCMVFJFQW',
                  '01HQ0FDP3HVV04TFESMY5DJ1A5');

-- Q5.a. [feed] get 'new posts' count
-- ⚠️ DON'T DO THIS AT HOME: using COUNT()
--    (note: see better query 5.b. below)
SELECT COUNT(*)
FROM post
WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6'
  AND post_id>='01HQ0FDNEPZR1ES39JX8SHE54Q';

-- Q5.b. [feed] get 'new posts' count
-- 🧐 avoids COUNT() -> query IDs with upper LIMIT,
--    manually count rows returned in client
SELECT post_id
FROM post
WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6'
  AND post_id>='01HQ0FDNEPZR1ES39JX8SHE54Q'
LIMIT 1000; -- display like: '1'; '721'; '>1000'

// -- Q3.a. [post<>user] get session-user likes for post
// SELECT *
// FROM user_likes_post
// WHERE user_id='01HPWGWY9C0K2YH7PZGC4XSBHZ'
//   AND post_id='01HQ0FDQWBDSK3BZG99NR7JSE6';

// -- Q3.b. [post<>user] get session-user has bookmarked post
// SELECT *
// FROM user_bookmarked_post
// WHERE user_id='01HPWGWY9C0K2YH7PZGC4XSBHZ'
//   AND post_id='01HQ0FDQWBDSK3BZG99NR7JSE6';

-- Q3.c. [post<>user] get specific session-user relations for post
SELECT *
FROM user_x_post_rel
WHERE user_id='01HPWGWY9C0K2YH7PZGC4XSBHZ'
  AND rel_type='LIKE'
  AND post_id='01HQ0FDQWBDSK3BZG99NR7JSE6';

-- Q3.d. [post<>user] get any session-user relations for post
SELECT *
FROM user_x_post_rel
WHERE user_id='01HPWGWY9C0K2YH7PZGC4XSBHZ'
  AND rel_type IN ('LIKE', 'BOOKMARK')
  AND post_id='01HQ0FDQWBDSK3BZG99NR7JSE6';

-- Q3.e. [post<>user] get session-user relations
-- fetch for all posts in current 'page' at once
SELECT *
FROM user_x_post_rel
WHERE user_id='01HPWGWY9C0K2YH7PZGC4XSBHZ'
  AND rel_type IN ('LIKE', 'BOOKMARK')
  AND post_id IN ('01HQ0FDQWBDSK3BZG99NR7JSE6',
                  '01HQ0FDPY867VHKMQGCMVFJFQW',
                  '01HQ0FDP3HVV04TFESMY5DJ1A5');

-- bonus: all likes for a particular user (any feed)
SELECT * FROM user_x_post_rel
WHERE user_id='01HPWGWY9C0K2YH7PZGC4XSBHZ'
  AND rel_type='LIKE';


-- Q4.a. [post] get author
SELECT *
FROM user
WHERE user_id='01HPWGWY9C0K2YH7PZGC4XSBHZ';

SELECT * FROM user WHERE user_id IN ('01HPWGWY9C0K2YH7PZGC4XSBHZ','01HPWG2T869DBCS8W74W6XAVTE');
