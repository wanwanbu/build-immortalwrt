#1. 项目简介
简要说明项目目的：通过 GitHub Actions 自动化编译 ImmortalWrt 固件，支持 SSH 手动配置和自定义版本。
可展示的徽章（如工作流状态、最新 release 等）。
##2. 功能特点
1. 使用官方 ImmortalWrt 源码。
2. 支持手动选择分支（通过仓库变量 REPO_BRANCH 设置）。
3. 编译前可开启 SSH 会话，手动运行 make menuconfig 定制固件。
4. 自动清理多余文件，并将固件发布到 GitHub Release。
5. 默认 Release 信息包含 IP、构建 ID 和分支。
##3.如何使用
手动触发工作流：
进入你的 GitHub 仓库，点击 Actions 标签。
在左侧选择 Build ImmortalWrt 工作流。
点击 Run workflow 按钮。
在弹出的对话框中，可以选择是否开启 SSH 配置菜单（默认开启）。
点击 Run workflow 开始编译。
通过 SSH 手动配置：
如果开启了 SSH，工作流会暂停并输出一个 tmate 连接地址（例如 https://tmate.io/t/...）。
使用浏览器或 SSH 客户端连接到该会话。
在会话中进入源码目录（cd immortalwrt），执行 make menuconfig 进行配置。
配置完成后保存并退出，工作流将自动继续下载软件包并编译。
编译完成：
编译成功后，固件文件会被自动上传到 GitHub Release 页面。
你可以在仓库主页的 Releases 标签下找到对应的固件下载链接。
##4.环境变量与配置
Settings → Secrets and variables → Actions → Variables 中添加变量 REPO_BRANCH 输入指定版本
##5.注意事项
1.使用ssh链接后cd immortal目录
2.执行 make menuconfig 配置 目标系统 - 子架构 - 目标机型 - 所需要的插件然后退出ssh等待编译。
