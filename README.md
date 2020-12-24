<p align="center">
  <a href="/">
    <img width="400" src="./logo.png">
  </a>
</p>

<h1 align="center">Eminent UI</h1>

<div align="center">

一个基于 vue3 + vite 开构建的 UI 组件库。

[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/miqilin21/eminent-ui/blob/main/LICENSE)

</div>

## ✨ 特别说明

这款组件库其实是我为了学习`vue3`以及巩固自己知识而写。

全程亲手编写，尽量不采用第三方库，包括你看到的官网也几乎都是我自己写的。

此库纯属个人练手项目，未经过系统严格的测试，所以**强烈不建议你将此 UI 库用于生产环境！**

## 📦 安装

```
npm install eminent-ui
```

或

```
yarn add eminent-ui
```

## 🔨 开始使用

请先安装本组件库。

然后在你的代码中写入下面的代码：

```
import 'eminent-ui/dist/lib/eminent.css';
import {Button, Tabs, Tab, Switch, Dialog, openDialog} from "eminent-ui"
```

就可以使用我提供的组件了。

代码示例：

```vue
<template>
  <div>
    <Button>按钮</Button>
  </div>
</template>
<script>
import { Button } from "eminent-ui";
export default {
  components: {
    Button,
  },
};
</script>
```
