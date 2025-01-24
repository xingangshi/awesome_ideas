用途: 生成commit信息并提交git，适用于cline/roo-code
---------------------------

根据 @git-changes 提交 git

[遵循 Angular Commit Message 规范](https://github.com/angular/angular/blob/22b96b9/CONTRIBUTING.md#-commit-message-guidelines)

```
格式：
<type>(<scope>): <subject>

<body>

<footer>

其中 subject 必填，body 和 footer 可选

type: feat|fix|docs|style|refactor|test|chore|perf
scope: 可选，表示影响范围（如模块名）
subject: 简明扼要的提交说明
body: 详细描述，可多行
footer: 通常用于关联 Issue 或破坏性变更说明

示例：
feat(auth): 添加微信登录功能

- 支持微信扫码登录
- 支持微信账号绑定
- 添加微信用户信息同步

Closes #123
```
