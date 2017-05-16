# 阅读 API

## 获取指定书籍的章节信息（需鉴权）

!!! api ""
    **GET** /reading/book/:id
    
### Response

#### Status Code 200 (OK)

```json
{
    "info": {
        "id": 2,  // 书籍 ID
        "category_id": 1,  // 分类 ID
        "category_name": "该书籍所属分类名称",
        "title": "书籍名称",
        "author": "作者",
        "cover": "封面图片地址",
        "introduction": "书籍简介",
        "price": 25.5,  // 书籍价格（书币）
        "score": 4.2,  // 评分
        "total_chapter": 15,  // 章节数量
        "latest_chapter_text": "更新至 13 章",  // 最近更新章节说明，此处为字符串
        "allow_trial": true,  // 是否允许试读
        "trial_chapter": 2,  // 试读允许章节数量（从第 1 章开始）
        "create_timestamp": "2017-05-10T02:49:38.907056Z",  // 书籍加入时间
        "update_timestamp": "2017-05-10T02:50:38.907056Z",  // 书籍最后更新时间
        "is_bought": false  // 是否已经购买此书
    },
    "structure": [
        {
            "chapter": "总序",  // 章节名称
            "identifier": "Text/Section0002.xhtml"  // 章节标识符，通过此标识符请求具体的章节内容
        },
        {
            "chapter": "第一部",
            "identifier": "Text/Section0002_0002.xhtml"
        },
        ...
        {
            "chapter": "编者致读者",
            "identifier": "Text/Section0002_0005.xhtml"
        }
    ]
}
```

## 获取指定书籍的指定章节内容（需鉴权）

!!! api ""
    **GET** /reading/book/:id/chapter
    
此处 `:id` 为书籍 ID。

### Request

| 参数名称 | 类型 | 默认值 | 描述 |
| --- | --- | --- | --- |
| `identifier` | String | | 章节标识符 |

### Response

#### Status Code 200 (OK)

```json
{
    "chapter": "第一部",  // 章节名称
    "identifier": "Text/Section0002_0002.xhtml",  // 章节标识符
    "paragraphs": [
        "第一段",
        "第二段",
        "第三段，会包含 HTML 代码，需要正确解析",
        ...
    ]
}
```

#### Status Code 400 (Bad Request)

如果请求的章节不存在或没有权限，则返回如下响应：

```json
{
    "reason": "没有权限阅读该章节，尚未购买"
}
```
    
## 阅读进度上报（需鉴权）

!!! api ""
    **PUT** /reading/book/:id/progress
    
此处 `:id` 为书籍 ID。

### Request

| 参数名称 | 类型 | 默认值 | 描述 |
| --- | --- | --- | --- |
| `chapter` | String | | 章节标识符 |
| `paragraph` | Integer | | 当前段落的位移数量 |
| `word` | Integer | | 当前字的位移数量 |

### Response

#### Status Code 200 (OK)

```json
{
    "chapter": "Text/Section0002_0002.xhtml",
    "paragraph": 15,
    "word": 152,
    "timestamp": "2017-05-10T02:50:38.907056Z"  // 阅读进度上报时间
}
```

## 阅读进度获取（需鉴权）

!!! api ""
    **GET** /reading/book/:id/progress
    
此处 `:id` 为书籍 ID。

### Response

#### Status Code 200 (OK)

```json
{
    "chapter": "Text/Section0002_0002.xhtml",  // 章节标识符
    "paragraph": 15,  // 段落位移数量
    "word": 152,  // 字位移数量
    "timestamp": "2017-05-10T02:50:38.907056Z"  // 阅读进度添加时间
}
```

如果用户尚未阅读本书，则返回第一章第一段第一个字，即 `paragraph` 和 `word` 均为 0，`timestamp` 为当前时间。

## 获取书签列表（需鉴权）

!!! api ""
    **GET** /reading/book/:id/bookmark
    
此处 `:id` 为书籍 ID。

### Request

| 参数名称 | 类型 | 默认值 | 描述 |
| --- | --- | --- | --- |
| `detail_length` | Integer | 20 | 从书签起始位置开始，截取多少字 |

### Response

#### Status Code 200 (OK)

```json
{
    "results": [
        {
            "id": 25,  // 书签 ID
            "chapter": "Text/Section0002_0002.xhtml",  // 章节标识符
            "paragraph": 15,  // 段落位移数量
            "word": 152,  // 字位移数量
            "detail": "风雨送春归，飞雪迎春到。已是悬崖百丈冰，犹有花",  // 详细内容
            "timestamp": "2017-05-10T02:50:38.907056Z"  // 书签添加时间
        },
        {
            "id": 26,
            "chapter": "Text/Section0002_0003.xhtml",
            "paragraph": 0,
            "word": 23,
            "detail": "风雨送春归，飞雪迎春到。已是悬崖百丈冰，犹有花",
            "timestamp": "2017-05-10T02:50:39.907056Z"
        },
        ...
    ]
}
```

## 添加书签（需鉴权）

!!! api ""
    **POST** /reading/book/:id/bookmark
    
此处 `:id` 为书籍 ID。

### Request

| 参数名称 | 类型 | 默认值 | 描述 |
| --- | --- | --- | --- |
| `chapter` | String | | 章节标识符 |
| `paragraph` | Integer | | 当前段落的位移数量 |
| `word` | Integer | | 当前字的位移数量 |

### Response

#### Status Code 200 (OK)

```json
{
    "id": 25,  // 书签 ID
    "chapter": "Text/Section0002_0002.xhtml",  // 章节标识符
    "paragraph": 15,  // 段落位移数量
    "word": 152,  // 字位移数量
    "detail": "风雨送春归，飞雪迎春到。已是悬崖百丈冰，犹有花",  // 书签内容
    "timestamp": "2017-05-10T02:50:38.907056Z"  // 书签添加时间
}
```

## 删除书签（需鉴权）

!!! api ""
    **DELETE** /reading/book/:id/bookmark/:bookmarkid
    
此处 `:id` 为书籍 ID，`:bookmarkid` 为书签 ID。

### Response

#### Status Code 204 (No Content)

成功返回 204。

#### Status Code 404 (Not Found)

未找到返回 404。

