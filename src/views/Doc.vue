<template>
  <div class="layout" @click="clickLayout">
    <Icon
      iconLink="menu"
      :className="IconClassName"
      @click.stop="toggleMenu"
      class="returns"
    />
    <Topnav class="nav" iconVisible />
    <div class="content">
      <aside v-if="menuVisible" ref="aside">
        <h2>文档</h2>
        <ol>
          <li>
            <router-link to="/doc/intro">介绍</router-link>
          </li>
          <li>
            <router-link to="/doc/install">安装</router-link>
          </li>
          <li>
            <router-link to="/doc/get-started">开始使用</router-link>
          </li>
        </ol>
        <h2>组件列表</h2>
        <ol>
          <li>
            <router-link to="/doc/switch">Switch 组件</router-link>
          </li>
          <li>
            <router-link to="/doc/button">Button 组件</router-link>
          </li>
          <li>
            <router-link to="/doc/dialog">Dialog 组件</router-link>
          </li>
          <li>
            <router-link to="/doc/tabs">Tabs 组件</router-link>
          </li>
          <li>
            <router-link to="/doc/checkbox">CheckBox 组件</router-link>
          </li>
          <li>
            <router-link to="/doc/tag">Tag 组件</router-link>
          </li>
          <li>
            <router-link to="/doc/progress">Progress 组件</router-link>
          </li>
        </ol>
      </aside>
      <main><router-view /></main>
    </div>
  </div>
</template>

<script lang="ts">
import Icon from "../lib/Icon.vue";
import Topnav from "../components/Topnav.vue";
import { computed, ref } from "vue";
export default {
  components: { Topnav, Icon },
  setup() {
    const width = ref(document.documentElement.clientWidth);
    const menuVisible = ref(width.value >= 500);
    window.onresize = () => {
      width.value = document.documentElement.clientWidth;
      menuVisible.value = width.value >= 500;
    };
    const toggleMenu = () => {
      menuVisible.value = !menuVisible.value;
    };
    const aside = ref<HTMLDivElement>(null);
    const clickLayout = (e) => {
      if (width.value >= 500) return;
      if (aside.value?.contains(e.target) || !menuVisible.value) return;
      toggleMenu();
    };
    const IconClassName = computed(() => {
      return menuVisible.value ? "toggleMenu fixed" : "toggleMenu";
    });
    return { menuVisible, toggleMenu, clickLayout, IconClassName, aside };
  },
};
</script>

<style lang="scss" scoped>
.layout {
  display: flex;
  flex-direction: column;
  height: 100vh;
  > .toggleMenu {
    display: none;
    z-index: 3;
  }
  > .returns {
    position: fixed !important;
  }
  > .nav {
    flex-shrink: 0;
    z-index: 2;
    background-color: #fff;
    border-bottom: 1px solid rgb(217, 217, 217);
  }
  > .content {
    flex-grow: 1;
    padding-top: 60px;
    padding-left: 156px;
    display: flex;
    > aside {
      flex-shrink: 0;
      background: #fff;
      width: 150px;
      padding: 16px 0;
      position: fixed;
      top: 0;
      left: 0;
      padding-top: 70px;
      height: 100%;
      border-right: 1px solid rgb(217, 217, 217);
      z-index: 1;
      > h2 {
        margin-bottom: 4px;
        padding: 0 16px;
      }
      > ol {
        > li {
          > a {
            display: block;
            padding: 4px 16px;
            text-decoration: none;
          }
          .router-link-active {
            color: #409eff;
          }
        }
      }
    }
    > main {
      overflow: auto;
      flex-grow: 1;
      padding: 16px;
      background: white;
    }
    @media (max-width: 500px) {
      padding-left: 0;
    }
  }
  @media (max-width: 500px) {
    > .toggleMenu {
      width: 1.5em;
      height: 1.5em;
      display: inline-block;
      position: absolute;
      left: 1em;
      top: 1.5em;
      transform: translateY(-50%);
      cursor: pointer;
    }
    > .toggleMenu.fixed {
      position: fixed;
    }
  }
}
</style>
