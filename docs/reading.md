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

## 阅读进度获取（需鉴权）

## 添加书签（需鉴权）

## 删除书签（需鉴权）

