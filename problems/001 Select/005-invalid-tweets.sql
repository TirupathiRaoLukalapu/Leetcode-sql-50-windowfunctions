/*
------------------------------------------
Problem: 1683. Invalid Tweets
------------------------------------------
Question:
Find the tweet IDs where the content length is strictly greater than 15 characters.
------------------------------------------


Approach / Explanation:
1. Use the LENGTH() function to calculate the number of characters in each tweet.
2. Filter out the rows where LENGTH(content) > 15.
3. Select only the tweet_id column to return invalid tweets.
------------------------------------------
*/

SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;
