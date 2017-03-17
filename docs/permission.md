# 权限 API 

## 权限状态更新

!!! api ""
    **POST** /user/permission/update
    
更新已有的用户鉴权 Token 的过期时间，当更新后会返回新的 Token，原 Token 失效。

### Request

| 参数名称 | 类型 | 默认值 | 描述 |
| --- | --- | --- | --- |
| `token` | String |  | 用户鉴权 Token，必须在过期时间内 |

### Response

#### Status Code 200 (OK)

```json
{
    "token": "xdsafasdfasfasdf",
    "expires_at": 1324124312
}
```

## 权限合法性验证

!!! api ""
    **POST** /user/permission/verify

### Request

| 参数名称 | 类型 | 默认值 | 描述 |
| --- | --- | --- | --- |
| `token` | String |  | 希望验证的用户鉴权 Token |

### Response

#### Status Code 200 (OK)

此状态码则说明 Token 合法，返回该 Token 的过期时间。

```json
{
    "token": "safadsfasdfads",
    "expires_at": 123412341
}
```

#### Status Code 400 (Bad Request)

此状态码说明 Token 非法或已过期，返回内容中的 `message` 描述了失败原因。

```json
{
    "message": "Token 已过期"
}
```

