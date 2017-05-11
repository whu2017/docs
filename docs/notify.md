# 通知 API 

## 获取站内消息列表（需鉴权）

!!! api ""
    **GET** /notify
    
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
            "is_read": false,
            "notify": {
                "id": 2,
                "content": "测试消息",
                "notify_type": 2,
                "target": 0,
                "target_type": "",
                "action_type": "",
                "create_timestamp": "2017-05-10T02:49:22.463720Z",
                "sender": 1
            },
            "create_timestamp": "2017-05-10T02:49:38.907056Z"
        },
        {
            "id": 1,
            "is_read": false,
            "notify": {
                "id": 1,
                "content": "测试公告",
                "notify_type": 0,
                "target": 0,
                "target_type": "",
                "action_type": "",
                "create_timestamp": "2017-05-10T02:48:39.901706Z",
                "sender": 1
            },
            "create_timestamp": "2017-05-10T02:49:34.538553Z"
        }
    ]
}
```
    
上述 `next` 和 `previous` 为下一页和上一页的 API URL，如果不存在，则为 `null`。

其中，站内消息分为三类：

* 公告。`notify_type=0`
* 提醒。`notify_type=1`
* 消息。`notify_type=2`

## 获取指定站内消息（需鉴权）

!!! api ""
    **GET** /notify/:id
    
此处 ID 为站内消息的 ID。
    
### Response

#### Status Code 200 (OK)

```json
{
    "id": 2,
    "is_read": false,
    "notify": {
        "id": 2,
        "content": "测试消息",
        "notify_type": 2,
        "target": 0,
        "target_type": "",
        "action_type": "",
        "create_timestamp": "2017-05-10T02:49:22.463720Z",
        "sender": 1
    },
    "create_timestamp": "2017-05-10T02:49:38.907056Z"
}
```

## 将指定站内消息置为已读（需鉴权）

!!! api ""
    **PUT** /notify/:id
    
### Response

#### Status Code 200 (OK)

```json
{
    "id": 2,
    "is_read": true,
    "notify": {
        "id": 2,
        "content": "测试消息",
        "notify_type": 2,
        "target": 0,
        "target_type": "",
        "action_type": "",
        "create_timestamp": "2017-05-10T02:49:22.463720Z",
        "sender": 1
    },
    "create_timestamp": "2017-05-10T02:49:38.907056Z"
}
```

返回置为已读后的当前站内消息详情。


