# 充值 API 

## 充值金额接口

!!! api ""
    **POST** /user/deposit/record
    
### Request

| 参数名称 | 类型 | 默认值 | 描述 |
| --- | --- | --- | --- |
| `amount` | Float |  | 充值金额（正数） |

### Response

#### Status Code 200 (OK)

```json
{
    "amount": 12.0,
    "balance": 53.0
}
```
    
其中，`amount` 为当前充值金额，`balance` 为当前用户余额（充值后的）。

## 充值单查询接口

!!! api ""
    **GET** /user/deposit/record
    
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

## 指定充值单查询接口

!!! api ""
    **GET** /user/deposit/record/:id
    
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

