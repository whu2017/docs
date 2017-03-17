# EasyReading API 文档

## 错误处理方式

当错误发生时，API 会返回相应的错误信息，错误信息包括 HTTP 状态码及 JSON 格式的错误内容。

1. 所有非验证类错误都会引发如下的响应，其中 `message` 的内容为错误原因。并且请注意，根据错误原因不同，相应的状态码也不同（例如请求错误为 400，权限验证错误为 401，方法错误为 405 等等）

    ```json
    {
        "message": "这里是出错原因，前端可直接以合适方式提示给用户"
    }
    ```

2. 所有表单验证类错误都会引发 `422 Unprocessable Entity` 响应

    ```json
    {
        "message": "验证错误",
        "errors": {
            "username": [
                "用户名最大长度为 64 个字符"
            ],
            "email": [
                "不合法的 Email 名称"
            ]
        }
    }
    ```

    其中 message 的内容表明验证表单请求时发生错误，errors 为一个字典，该字典中每个元素的 key 标识了发生错误的字段名，value 为一个列表，说明了错误原因。
    
    注意如果在表单验证过程中，如果一个字段的正确性不仅仅依赖于自身，则发生错误时的错误信息将会被归类为 `non_field_errors`，示例如下（登录过程中，正确性依赖于用户名和密码两个字段）：
    
    ```json
    {
        "message": "验证错误",
        "errors": {
            "non_field_errors": [
                "用户名或密码错误"
            ]
        }
    }
    ```
    
## HTTP 方法

本 API 尽最大可能为各个请求提供合适的 HTTP 方法，所有可能会用到的 HTTP 方法简单描述如下：

| HTTP 方法 | 描述 |
| --- | --- |
| `GET` | 用于获取资源 |
| `POST` | 用于新建资源 |
| `PATCH` | 可仅提供需要更新的部分内容来更新指定资源 |
| `PUT` | 用于替换现有资源 |
| `DELETE` | 用于删除资源 |

## 请求数据格式

1. 对于 GET/DELETE 请求，仅支持 URL 形式的参数传递
2. 对于 POST/PATCH/PUT 请求，支持

    ```
    application/json
    application/w-www-form-urlencoded
    application/form-data
    ```
    
    三种形式的数据请求，客户端仅需指明 Content-Type 即可，服务端会自动识别并处理。
    
## 响应数据格式

全部为 JSON 形式，`Content-Type: application/json`。

## 鉴权

每个用户在登录态时均存在一个 token，以及 token 过期的具体时间 (UNIX时间戳)。

* `token`(string)
* `expires_at`(integer)

前端应在每次请求前检查当前时间是否超过 expires_at，如果超过，则需要重新通过 **权限更新** API 接口来更新 token。

以上两个值需要前端自行存储。

在每个需要 **身份认证** 的接口中，每个 API 请求必须提供 HTTP 头：

```
Authorization: JWT <token>
```

将上述 `<token>` 替换为实际的 token，注意 `JWT` 后面有一个空格。

