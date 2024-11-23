use swlug


db.createCollection("swuweb")

db.swuweb.insertOne({
  "user_id": "user003",
  "board_category": 2,
  "board_title": "두 번째 게시글",
  "created_at": "new Date()",
  "updated_at": "new Date()",
  "is_pin": true,
  "is_secure": 1,
  "is_delete": 0
})
