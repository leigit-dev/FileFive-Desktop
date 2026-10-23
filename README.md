# FileFive Desktop (轻量级开源版)

这是一个基于 [FileFive](https://github.com/miroshnikov/filefive) 核心封装的 Windows 桌面客户端。

## 为什么做这个？
原版 FileFive 需要依赖 Node.js 并在命令行启动，使用浏览器访问。为了提供更原生的体验，本项目采用了 **Python (pywebview)** 调用 Windows 系统原生的 WebView2 进行套壳，不仅启动方便，而且打包体积（约 80MB）远小于 Electron 打包方案。

## 如何使用
1. 去本仓库右侧的 [Releases](../../releases) 页面。
2. 下载最新的 `FileFive-Desktop.exe`。
3. 双击直接运行，无需安装 Node.js 环境。

## 如何自己编译
1. 确保安装了 [Node.js](https://nodejs.org) 和 [Python 3.10+](https://python.org)。
2. 克隆本仓库：`git clone https://github.com/leigit-dev/FileFive.git`
4. 运行 `build.bat`。
5. 编译好的单文件程序会在 `dist` 文件夹中。

## 开源协议
本项目遵循 **GPL-3.0** 协议。由于本项目包含了 FileFive 的核心代码，因此整体受 GPL 协议约束。详见 `LICENSE` 文件。

## 致谢
- 核心引擎：[miroshnikov/filefive](https://github.com/miroshnikov/filefive)
- UI 套壳：[Python pywebview](https://pywebview.flowrl.com/)
- 图标资源 icon.ico：提取自原版 FileFive 项目