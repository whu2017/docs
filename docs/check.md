# 签到 API

## 获取当前签到状态

!!! api ""
    **GET** /check
    
### Response

#### Status Code 200 (OK)

```json
{
    "total": 15,
    "is_check_today": false
}
```

* `total`：总签到数。
* `is_check_today`：今日是否签到。

## 签到

!!! api ""
    **POST** /check
    
### Response

#### Status Code 200 (OK)

```json
{
    "status": "ok"
}
```

如果签到成功，则 `status` 为 `ok`，如果重复签到，则 `status` 为 `repeat check`。


