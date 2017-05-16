# 推荐 API

## 个性化推荐（需鉴权）

### Request

| 参数名称 | 类型 | 默认值 | 描述 |
| --- | --- | --- | --- |
| `amount` | Integer | | 推荐数量 |

### Response

#### Status Code 200 (OK)

```json
{
    "results": [
        {
            "id": 1,
            "title": "书籍名称",
            "author": "作者",
            "cover": "封面图片地址",
            "price": 300.0. // 书币
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

## 热门推荐（登陆后需授权）

### Request

| 参数名称 | 类型 | 默认值 | 描述 |
| --- | --- | --- | --- |
| `amount` | Integer | | 推荐数量 |

### Response

#### Status Code 200 (OK)

```json
{
    "results": [
        {
            "id": 1,
            "title": "书籍名称",
            "author": "作者",
            "cover": "封面图片地址",
            "price": 300.0. // 书币
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


