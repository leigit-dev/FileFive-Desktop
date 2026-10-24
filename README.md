# FileFive Desktop (开源预封装应用)

这是一个基于 [FileFive](https://github.com/miroshnikov/filefive) 核心封装的 Windows 桌面客户端。

## 为什么做这个？
原版 FileFive 需要依赖 Node.js 并在命令行启动，使用浏览器访问。为了提供更原生的体验，本项目采用了 **Python (pywebview)** 调用 Windows 系统原生的 WebView2 进行套壳，不仅启动方便，而且打包体积（约 60MB）远小于 Electron 打包方案。

## 如何使用
1. 去本仓库右侧的 [Releases](../../releases) 页面。
2. 下载最新的 `FileFive-Desktop.exe`。
3. 双击直接运行，无需安装 Node.js 或 Python 环境。

> **提示：** 
> - 由于使用了Pyinstaller单文件封装，**首次启动时系统需要解压核心文件到Temp，可能会等待几秒到十几秒**，请耐心等待窗口弹出（请勿重复双击）。
> - 本程序依赖 Windows WebView2 运行时。**绝大多数 Win10 和 Win11 系统已默认自带**。如果在极个别精简版/旧系统上遇到无Webview2运行时而报错的情况，可前往微软官网下载安装 [WebView2 Runtime](https://developer.microsoft.com/en-us/microsoft-edge/webview2/)。

## 如何自己编译
1. 确保安装了 [Node.js](https://nodejs.org) 和 [Python 3.10+](https://python.org)。
2. 克隆本仓库：
   ```bash
   git clone https://github.com/leigit-dev/FileFive-Desktop.git
   ```
3. 进入目录，双击运行 `build.bat`。
4. 编译好的单文件程序会在 `dist` 文件夹中生成。

## 开源协议 (License)

本项目遵循 **GPL-3.0** 协议。
- **原创代码**：本项目原创的 Python 外壳代码 (`launch.py`)、构建脚本及桌面集成部分，版权归 [leigit-dev] 所有，遵循 GPL-3.0 协议。
- **核心引擎**：本项目分发的二进制文件中包含的 [FileFive](https://github.com/miroshnikov/filefive) 核心代码，版权归原作者 miroshnikov 所有，同样遵循 GPL-3.0 协议。

根据 GPL-3.0 协议要求，关于包含在发布版中的 FileFive 核心代码的获取方式，请参考本仓库的 Releases 页面。

## 致谢 (Credits)
- 核心引擎：[miroshnikov/filefive](https://github.com/miroshnikov/filefive)
- UI 套壳：[Python pywebview](https://pywebview.flowrl.com/)
- 图标资源 `icon.ico`：提取自原版 FileFive 项目
