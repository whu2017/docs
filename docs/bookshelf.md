# 书架 API

## 将书籍加入书架（需授权）

!!! api ""
    **POST** /bookshelf
    
### Request

| 参数名称 | 类型 | 默认值 | 描述 |
| --- | --- | --- | --- |
| `book_id` | Integer | | 图书 ID |
    
### Response

#### Status Code 204 (No Content)

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

## 书架同步接口（需鉴权）

!!! api ""
    **PUT** /bookshelf
    
### Request

| 参数名称 | 类型 | 默认值 | 描述 |
| --- | --- | --- | --- |
| `book_id` | String | | 书籍 ID 列表，以 `,` 分隔。此处提供的书籍列表将会完全覆盖服务器上的用户书架<br/>示例：`32,63,128,2` |

### Response

#### Status Code 200 (OK)

```json
{
    "count": 32,  // 当前用户的书架中的图书数量
    "update_timestamp": "2017-05-10T02:50:38.907056Z"  // 当前用户书架的最后更新时间
}
```

## 书架状态获取（需鉴权）

!!! api ""
    **GET** /bookshelf/status
    
### Response

#### Status Code 200 (OK)

```json
{
    "count": 32,  // 当前用户的书架中的图书数量
    "update_timestamp": "2017-05-10T02:50:38.907056Z"  // 当前用户书架的最后更新时间
}
```

## 在书架中删除指定图书（需鉴权）

!!! api ""
    **DELETE** /bookshelf/book/:id
    
此处 ID 为书籍 ID。

### Response

#### Status Code 204 (No Content)

如果删除成功，则返回 204。

#### Status Code 404 (Not Found)

如果给定的书籍 ID 不存在与当前用户的书架中，则返回 404。

