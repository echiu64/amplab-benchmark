DROP TABLE result;
CREATE TABLE result AS SELECT pageURL, pageRank FROM rankings WHERE pageRank > 1000;
INSERT OVERWRITE TABLE result SELECT pageURL, pageRank FROM rankings WHERE pageRank > 1000;
INSERT OVERWRITE TABLE result SELECT pageURL, pageRank FROM rankings WHERE pageRank > 1000;
INSERT OVERWRITE TABLE result SELECT pageURL, pageRank FROM rankings WHERE pageRank > 1000;
