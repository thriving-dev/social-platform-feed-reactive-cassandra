USE poc;

INSERT INTO feed (feed_id, feedname, description, created_at, updated_at)
VALUES ('01HPWG2T821KXLA7TECS8W74W6', 'thriving-dev', 'Learning Resources for Software Architects and Engineers.', toTimestamp(now()), toTimestamp(now()));

INSERT INTO user (user_id, username, name, avatar_url, password_hash, created_at, updated_at)
VALUES ('01HPWG2T869DBCS8W74W6XAVTE', 'hartmut', 'Hartmut', '/avatars/hartmut.webp',
        '$2y$10$gXL9SDUK.ZH2E375HfwgGO6DoDkjOW4ruZj/jmAliex0Ht5Ayk21u', toTimestamp(now()), toTimestamp(now()));

INSERT INTO user (user_id, username, name, avatar_url, password_hash, created_at, updated_at)
VALUES ('01HPWGWY9C0K2YH7PZGC4XSBHZ', 'ada', 'Ada', '/avatars/ada.webp',
        '$2y$10$G72166MdkXDFdWaL1oRJl.zY/euunbmO4L.kDQPFUiyBnz4LDB3Iy', toTimestamp(now()), toTimestamp(now()));

INSERT INTO user (user_id, username, name, avatar_url, password_hash, created_at, updated_at)
VALUES ('01HQRDYSDWTA6HQ4STVKJ64TJA', 'peter', 'Peter', '/avatars/peter.webp',
        '$2y$10$G72166MdkXDFdWaL1oRJl.zY/euunbmO4L.kDQPFUiyBnz4LDB3Iy', toTimestamp(now()), toTimestamp(now()));

INSERT INTO user (user_id, username, name, avatar_url, password_hash, created_at, updated_at)
VALUES ('01HQRDZGBD2GKAZRMC6GTZTCZJ', 'totoro', 'Totoro', '/avatars/totoro.webp',
        '$2y$10$G72166MdkXDFdWaL1oRJl.zY/euunbmO4L.kDQPFUiyBnz4LDB3Iy', toTimestamp(now()), toTimestamp(now()));

INSERT INTO user (user_id, username, name, avatar_url, password_hash, created_at, updated_at)
VALUES ('01HQRDZGBD2GKAZRMC6GTZTCZJ', 'kiki', 'Kiki', '/avatars/kiki.webp',
        '$2y$10$G72166MdkXDFdWaL1oRJl.zY/euunbmO4L.kDQPFUiyBnz4LDB3Iy', toTimestamp(now()), toTimestamp(now()));

INSERT INTO user (user_id, username, name, avatar_url, password_hash, created_at, updated_at)
VALUES ('01HQRE17YXHGR4TKCNRBDJPQZ8', 'mimi', 'Mimi', '/avatars/mimi.webp',
        '$2y$10$G72166MdkXDFdWaL1oRJl.zY/euunbmO4L.kDQPFUiyBnz4LDB3Iy', toTimestamp(now()), toTimestamp(now()));

INSERT INTO user (user_id, username, name, avatar_url, password_hash, created_at, updated_at)
VALUES ('01HQRE1NDV0JMB71XCT47R9HTZ', 'momo', 'Momo', '/avatars/momo.webp',
        '$2y$10$G72166MdkXDFdWaL1oRJl.zY/euunbmO4L.kDQPFUiyBnz4LDB3Iy', toTimestamp(now()), toTimestamp(now()));

INSERT INTO user (user_id, username, name, avatar_url, password_hash, created_at, updated_at)
VALUES ('01HQRE22SE972X31F984ECWBRW', 'nana', 'Nana', '/avatars/nana.webp',
        '$2y$10$G72166MdkXDFdWaL1oRJl.zY/euunbmO4L.kDQPFUiyBnz4LDB3Iy', toTimestamp(now()), toTimestamp(now()));

INSERT INTO user (user_id, username, name, avatar_url, password_hash, created_at, updated_at)
VALUES ('01HQRE27HGZ1HFBS66F6WWHD1T', 'tim', 'Tim', '/avatars/tim.webp',
        '$2y$10$G72166MdkXDFdWaL1oRJl.zY/euunbmO4L.kDQPFUiyBnz4LDB3Iy', toTimestamp(now()), toTimestamp(now()));

