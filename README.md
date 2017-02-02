# 은식아 보렴
파일 두 개 변경함
### app/models/group.rb 변경 전 코드

```
class Group < ApplicationRecord
  has_many :users, through: :groups_user
end
```

### app/models/group.rb 변경 후 코드

```
class Group < ApplicationRecord
  has_many :groups_users
  has_many :users, through: :groups_users
end
```

### app/models/user.rb 변경 전 코드

```
class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :likes
  has_many :groups, through: :groups_user
end
```

### app/models/user.rb 변경 후 코드

```
class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :likes
  has_many :groups_users
  has_many :groups, through: :groups_users
end
```
