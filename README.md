# bjtu-bachelor-thesis

# 2025年Patch

* Fork自：https://github.com/paulzhn/bjtu-bachelor-thesis
* 原README见 [2024年及以前的原README](#2024年及以前的原README)

## 如何在VSCode部署

* 本人不常用latex，所以这里记录一下在本地部署的步骤，以便自己和其他人查阅
* 为什么要在vscode上部署？
  * 有copilot啊（逃）
* 懒的写了，参考链接
  * 优先：https://zhuanlan.zhihu.com/p/166523064
  * 备选：https://zhuanlan.zhihu.com/p/435088542
* 命令行编译
  * VSCode的Latex插件并不是很好用，所以可以采用更直接的命令行编译
  * 编译命令

    ```bash
    xelatex -synctex=1 -interaction=nonstopmode -file-line-error template.tex
    biber template
    xelatex -synctex=1 -interaction=nonstopmode -file-line-error template.tex
    xelatex -synctex=1 -interaction=nonstopmode -file-line-error template.tex
    ```
  * 详细参见模板根目录下的 `justfile`

# 2024年及以前的原README

本模板是北京交通大学本科毕业设计的非官方LaTeX模板，尽量还原了官方给出的word模板样式。尽管不能做到完全一致，但在肉眼看上去基本没有差别。我的LaTeX水平极其有限，因此这个模板追求的是能跑起来就行，里面代码是非常丑陋的。也希望如果有比较精通LaTeX模板的同学，能继续加以修改，让更多的人能够摆脱word的困扰。当然，如果学校能提供一份官方的LaTeX模板则是最好，目前研究生院已经提供了，还希望本科生院也能加把劲。

本模板是基于 https://github.com/billhu0228/BJTUThesisTemplete 的模板修改而来，感谢billhu0228。

注：
1. 请使用XeLaTeX编译，反馈QQ群：1021063106
2. 附带的几个字体文件，是因为LaTeX中易系列的字体其实是跟word里的有一些差别，通篇看上去其实区别还是挺大的
3. 本模板尚未经过验证，可能会有bug，如果你遇到了，请及时反馈，我会尽快修复。
4. overleaf模板地址：[点这里](https://www.overleaf.com/read/cjkrjfvczbvc)，这是一个个人模板，你可以登录overleaf之后，创建一份copy，就可以使用了。因为这个模板可能还会有修改，因此暂且不会上传到gallery，等到没有问题之后再上传。
5. 基于第3条，overleaf上的模板可能会有变动，而我修改overleaf上的模板，是无法把改动同步到基于模板派生出来的文档的。因此，需要你手动把新的.cls或者.tex文件更新一下。

## FAQ

### 有奇怪的找不到包的问题怎么办？

可能你装的tex live有问题。对于一般用户，建议使用overleaf，可以节省大部分配环境的时间。

### pdf是否会比word格式查重率更高？

**有可能会，但影响非常小。** pdf查重率更高的原因是，知网的查重系统可能无法正确识别页眉等部分，对于像“北京交通大学毕业设计”这样的字也一起识别成正文，从而导致整体查重率偏高。就作者个人经验来说，60页的论文，其中有几页的页眉被标红了，剩下的并没有。此外，对于封面、权利授权书、参考文献、公式等，查重系统均可正常识别。问了三个使用本模板的同学，有两个查重率低于1%（其中一个是理学院），另一个约为12%，也均在学校要求范围内。因此，如果你的论文内有较多的公式，可以考虑使用本模板，可以帮你节约一些浪费在word排版上的生命。

### 封面间距奇怪怎么办？

目前没有很好的解决方案，这个项目的cls文件确实不能很好地兼容各种行数的标题（例如，中文1行英文两行，中文两行英文三行，这两种展现情况会有比较大的差异），需要使用者自行调整。调整方法也非常简单，找到`bjtu-bachelor-thesis.cls`这个文件的大约269行，调整各个`\vspace`后面的数值就可以了。`\vfill`也可以尝试加上或者去掉。此外，对于两行中文三行英文的标题，英文第一行和第二行之间的间距会奇怪地变大，这里原因未知，目前有很简单粗暴的解决方案，就是在`template.tex`中的`\etitle`添加一个负的间距，例如

```tex
\etitle{AAAAA \\[-0.8em] BBBBB \\ CCCCC}
```

具体数值可以自己调整。如果有更好的解决方案，欢迎提pr。

### 排版问题，如何将表格或图片的位置进行固定？

在排版的时候，可能会发现这样的情况，例如你有

```tex
AAAA
\begin{figure}[htpb]
\end{figure}
BBBB
CCCC
````

然后排出来的版面却是这样的

```tex
AAAA
BBBB
{figure}
CCCC
````

对于这种问题，可以将`htpb`换成`H`。但大概率会引入非常离谱的间距，这是因为latex默认是按照上下两端对齐来排版的，如果字不够填满一页，就会加大行间距，显得非常怪。对于这种问题，可以手动在排出来那一页的末尾加`\newpage`强行换页，行间距就正常了。当然，也可以尝试将图片的高度缩小，或者多填点字。

### 为什么我插入到.bib中的引用不显示？

请先确认下是否在正文中引用过了，biblatex的默认行为是只有引用过的文献才会显示在参考文献页面。当然，如果你需要显示全部文献（即使没有引用到），可以取消注释229行附近的`\nocite`，但不推荐这么做，可能会被答辩老师怼。

### 如何找bibtex引用？

知网默认是不提供bibtex引用格式的。可以通过谷歌学术、百度学术来获取你需要论文的bibtex引用，或者是直接去对应期刊网站上找cite。另外，还可以使用在线生成器，例如 https://www.bibme.org/bibtex 。

### 版权授权页，如何插入电子签名？

目前本项目的latex源码不支持在签名处插入图片（尝试调整了几个版本，效果都比较差），我最后的解决方案是，在最终pdf上使用pdf编辑器（acrobat等）直接插入图片。当然，如果有更好的解决方案，也欢迎提pr。

