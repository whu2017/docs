# 用户 API

## 用户标识符验证接口

!!! api ""
    **POST** /user/identifier/check
    
### Request

| 参数名称 | 类型 | 默认值 | 描述 |
| --- | --- | --- | --- |
| `identifier` | String |  | 用户标识符（Email 或 手机号） |
| `function` | Integer | | 描述了验证的作用:<br/>`0`: 注册<br/>`1`: 重置密码<br/>`2`: 更新信息 |

### Response

#### Status Code 200 (OK)

当提供的 Email 或手机号可用时，返回内容如下：

```json
{
    "identifier": "xxx@xxx.com",
    "available": true,
    "identifier_token": "asdfasdfasfasdfasf"
}
```

此处 `identifier_token` 为 **用户标识 Token**。同时系统会发送一封验证邮件(或短信)到对应 Email 或手机号上。

当 Email 或手机号不可用时，返回内容如下：

```json
{
    "identifier": "xxx@xxx.com",
    "available": false,
}
```

## 注册用户

!!! api ""
    **POST** /user/register

### Request

| 参数名称 | 类型 | 默认值 | 描述 |
| --- | --- | --- | --- |
| `identifier_token` | String |  | 用户标识 Token |
| `code` | String | | 验证码 |
| `password` | String | | 密码 |
| `nickname` | String | | (选填) 昵称 |

### Response

#### Status Code 200 (OK)

当注册成功时自动登录用户，并返回如下内容：

```json
{
    "token": "xdsafasdfasfasdf",
    "expires_at": 1324124312
}
```

* `token` 为用户身份标识，所有需要用户身份认证的接口均需要在 HTTP Header 中携带此 Token
* `expires_at` 为 token 的过期时间，超过此日期则 token 不可用，必须 **权限状态更新** 接口来刷新权限

## 登录

!!! api ""
    **POST** /user/login

### Request

| 参数名称 | 类型 | 默认值 | 描述 |
| --- | --- | --- | --- |
| `identifier` | String | | 唯一标识符（Email 或 手机号） |
| `password` | String | | 密码 |

### Response

#### Status Code 200 (OK)

登录成功则返回用户的鉴权 Token 和过期时间。

```json
{
    "token": "xdsafasdfasfasdf",
    "expires_at": 1324124312
}
```

## 重置密码

!!! api ""
    **POST** /user/password/reset
    
调用此接口前需要先通过 **用户标识符验证接口** 获取 `identifier_token`(用户标识 Token) 并朝用户发送验证码。

### Request

| 参数名称 | 类型 | 默认值 | 描述 |
| --- | --- | --- | --- |
| `identifier_token` | String | | 用户标识 Token |
| `code` | String | | 验证码 |
| `new_password` | String | | 新的密码 |

### Response

#### Status Code 200 (OK)

```json
{
    "token": "xdsafasdfasfasdf",
    "expires_at": 1324124312
}
```

当重置密码后，自动登录用户并返回代表用户身份的 token 等信息。

## 密码更改（需鉴权）

!!! api ""
    **POST** /user/password/change

### Request

| 参数名称 | 类型 | 默认值 | 描述 |
| --- | --- | --- | --- |
| `identifier` | String | | 用户标识符（Email 或手机号） |
| `old_password` | String | | 旧的密码 | 
| `new_password` | String | | 新的密码 |

### Response

#### Status Code 200 (OK)

```json
{
    "token": "xdsafasdfasfasdf",
    "expires_at": 1324124312
}
```

调用此接口会更新用户的已有 token。

## 用户信息获取（需鉴权）

!!! api ""
    **GET** /user/profile

### Response

#### Status Code 200 (OK)

```json
{
    "user_id": 2341,
    "email": "doraemonext@gmail.com",
    "phone": "",
    "nickname": "飞天的猪",
    "signature": "some test",
    "balance": 23.5,
    "avatar": "/media/2017/01/01/2341fdsfsfsf2341.jpg",
    "options_sync_progress": true,
    "options_clean_cache": false,
    "options_display_progress": true,
    "options_wifi_download_only": false,
    "options_accept_push": true,
    "options_auto_buy_chapter": false
}
```

其中 `balance` 为用户当前余额。

## 用户信息更新（需鉴权）

!!! api ""
    **PUT** /user/profile

### Request

如果不需要修改，则无需提供对应项。

如果需要上传头像，请使用 `application/form-data` 作为 Content-Type。

| 参数名称 | 类型 | 默认值 | 描述 |
| --- | --- | --- | --- |
| `nickname` | String | | 昵称(选填) |
| `signature` | String | | 个性签名(选填) |
| `avatar` | File | |头像 |
| `options_sync_progress` | Boolean | | 是否同步进度(选填) |
| `options_clean_cache` | Boolean | | 是否自动清除缓存(选填) |
| `options_display_progress` | Boolean | | 是否显示阅读进度(选填) |
| `options_wifi_download_only` | Boolean | | 是否仅用 wifi 下载(选填) |
| `options_accept_push` | Boolean | | 是否接受推送(选填) |
| `options_auto_buy_chapter` | Boolean | | 是否自动购买章节(选填) |

### Response

#### Status Code 200 (OK)

```json
{
    "user_id": 34134,
    "email": "doraemonext@gmail.com",
    "phone": "",
    "nickname": "飞天的猪",
    "signature": "some test",
    "avatar": "/media/2015/02/03/2341fdsfsfsf2341.jpg",
    "options_sync_progress": true,
    "options_clean_cache": false,
    "options_display_progress": true,
    "options_wifi_download_only": false,
    "options_accept_push": true,
    "options_auto_buy_chapter": false
}
```

以上返回为更新后的用户个人信息。

