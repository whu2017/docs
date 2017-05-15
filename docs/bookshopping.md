# 书城 API

## 获取当前书籍列表

!!! api ""
    **GET** /bookshopping/book
    
### Request

| 参数名称 | 类型 | 默认值 | 描述 |
| --- | --- | --- | --- |
| `page` | Integer | 1 | 请求的页数（选填） |
| `page_size` | Integer | 10 | 每页包含的书籍数目（选填） |
| `category` | String | | 分类名称（选填）。仅允许传入以下列表中的项：<br/><ul><li>少儿幼教</li><li>教育科技</li><li>文学艺术</li><li>经管职场</li><li>党政军事</li><li>时尚娱乐</li><li>情感家庭</li><li>人文社科</li></ul> |
| `search` | String | | 搜索内容（选填）。模糊搜索，支持书籍名称、书籍作者 |

### Response

#### Status Code 200 (OK)

```json
{
    "count": 12,
    "next": "http://oott.me/bookshopping/book/?page=2&page_size=8",
    "previous": null,
    "results": [
        {
            "id": 1,
            "title": "书籍名称",
            "author": "作者",
            "cover": "封面图片地址",
            "price": 300.0
        },
        {
            "id": 2,
            "title": "书籍名称",
            "author": "作者",
            "cover": "封面图片地址",
            "price": 25.5
        },
        ...
    ]
}
```

上述返回中：

* `count`：符合要求的书籍总数
* `next`：下一页 API 请求地址，如果不存在下一页则值为 `null`
* `previous`：上一页 API 请求地址，如果不存在上一页则值为 `null`
* `results`：查询结果列表（仅返回指定 `page` 的结果）
    * `id`：书籍 ID
    * `title`：书籍名称
    * `author`：作者
    * `cover`：封面图片地址
    * `price`：该书籍的价格（单位书币）

## 获取指定书籍详细信息

!!! api ""
    **GET** /bookshopping/book/:id
    
此处 `:id` 为实际的图书 ID。
    
### Response

#### Status Code 200 (OK)

```json
{
    "id": 2,  // 书籍 ID
    "category_id": 1,  // 分类 ID
    "category_name": "该书籍所属分类名称",
    "title": "书籍名称",
    "author": "作者",
    "cover": "封面图片地址",
    "introduction": "书籍简介",
    "price": 25.5,  // 书籍价格（书币）
    "score": 4.2,  // 评分
    "total_chapter": 15,  // 章节数量
    "latest_chapter_text": "更新至 13 章",  // 最近更新章节说明，此处为字符串
    "allow_trial": true,  // 是否允许试读
    "trial_chapter": 2,  // 试读允许章节数量（从第 1 章开始）
    "create_timestamp": "2017-05-10T02:49:38.907056Z",  // 书籍加入时间
    "update_timestamp": "2017-05-10T02:50:38.907056Z"  // 书籍最后更新时间
}
```

## 获取指定书籍的首级评论列表

!!! api ""
    **GET** /bookshopping/book/:id/comment
    
此处 `:id` 为实际的图书 ID。

### Request

| 参数名称 | 类型 | 默认值 | 描述 |
| --- | --- | --- | --- |
| `page` | Integer | 1 | 请求的页数（选填） |
| `page_size` | Integer | 10 | 每页包含的评论数目（选填） |

### Response

#### Status Code 200 (OK)

```json
{
    "count": 12,
    "next": "http://oott.me/bookshopping/book/2/comment/?page=3",
    "previous": "http://oott.me/bookshopping/book/2/comment/?page=1",
    "results": [
        {
            "id": 15,  // 评论 ID
            "user_id": 5,  // 评论用户 ID
            "user_nickname": "用户昵称",  // 如果昵称不存在则返回用户标识符，即 155****2722 或 dora****t@gmail.com 形式
            "user_avatar": "用户头像图片地址",
            "content": "评论内容",
            "score": 4,  // 评分
            "timestamp": "2017-05-10T02:50:38.907056Z",  // 评论发表时间
            "sub_comment_count": 135  // 子评论数量
        },
        {
            "id": 16,
            "user_id": 1,
            "user_nickname": "用户昵称",
            "user_avatar": "用户头像图片地址",
            "content": "评论内容",
            "score": 4,
            "timestamp": "2017-05-10T02:50:38.907056Z",
            "sub_comment_count": 0
        },        
        ...
    ]
}
```

