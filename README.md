# ecnu-electricity-statistics

华东师范大学电费统计：fork 自[华东理工大学电费统计](https://github.com/lxl66566/ecust-electricity-statistics), 适配了华师大的电费查询逻辑。通过 Github Actions 自动获取并记录每天的宿舍电量剩余，并通过 PushPlus/Telegram 自动推送/告急。

## 开始记录
在从[校园卡综合服务平台](https://epay.ecnu.edu.cn/epaycas/)查询一次电费，使用网络监视器获取必要的cookie和paylod参数
`ELCBUIS`: post请求表单数据的elcbuis项,宿舍楼的神秘代号
`ROOM_NO`: post请求表单数据的roomNo项,形似`0721_??_114_514`
`COOKIE`: 请求头里面那个
`X_CSRF_TOKEN`: 请求头里面那个

## 查看数据

### Github Pages（推荐）

使用 Github Pages 构建。请确保您已获取到电量数据。

Settings - Pages - Deploy from a branch - 选中 main - Save

等待网站构建完毕后（约 1 min），刷新页面，点击 Visit site 即可查看数据。

![image](https://user-images.githubusercontent.com/88281489/205528351-399f221b-96e8-4ca5-86d0-32eb6cdb9286.png)

### 图表

1. 使用 `git clone` 或下载 zip
2. 解压，双击打开 `index.html` 文件

### 生数据

直接点击 `data.js` 查看

## 推送（可选）

### 推送选项

如果你需要自定义推送选项，请编辑 `config.toml` 文件，详情见文件注释。

![20231017-1744](https://github.com/lxl66566/ecust-electricity-statistics/assets/88281489/ef1b0a26-4f77-4c5c-8281-cac1f3d2d3cd)

|       参数        | 默认值 |
| :---------------: | :----: |
|   days_to_show    |   10   |
|      detail       |  true  |
|      warning      |   10   |
| push_warning_only |  true  |

请注意由于 `push_warning_only`，默认情况下不会推送每日数据。

然后，你需要选择以下两个推送方式的至少一个：

### Telegram

1. Settings - Secrets and variables - Actions - New repository secret
2. Name 填写 `TELEGRAM_BOT_TOKEN`，Secret 填写你的 Telegram Bot Token 信息
3. Name 填写 `TELEGRAM_USER_IDS`，Secret 填写你的 Telegram chat ID 信息，表示 bot 需要发送消息的会话。多个 User ID 以空格分隔。

### PushPlus

1. Settings - Secrets and variables - Actions - New repository secret
2. Name 填写 `PUSH_PLUS_TOKEN`，Secret 填写你的 PushPlus 的 TOKEN 信息

## 注意事项

- fork 此仓库后请不要再次 sync fork，否则可能会造成数据丢失。若确实需要更新到最新版本，请自行备份 `data.js` 并使用 git 恢复数据。
- `data.js` 会被作为 _json_ 处理。若自行修改，请遵守 _json_ 格式规范，注意不要有多余的逗号。
- 对文件进行修改和删除后，**别忘了 commit changes**...

## 贡献指南

- pr 保留 `data.js` 中的数据