INSERT INTO user (user_id, username, name, avatar_url, password_hash, created_at, updated_at)
VALUES ('01HQRE2YKE2628J739ZKDNMRSY', 'tom', 'Tom', '/avatars/tom.webp',
        '$2y$10$G72166MdkXDFdWaL1oRJl.zY/euunbmO4L.kDQPFUiyBnz4LDB3Iy', toTimestamp(now()), toTimestamp(now()));

INSERT INTO user (user_id, username, name, avatar_url, password_hash, created_at, updated_at)
VALUES ('01HQRE2Z8FNCJFHC7VDWY2KT4H', 'jerry', 'Jerry', '/avatars/jerry.webp',
        '$2y$10$G72166MdkXDFdWaL1oRJl.zY/euunbmO4L.kDQPFUiyBnz4LDB3Iy', toTimestamp(now()), toTimestamp(now()));

INSERT INTO post (feed_id, post_id, user_id, text, created_at)
VALUES ('01HPWG2T821KXLA7TECS8W74W6', '01HPWGRZPEC12W49MV4RZ157FV', '01HPWG2T869DBCS8W74W6XAVTE', 'Hello World!', toTimestamp(now()));
INSERT INTO post (feed_id, post_id, user_id, text, created_at)
VALUES ('01HPWG2T821KXLA7TECS8W74W6', '01HQ0FC4S1PKP9EFGXA0R42FYK', '01HPWGWY9C0K2YH7PZGC4XSBHZ', 'Quarkus is amazing!', toTimestamp(now()));
INSERT INTO post (feed_id, post_id, user_id, text, created_at)
VALUES ('01HPWG2T821KXLA7TECS8W74W6', '01HQ0FC6ZTPZDQ9J2KXTK7MWJR', '01HPWG2T869DBCS8W74W6XAVTE', 'Mutini is great!', toTimestamp(now()));
INSERT INTO post (feed_id, post_id, user_id, text, created_at)
VALUES ('01HPWG2T821KXLA7TECS8W74W6', '01HQ0FCDJJFZ3KFTJYDMQHYRX1', '01HPWGWY9C0K2YH7PZGC4XSBHZ', 'Foo bar!', toTimestamp(now()));
INSERT INTO post (feed_id, post_id, user_id, text, created_at)
VALUES ('01HPWG2T821KXLA7TECS8W74W6', '01HQ0FDNEPZR1ES39JX8SHE54Q', '01HPWGWY9C0K2YH7PZGC4XSBHZ', 'This is a demo!', toTimestamp(now()));
INSERT INTO post (feed_id, post_id, user_id, text, created_at)
VALUES ('01HPWG2T821KXLA7TECS8W74W6', '01HQ0FDP3HVV04TFESMY5DJ1A5', '01HPWG2T869DBCS8W74W6XAVTE', 'Hello Ada!', toTimestamp(now()));
INSERT INTO post (feed_id, post_id, user_id, text, created_at)
VALUES ('01HPWG2T821KXLA7TECS8W74W6', '01HQ0FDPY867VHKMQGCMVFJFQW', '01HPWG2T869DBCS8W74W6XAVTE', 'Lorem Ipsum!', toTimestamp(now()));
INSERT INTO post (feed_id, post_id, user_id, text, created_at)
VALUES ('01HPWG2T821KXLA7TECS8W74W6', '01HQ0FDQWBDSK3BZG99NR7JSE6', '01HPWG2T869DBCS8W74W6XAVTE', 'bla bla bla', toTimestamp(now()));
INSERT INTO post (feed_id, post_id, user_id, text, created_at)
VALUES ('01HPWG2T821KXLA7TECS8W74W6', '01HQRE2ZSW0ER6RWJAXSZDC8H7', '01HQRE2Z8FNCJFHC7VDWY2KT4H', 'Lorem Ipsum!', toTimestamp(now()));
INSERT INTO post (feed_id, post_id, user_id, text, created_at)
VALUES ('01HPWG2T821KXLA7TECS8W74W6', '01HQRE5C66S1YMTR58P2T4R6M5', '01HQRE2YKE2628J739ZKDNMRSY', 'bla bla bla', toTimestamp(now()));

