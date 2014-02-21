DROP TABLE IF EXISTS url_counts_partial;
CREATE TABLE url_counts_partial AS SELECT TRANSFORM (line) USING "python /tmp/url_count.py" as (sourcePage,destPage, count) from documents;
DROP TABLE IF EXISTS url_counts_total;
CREATE TABLE url_counts_total AS SELECT SUM(count) AS totalCount, destpage FROM url_counts_partial GROUP BY destpage;

DROP TABLE IF EXISTS url_counts_partial;
CREATE TABLE url_counts_partial AS SELECT TRANSFORM (line) USING "python /tmp/url_count.py" as (sourcePage,destPage, count) from documents;
DROP TABLE IF EXISTS url_counts_total;
CREATE TABLE url_counts_total AS SELECT SUM(count) AS totalCount, destpage FROM url_counts_partial GROUP BY destpage;


DROP TABLE IF EXISTS url_counts_partial;
CREATE TABLE url_counts_partial AS SELECT TRANSFORM (line) USING "python /tmp/url_count.py" as (sourcePage,destPage, count) from documents;
DROP TABLE IF EXISTS url_counts_total;
CREATE TABLE url_counts_total AS SELECT SUM(count) AS totalCount, destpage FROM url_counts_partial GROUP BY destpage;


DROP TABLE IF EXISTS url_counts_partial;
CREATE TABLE url_counts_partial AS SELECT TRANSFORM (line) USING "python /tmp/url_count.py" as (sourcePage,destPage, count) from documents;
DROP TABLE IF EXISTS url_counts_total;
CREATE TABLE url_counts_total AS SELECT SUM(count) AS totalCount, destpage FROM url_counts_partial GROUP BY destpage;


DROP TABLE IF EXISTS url_counts_partial;
CREATE TABLE url_counts_partial AS SELECT TRANSFORM (line) USING "python /tmp/url_count.py" as (sourcePage,destPage, count) from documents;
DROP TABLE IF EXISTS url_counts_total;
CREATE TABLE url_counts_total AS SELECT SUM(count) AS totalCount, destpage FROM url_counts_partial GROUP BY destpage;

