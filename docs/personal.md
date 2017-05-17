# 个人中心 API

## 当前用户余额查询（需鉴权）

!!! api ""
    **GET** /personal/balance

### Response

#### Status Code 200 (OK)

```json
{
    "balance_rmb": 53.0,
    "balance_book": 5300.0
}
```

`balance_rmb` 为当前用户人民币余额，`balance_book` 为当前用户书币余额。

## 购买记录查询（需鉴权）

!!! api ""
    **GET** /personal/buying
    
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
    "next": "http://oott.me/personal/buying/?page=2&page_size=8",
    "previous": null,
    "results": [
        {
            "id": 1,  // 购买记录 ID
            "book_id": 5,  // 书籍 ID
            "title": "书籍名称",
            "author": "作者",
            "cover": "/media/test.png",
            "price": 300.0,  // 购买价格
            "timestamp": "2017-05-10T02:50:38.907056Z"  // 购买日期
        },
        {
            "id": 2,
            "book_id": 6,
            "title": "书籍名称",
            "author": "作者",
            "cover": "",
            "price": 15.5,
            "timestamp": "2017-05-10T02:50:38.907056Z"
        },
        ...
    ]
}
```

## 充值记录查询（需鉴权）

!!! api ""
    **GET** /personal/deposit
    
### Response

#### Status Code 200 (OK)

```json
{
    "count": 2,
    "next": null,
    "previous": null,
    "results": [
        {
            "id": 2,
            "amount": 12.0,
            "status": 1,
            "create_timestamp": "2017-04-17T12:45:46.252066Z",
            "modify_timestamp": "2017-04-17T12:45:46.252110Z"
        },
        {
            "id": 3,
            "amount": 15.0,
            "status": 1,
            "create_timestamp": "2017-04-17T13:02:21.604488Z",
            "modify_timestamp": "2017-04-17T13:02:21.604531Z"
        }
    ]
}
```

其中，`count` 为当前用户总共的充值单数量。`next` 为下一页的 URL 链接（无下一页时为 `null`），`previous` 为上一页的 URL 链接（无上一页时为 `null`），`result` 为当前页结果列表。

* `id`：充值单唯一标识符
* `amount`：充值金额
* `status`: 此处永远为 1，充值即成功（省事）
* `create_timestamp`: 充值单创建时间
* `modify_timestamp`: 充值单最后更新时间

## 账单记录查询（需鉴权）

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
            "id": 1,  // 订单 ID
            "amount": 2345.5,  // 订单涉及金额（书币），可正可负
            "name": "商品名称",
            "note": "订单备注",
            "timestamp": "2017-05-10T02:50:38.907056Z"  // 账单生成日期
        },
        {
            "id": 2,
            "amount": -2345.5,  // 订单涉及金额（书币），可正可负
            "name": "商品名称",
            "note": "订单备注",
            "timestamp": "2017-05-10T02:50:38.907056Z"  // 账单生成日期
        },
        ...
    ]
}
```

## 已读书籍记录查询（需鉴权）

!!! api ""
    **GET** /personal/read
    
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
    "next": "http://oott.me/personal/read/?page=2&page_size=8",
    "previous": null,
    "results": [
        {
            "id": 1,  // 已读列表 ID
            "book_id": 5,  // 书籍 ID
            "title": "书籍名称",
            "author": "作者",
            "cover": "封面图片地址"
        },
        {
            "id": 2,
            "book_id": 6, 
            "title": "书籍名称",
            "author": "作者",
            "cover": "封面图片地址"
        },
        ...
    ]
}
```

## 账户充值（需鉴权）

!!! api ""
    **POST** /personal/deposit
    
### Request

| 参数名称 | 类型 | 默认值 | 描述 |
| --- | --- | --- | --- |
| `amount` | Float |  | 充值人民币金额（正数） |

### Response

#### Status Code 200 (OK)

```json
{
    "amount": 12.0,
    "balance_rmb": 53.0,
    "balance_book": 5300.0
}
```
    
其中，`amount` 为当前充值金额（人民币），`balance_rmb` 为当前用户人民币余额（充值后的），`balance_book` 为当前用户书币余额（充值后的）。

## 指定充值记录查询（需鉴权）

!!! api ""
    **GET** /personal/deposit/:id
    
此处 `:id` 为充值记录 ID。
    
### Response

#### Status Code 200 (OK)

```json
{
    "id": 3,
    "amount": 15.0,
    "status": 1,
    "create_timestamp": "2017-04-17T13:02:21.604488Z",
    "modify_timestamp": "2017-04-17T13:02:21.604531Z"
}
```

含义同上。


