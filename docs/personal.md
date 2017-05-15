# 个人中心 API

## 获取账单列表（需鉴权）

!!! api ""
    **GET** /personal/order
    
### Request

| 参数名称 | 类型 | 默认值 | 描述 |
| --- | --- | --- | --- |
| `page` | Integer | 1 | 请求的页数（选填） |
| `page_size` | Integer | 10 | 每页包含的订单数目（选填） |
    
### Response

#### Status Code 200 (OK)

```json
{
    "count": 12,
    "next": "http://oott.me/personal/order/?page=2&page_size=8",
    "previous": null,
    "results": [
        {
            "id": 1,  // 书籍 ID
            "title": "书籍名称",
            "author": "作者",
            "cover": "封面图片地址",
            "price": 300.0,  // 花费（书币）
            "timestamp": "2017-05-10T02:50:38.907056Z"  // 订单生成日期
        },
        {
            "id": 2,
            "title": "书籍名称",
            "author": "作者",
            "cover": "封面图片地址",
            "price": 15.5,
            "timestamp": "2017-05-10T02:50:38.907056Z"
        },
        ...
    ]
}
```

## 获取已读列表（需鉴权）

!!! api ""
    **GET** /personal/read_record
    
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
    "next": "http://oott.me/personal/read_record/?page=2&page_size=8",
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
    
## 获取下载列表（需鉴权）

!!! api ""
    **GET** /personal/download_record
    
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
    "next": "http://oott.me/personal/download_record/?page=2&page_size=8",
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

## 获取购买列表（需鉴权）

!!! api ""
    **GET** /personal/buy_record
    
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
    "next": "http://oott.me/personal/buy_record/?page=2&page_size=8",
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


