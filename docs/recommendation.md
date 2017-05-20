# 推荐 API

## 个性化推荐（需鉴权）

!!! api ""
    **GET** /recommendation/individuation

### Request

| 参数名称 | 类型 | 默认值 | 描述 |
| --- | --- | --- | --- |
| `amount` | Integer | 120 | 推荐数量总数（选填） |
| `page` | Integer | 1 | 请求的页数（选填） |
| `page_size` | Integer | 10 | 每页包含的书籍数目（选填） |

### Response

#### Status Code 200 (OK)

```json
{
    "count": 12,
    "next": "http://oott.me/recommendation/individuation?page=2&page_size=8",
    "previous": null,
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

## 排行榜推荐（登陆后可鉴权）

!!! api ""
    **GET** /recommendation/rank
    
当不携带鉴权 Token 请求时，该 API 返回公共排行榜信息。

当携带鉴权 Token 请求时，该 API 返回有个人色彩的排行榜信息。

### Request

| 参数名称 | 类型 | 默认值 | 描述 |
| --- | --- | --- | --- |
| `amount` | Integer | 120 | 推荐数量总数（选填） |
| `page` | Integer | 1 | 请求的页数（选填） |
| `page_size` | Integer | 10 | 每页包含的书籍数目（选填） |

### Response

#### Status Code 200 (OK)

```json
{
    "count": 12,
    "next": "http://oott.me/recommendation/rank?page=2&page_size=8",
    "previous": null,
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


