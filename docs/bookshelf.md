# 书架 API

## 获取当前书架列表（需鉴权）

!!! api ""
    **GET** /bookshelf
    
### Request

| 参数名称 | 类型 | 默认值 | 描述 |
| --- | --- | --- | --- |
| `page` | Integer | 1 | 请求的页数（选填） |
| `page_size` | Integer | 10 | 每页包含的书籍数目（选填） |
    
### Response

#### Status Code 200 (OK)

```json
{
    "count": 12,
    "next": "http://oott.me/bookshelf/?page=2&page_size=8",
    "previous": null,
    "results": [
        {
            "id": 1,  // 书籍 ID
            "title": "书籍名称",
            "author": "作者",
            "cover": "封面图片地址",
            "price": 300.0,  // 价格（书币）
            "is_bought": true  // 是否已经购买
        },
        {
            "id": 2,
            "title": "书籍名称",
            "author": "作者",
            "cover": "封面图片地址",
            "price": 25.5,
            "is_bought": false
        },
        ...
    ]
}
```

## 在书架中删除指定图书（需鉴权）

!!! api ""
    **DELETE** /bookshelf/book/:id
    
此处 ID 为书籍 ID。

### Response

#### Status Code 204 (No Content)

