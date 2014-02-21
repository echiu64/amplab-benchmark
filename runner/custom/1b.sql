DROP TABLE result;
CREATE TABLE result AS SELECT pageURL, pageRank FROM rankings WHERE pageRank > 100;
!./clear-cache.sh;
INSERT OVERWRITE TABLE result SELECT pageURL, pageRank FROM rankings WHERE pageRank > 100;
!./clear-cache.sh;
INSERT OVERWRITE TABLE result SELECT pageURL, pageRank FROM rankings WHERE pageRank > 100;
!./clear-cache.sh;
INSERT OVERWRITE TABLE result SELECT pageURL, pageRank FROM rankings WHERE pageRank > 100;
!./clear-cache.sh;
INSERT OVERWRITE TABLE result SELECT pageURL, pageRank FROM rankings WHERE pageRank > 100;
!./clear-cache.sh;

