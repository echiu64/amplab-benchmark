DROP TABLE result;
CREATE TABLE result AS SELECT SUBSTR(sourceIP, 1, 8), SUM(adRevenue) FROM uservisits GROUP BY SUBSTR(sourceIP, 1, 8);
!./clear-cache.sh;
INSERT OVERWRITE TABLE result SELECT SUBSTR(sourceIP, 1, 8), SUM(adRevenue) FROM uservisits GROUP BY SUBSTR(sourceIP, 1, 8);
!./clear-cache.sh;
INSERT OVERWRITE TABLE result SELECT SUBSTR(sourceIP, 1, 8), SUM(adRevenue) FROM uservisits GROUP BY SUBSTR(sourceIP, 1, 8);
!./clear-cache.sh;
INSERT OVERWRITE TABLE result SELECT SUBSTR(sourceIP, 1, 8), SUM(adRevenue) FROM uservisits GROUP BY SUBSTR(sourceIP, 1, 8);
!./clear-cache.sh;
INSERT OVERWRITE TABLE result SELECT SUBSTR(sourceIP, 1, 8), SUM(adRevenue) FROM uservisits GROUP BY SUBSTR(sourceIP, 1, 8);
!./clear-cache.sh;

