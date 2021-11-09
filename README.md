# Commentable

## Run It!

```
docker compose up --build
```

## Try It!

### Create a comment:
```
curl -X POST --data '{"commentable_id": "<SOME ID>", "comment_id": "<SOME ID>", "body": "<SOME STRING>"}' -H 'Content-Type: application/json' localhost:4567
```
**NOTE:** The combination of `commentable_id` and `comment_id` must be unique.  `commentable_id` is how you look up a group of comments.

### Fetch comments for a "commentable" item:
```
curl localhost:4567/<SOME ID>
```
Where `<SOME ID>` is the some `commentable_id` used above

### Delete a comment:
```
curl -X DELETE localhost:4567/<SOME ID>/comments/<SOME ID>
```
Where the first `SOME ID` is a commentable ID and the second is a comment ID
