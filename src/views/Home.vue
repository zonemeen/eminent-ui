<template>
  <div class="topnavAndBanner">
    <Topnav />
    <div class="banner">
      <h1><b>Eminent UI </b></h1>
      <h3>是的，一个杰出的 UI 组件库</h3>
      <p class="actions">
        <a href="//github.com/miqilin21/eminent-ui/" target="_blank">Github</a>
        <router-link to="/doc">开始</router-link>
      </p>
    </div>
  </div>
  <div class="features">
    <ul>
      <li>
        <Icon iconLink="Vue" className="features-icon" />
        <h3>基于 Vue 3</h3>
        <p>快人一步使用 Vue 3 Composition API</p>
      </li>
      <li>
        <Icon iconLink="typescript" className="features-icon" />
        <h3>基于 TypeScript</h3>
        <p>源代码采用 TypeScript 书写</p>
      </li>
      <li>
        <Icon iconLink="easy" className="features-icon" />
        <h3>优雅简洁</h3>
        <p>每个组件的源代码都简洁易读</p>
      </li>
    </ul>
  </div>
  <footer>MIT Licensed | Copyright © miqilin21</footer>
</template>

<script lang="ts">
import Icon from "../components/Icon.vue";
import Topnav from "../components/Topnav.vue";
export default {
  components: { Topnav, Icon },
};
</script>

<style lang="scss" scoped>
$blue: #1296d8;
.topnavAndBanner {
  background: linear-gradient(
    145deg,
    rgba(245, 253, 255, 1) 0%,
    rgba(237, 251, 255, 1) 100%
  );
  border-bottom-left-radius: 13%;
  border-bottom-right-radius: 13%;
  .banner {
    padding: 80px 0 160px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    > .actions {
      padding: 16px 0;
      a {
        margin: 0 14px;
        color: #fff;
        background: $blue;
        display: inline-block;
        padding: 3px 16px;
        border-radius: 4px;
        &:hover,
        &:focus {
          background: darken($blue, 10%);
        }
      }
    }
  }
}
.features {
  margin: 64px auto;
  padding: 0 16px;
  > ul {
    display: flex;
    flex-wrap: wrap;
    > li {
      margin: 16px 0;
      display: grid;
      align-items: center;
      justify-content: start;
      align-content: space-between;
      grid-template-areas:
        "icon title"
        "icon text";
      grid-template-columns: 80px auto;
      grid-template-rows: 1fr auto;
      > .features-icon {
        grid-area: icon;
        width: 64px;
        height: 64px;
      }
      > h3 {
        grid-area: title;
        font-size: 28px;
      }
      > p {
        grid-area: text;
      }
    }
  }
  @media (min-width: 768px) {
    width: 768px;
    > ul {
      > li {
        width: 50%;
      }
    }
  }
  @media (min-width: 1200px) {
    width: 1200px;
    > ul {
      > li {
        width: 33.33%;
      }
    }
  }
}
footer {
  bottom: 5vh;
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1em;
}
</style>
