# Commentable

## Run It!

```
docker compose up --build
```

## Try It!

### Create a comment:
endpoint:
`POST /:commentable_id/comments`
example:
```
curl -X POST --data '{"body": "<SOME STRING>"}' -H 'Content-Type: application/json' localhost:4567/<SOME ID>
```
Where the `SOME ID` in the URL is the ID of a "commentable" item.

### Fetch comments for a "commentable" item:
endpoint:
`GET /:commentable_id/comments`
example:
```
curl localhost:4567/<SOME ID>
```
Where `<SOME ID>` is the some `commentable_id` used above

### Delete a comment:
endpoint:
`POST /:commentable_id/comments/:comment_id`
example:
```
curl -X DELETE localhost:4567/<SOME ID>/comments/<SOME ID>
```
Where the first `SOME ID` is a commentable ID and the second is a comment ID