INSERT INTO post (feed_id, post_id, user_id, text, created_at)
VALUES ('01HPWG2T821KXLA7TECS8W74W6', '01HQRE62Z27757N1D172S1G98Z', '01HQRE27HGZ1HFBS66F6WWHD1T', 'Hello World!', toTimestamp(now()));
INSERT INTO post (feed_id, post_id, user_id, text, created_at)
VALUES ('01HPWG2T821KXLA7TECS8W74W6', '01HQRE69JSRPGXB9RWHHTF70RA', '01HQRDZGBD2GKAZRMC6GTZTCZJ', 'Quarkus is amazing!', toTimestamp(now()));
INSERT INTO post (feed_id, post_id, user_id, text, created_at)
VALUES ('01HPWG2T821KXLA7TECS8W74W6', '01HQRE6A81GHG8NZ569D5HKF08', '01HQRDYSDWTA6HQ4STVKJ64TJA', 'Mutini is great!', toTimestamp(now()));
INSERT INTO post (feed_id, post_id, user_id, text, created_at)
VALUES ('01HPWG2T821KXLA7TECS8W74W6', '01HQRE6AW5Z0Q2RPYE9G1CADS0', '01HQRE27HGZ1HFBS66F6WWHD1T', 'Foo bar!', toTimestamp(now()));
INSERT INTO post (feed_id, post_id, user_id, text, created_at)
VALUES ('01HPWG2T821KXLA7TECS8W74W6', '01HQRE6N9F3AZAG4PZAKAH94Z5', '01HPWGWY9C0K2YH7PZGC4XSBHZ', 'This is a demo!', toTimestamp(now()));
INSERT INTO post (feed_id, post_id, user_id, text, created_at)
VALUES ('01HPWG2T821KXLA7TECS8W74W6', '01HQRE6P2PY3VJNBM3Z23YQ8YM', '01HPWG2T869DBCS8W74W6XAVTE', 'Hello Ada!', toTimestamp(now()));
INSERT INTO post (feed_id, post_id, user_id, text, created_at)
VALUES ('01HPWG2T821KXLA7TECS8W74W6', '01HQRE6PKPVW6NWSA3X9WQDHEW', '01HQRDZGBD2GKAZRMC6GTZTCZJ', 'Lorem Ipsum!', toTimestamp(now()));
INSERT INTO post (feed_id, post_id, user_id, text, created_at)
VALUES ('01HPWG2T821KXLA7TECS8W74W6', '01HQRE71R9177F7RBF3EVAAHK6', '01HQRE1NDV0JMB71XCT47R9HTZ', 'bla bla bla', toTimestamp(now()));
INSERT INTO post (feed_id, post_id, user_id, text, created_at)
VALUES ('01HPWG2T821KXLA7TECS8W74W6', '01HQRE7282ZV9NVJQH1SV2BY90', '01HQRE2Z8FNCJFHC7VDWY2KT4H', 'Lorem Ipsum!', toTimestamp(now()));
INSERT INTO post (feed_id, post_id, user_id, text, created_at)
VALUES ('01HPWG2T821KXLA7TECS8W74W6', '01HQRE72RQ8RPHYDEAPGD9PZ8E', '01HQRE2YKE2628J739ZKDNMRSY', 'bla bla bla', toTimestamp(now()));