## 获取指定评论内容

!!! api ""
    **GET** /bookshopping/comment/:id
    
此处 `:id` 为实际的评论 ID。

### Response

#### Status Code 200 (OK)

```json
{
    "id": 15,  // 评论 ID
    "user_id": 5,  // 评论用户 ID
    "user_nickname": "用户昵称",  // 如果昵称不存在则返回用户标识符，即 155****2722 或 dora****t@gmail.com 形式
    "user_avatar": "用户头像图片地址",
    "content": "评论内容",
    "score": 4,  // 评分
    "timestamp": "2017-05-10T02:50:38.907056Z",  // 评论发表时间
    "sub_comment_count": 135  // 子评论数量
}
```

## 获取指定评论的子评论列表

!!! api ""
    **GET** /bookshopping/comment/:id/children
    
此处 `:id` 为实际的评论 ID。

### Request

| 参数名称 | 类型 | 默认值 | 描述 |
| --- | --- | --- | --- |
| `page` | Integer | 1 | 请求的页数（选填） |
| `page_size` | Integer | 10 | 每页包含的子评论数目（选填） |

### Response

#### Status Code 200 (OK)

```json
{
    
    "count": 22,
    "next": "http://oott.me/bookshopping/comment/5/children/?page=3",
    "previous": "http://oott.me/bookshopping/comment/5/children/?page=1",
    "results": [
        {
            "id": 15,  // 评论 ID
            "user_id": 5,  // 评论用户 ID
            "user_nickname": "用户昵称",  // 如果昵称不存在则返回用户标识符，即 155****2722 或 dora****t@gmail.com 形式
            "user_avatar": "用户头像图片地址",
            "content": "评论内容",
            "score": 4,  // 评分
            "timestamp": "2017-05-10T02:50:38.907056Z",  // 评论发表时间
            "sub_comment_count": 0  // 子评论数量
        },
        {
            "id": 16,
            "user_id": 1,
            "user_nickname": "用户昵称",
            "user_avatar": "用户头像图片地址",
            "content": "评论内容",
            "score": 4, 
            "timestamp": "2017-05-10T02:50:38.907056Z",
            "sub_comment_count": 0
        },        
        ...
    ]
}
```

## 发表评论（需鉴权）

!!! api ""
    **POST** /bookshopping/book/:id/comment
    
此处 `:id` 为实际的书籍 ID。

### Request

| 参数名称 | 类型 | 默认值 | 描述 |
| --- | --- | --- | --- |
| `score` | Float | | 评分（范围 1 - 5） |
| `content` | String | | 评论内容 |
| `parent_id` | Integer | | 该评论的父级评论 ID（如果无父级评论则置为 0） |

### Response

#### Status Code 200 (OK)

```json
{
    "id": 15,  // 评论 ID
    "user_id": 5,  // 评论用户 ID
    "user_nickname": "用户昵称",  // 如果昵称不存在则返回用户标识符，即 155****2722 或 dora****t@gmail.com 形式
    "user_avatar": "用户头像图片地址",
    "content": "评论内容",
    "score": 4,  // 评分
    "timestamp": "2017-05-10T02:50:38.907056Z",  // 评论发表时间
    "sub_comment_count": 0  // 子评论数量
}
```

当评论发表后，返回刚刚发表成功的评论信息。

## 购买图书（需鉴权）

!!! api ""
    **POST** /bookshopping/book/:id/buy

### Response

#### Status Code 200 (OK)

当购买成功时，将会自动生成订单，并将该书加入书架。响应内容中返回当前用户余额：

```json
{
    "cost_book": 350.5,  // 本次消费书币数目
    "balance_book": 5300.0  // 当前账户剩余书币数目
}
```

#### Status Code 400 (Bad Request)

当购买失败时（余额不足、重复购买），将会返回失败原因：

```json
{
    "reason": "余额不足"  // 另一种原因字符串为 "重复购买"
}
```


