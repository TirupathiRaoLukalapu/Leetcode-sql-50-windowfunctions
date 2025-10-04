-- 584. Find Customer Referee
-- Solution: Select customers not referred OR referred by someone other than id=2

select name
from customer
where  referee_id !=2 or referee_id is NULL