UPDATE post_stats SET impressions = impressions+1 WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6' AND post_id='01HPWGRZPEC12W49MV4RZ157FV';
UPDATE post_stats SET bookmarked = bookmarked+1 WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6' AND post_id='01HPWGRZPEC12W49MV4RZ157FV';
UPDATE post_stats SET impressions = impressions+11 WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6' AND post_id='01HQ0FC4S1PKP9EFGXA0R42FYK';
UPDATE post_stats SET likes = likes+11 WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6' AND post_id='01HQ0FC4S1PKP9EFGXA0R42FYK';
UPDATE post_stats SET impressions = impressions+2 WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6' AND post_id='01HQ0FC6ZTPZDQ9J2KXTK7MWJR';
UPDATE post_stats SET replies = replies+4 WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6' AND post_id='01HQ0FC6ZTPZDQ9J2KXTK7MWJR';
UPDATE post_stats SET impressions = impressions+12 WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6' AND post_id='01HQ0FCDJJFZ3KFTJYDMQHYRX1';
UPDATE post_stats SET impressions = impressions+5 WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6' AND post_id='01HQ0FDNEPZR1ES39JX8SHE54Q';
UPDATE post_stats SET impressions = impressions+19 WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6' AND post_id='01HQ0FDP3HVV04TFESMY5DJ1A5';
UPDATE post_stats SET impressions = impressions+41 WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6' AND post_id='01HQ0FDPY867VHKMQGCMVFJFQW';
UPDATE post_stats SET impressions = impressions+83 WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6' AND post_id='01HQ0FDQWBDSK3BZG99NR7JSE6';
UPDATE post_stats SET impressions = impressions+83 WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6' AND post_id='01HQRE2ZSW0ER6RWJAXSZDC8H7';
UPDATE post_stats SET impressions = impressions+3 WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6' AND post_id='01HQRE5C66S1YMTR58P2T4R6M5';
UPDATE post_stats SET impressions = impressions+43 WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6' AND post_id='01HQRE62Z27757N1D172S1G98Z';
UPDATE post_stats SET impressions = impressions+82 WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6' AND post_id='01HQRE69JSRPGXB9RWHHTF70RA';
UPDATE post_stats SET impressions = impressions+22 WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6' AND post_id='01HQRE6A81GHG8NZ569D5HKF08';
UPDATE post_stats SET impressions = impressions+33 WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6' AND post_id='01HQRE6AW5Z0Q2RPYE9G1CADS0';
UPDATE post_stats SET impressions = impressions+46 WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6' AND post_id='01HQRE6N9F3AZAG4PZAKAH94Z5';
UPDATE post_stats SET impressions = impressions+63 WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6' AND post_id='01HQRE6P2PY3VJNBM3Z23YQ8YM';
UPDATE post_stats SET impressions = impressions+1 WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6' AND post_id='01HQRE6PKPVW6NWSA3X9WQDHEW';
UPDATE post_stats SET impressions = impressions+35 WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6' AND post_id='01HQRE71R9177F7RBF3EVAAHK6';
UPDATE post_stats SET impressions = impressions+23 WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6' AND post_id='01HQRE7282ZV9NVJQH1SV2BY90';
UPDATE post_stats SET impressions = impressions+8965 WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6' AND post_id='01HQRE72RQ8RPHYDEAPGD9PZ8E';
UPDATE post_stats SET replies = replies+7 WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6' AND post_id='01HQRE72RQ8RPHYDEAPGD9PZ8E';
UPDATE post_stats SET likes = likes+42 WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6' AND post_id='01HQRE72RQ8RPHYDEAPGD9PZ8E';
UPDATE post_stats SET bookmarked = bookmarked+3 WHERE feed_id='01HPWG2T821KXLA7TECS8W74W6' AND post_id='01HQRE72RQ8RPHYDEAPGD9PZ8E';

INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWGWY9C0K2YH7PZGC4XSBHZ', 'LIKE', '01HPWGRZPEC12W49MV4RZ157FV', toTimestamp(now()));
INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWGWY9C0K2YH7PZGC4XSBHZ', 'LIKE', '01HQ0FDNEPZR1ES39JX8SHE54Q', toTimestamp(now()));
INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWGWY9C0K2YH7PZGC4XSBHZ', 'BOOKMARK', '01HQ0FDNEPZR1ES39JX8SHE54Q', toTimestamp(now()));
INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWGWY9C0K2YH7PZGC4XSBHZ', 'BOOKMARK', '01HQ0FDQWBDSK3BZG99NR7JSE6', toTimestamp(now()));
INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWG2T869DBCS8W74W6XAVTE', 'LIKE', '01HQ0FDNEPZR1ES39JX8SHE54Q', toTimestamp(now()));
INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWG2T869DBCS8W74W6XAVTE', 'LIKE', '01HQ0FC6ZTPZDQ9J2KXTK7MWJR', toTimestamp(now()));


INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWGWY9C0K2YH7PZGC4XSBHZ', 'LIKE', '01HQ0FDQWBDSK3BZG99NR7JSE6', toTimestamp(now()));
INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWGWY9C0K2YH7PZGC4XSBHZ', 'LIKE', '01HQRE2ZSW0ER6RWJAXSZDC8H7', toTimestamp(now()));
INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWGWY9C0K2YH7PZGC4XSBHZ', 'LIKE', '01HQRE5C66S1YMTR58P2T4R6M5', toTimestamp(now()));
INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWGWY9C0K2YH7PZGC4XSBHZ', 'LIKE', '01HQRE62Z27757N1D172S1G98Z', toTimestamp(now()));
INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWGWY9C0K2YH7PZGC4XSBHZ', 'LIKE', '01HQRE69JSRPGXB9RWHHTF70RA', toTimestamp(now()));
INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWGWY9C0K2YH7PZGC4XSBHZ', 'LIKE', '01HQRE6A81GHG8NZ569D5HKF08', toTimestamp(now()));
INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWGWY9C0K2YH7PZGC4XSBHZ', 'LIKE', '01HQRE6AW5Z0Q2RPYE9G1CADS0', toTimestamp(now()));
INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWGWY9C0K2YH7PZGC4XSBHZ', 'LIKE', '01HQRE6N9F3AZAG4PZAKAH94Z5', toTimestamp(now()));
INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWGWY9C0K2YH7PZGC4XSBHZ', 'LIKE', '01HQRE6P2PY3VJNBM3Z23YQ8YM', toTimestamp(now()));
INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWGWY9C0K2YH7PZGC4XSBHZ', 'LIKE', '01HQRE6PKPVW6NWSA3X9WQDHEW', toTimestamp(now()));
INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWGWY9C0K2YH7PZGC4XSBHZ', 'LIKE', '01HQRE71R9177F7RBF3EVAAHK6', toTimestamp(now()));
INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWGWY9C0K2YH7PZGC4XSBHZ', 'LIKE', '01HQRE7282ZV9NVJQH1SV2BY90', toTimestamp(now()));
INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWGWY9C0K2YH7PZGC4XSBHZ', 'LIKE', '01HQRE72RQ8RPHYDEAPGD9PZ8E', toTimestamp(now()));
INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWGWY9C0K2YH7PZGC4XSBHZ', 'BOOKMARK', '01HQ0FDQWBDSK3BZG99NR7JSE6', toTimestamp(now()));
INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWGWY9C0K2YH7PZGC4XSBHZ', 'BOOKMARK', '01HQRE2ZSW0ER6RWJAXSZDC8H7', toTimestamp(now()));
INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWGWY9C0K2YH7PZGC4XSBHZ', 'BOOKMARK', '01HQRE5C66S1YMTR58P2T4R6M5', toTimestamp(now()));
INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWGWY9C0K2YH7PZGC4XSBHZ', 'BOOKMARK', '01HQRE62Z27757N1D172S1G98Z', toTimestamp(now()));
INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWGWY9C0K2YH7PZGC4XSBHZ', 'BOOKMARK', '01HQRE69JSRPGXB9RWHHTF70RA', toTimestamp(now()));
INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWGWY9C0K2YH7PZGC4XSBHZ', 'BOOKMARK', '01HQRE6A81GHG8NZ569D5HKF08', toTimestamp(now()));
INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWGWY9C0K2YH7PZGC4XSBHZ', 'BOOKMARK', '01HQRE6AW5Z0Q2RPYE9G1CADS0', toTimestamp(now()));
INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWGWY9C0K2YH7PZGC4XSBHZ', 'BOOKMARK', '01HQRE6N9F3AZAG4PZAKAH94Z5', toTimestamp(now()));
INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWGWY9C0K2YH7PZGC4XSBHZ', 'BOOKMARK', '01HQRE6P2PY3VJNBM3Z23YQ8YM', toTimestamp(now()));
INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWGWY9C0K2YH7PZGC4XSBHZ', 'BOOKMARK', '01HQRE6PKPVW6NWSA3X9WQDHEW', toTimestamp(now()));
INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWGWY9C0K2YH7PZGC4XSBHZ', 'BOOKMARK', '01HQRE71R9177F7RBF3EVAAHK6', toTimestamp(now()));
INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWGWY9C0K2YH7PZGC4XSBHZ', 'BOOKMARK', '01HQRE7282ZV9NVJQH1SV2BY90', toTimestamp(now()));
INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWGWY9C0K2YH7PZGC4XSBHZ', 'BOOKMARK', '01HQRE72RQ8RPHYDEAPGD9PZ8E', toTimestamp(now()));
INSERT INTO user_x_post_rel (user_id, rel_type, post_id, created_at) VALUES ('01HPWGWY9C0K2YH7PZGC4XSBHZ', 'BOOKMARK', '01HQ0FCDJJFZ3KFTJYDMQHYRX1', toTimestamp(now()));

