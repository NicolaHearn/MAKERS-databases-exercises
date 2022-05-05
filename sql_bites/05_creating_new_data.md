# Creating new data

_**This is a Makers Bite.** Bites are designed to train specific skills or
tools. They contain an intro, a demonstration video, some exercises with an
example solution video, and a challenge without a solution video for you to test
your learning. [Read more about how to use Makers
Bites.](https://github.com/makersacademy/course/blob/main/labels/bites.md)_

Learn to write `INSERT` SQL queries to create new records.

## Introduction

```sql
INSERT INTO [table name]
  ( [list of columns] )
  VALUES( [list of values] );
```

Run the following in the `psql` REPL:
```sql
-- We don't specify the value for the `id`
-- column, the database will automatically pick one.
INSERT INTO artists 
  (name, genre)
  VALUES('Massive Attack', 'Alternative');
```

## Exercise

1. `INSERT` a new record in `albums` with title 'Mezzanine', and release year 1998.
2. We forgot to link this new record with the correct artist. Use an `UPDATE` query to update the `artist_id` of that new album with Massive Attack (it should be `id` 5).

## Challenge

Insert a new artist of your choice, and a new album for that artist ([here's an idea](https://en.wikipedia.org/wiki/OK_Computer), if you can't pick one).

[Next Challenge](06_using_joins.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/databases&prefill_File=sql_bites/05_creating_new_data.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/databases&prefill_File=sql_bites/05_creating_new_data.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/databases&prefill_File=sql_bites/05_creating_new_data.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/databases&prefill_File=sql_bites/05_creating_new_data.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/databases&prefill_File=sql_bites/05_creating_new_data.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->