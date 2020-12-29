<template>
  <div class="topnav">
    <router-link class="logo" to="/">
      <Icon iconLink="logo" className="logoE" />
      <span class="hide">minent</span>
    </router-link>
    <ul class="menu hide">
      <li>
        <router-link to="/doc">文档</router-link>
      </li>
    </ul>
  </div>
</template>

<script lang="ts">
import Icon from "../lib/Icon.vue";
export default {
  name: "Topnav",
  components: { Icon },
};
</script>

<style lang="scss" scoped>
$color: #1296d8;
.topnav {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 16px;
  z-index: 20;
  color: $color;
  > .logo {
    max-width: 6em;
    margin-right: auto;
    font-weight: 600;
    font-style: italic;
    line-height: 16px;
    > .logoE {
      width: 1.3em;
      height: 1.3em;
    }
  }
  > .menu {
    display: flex;
    white-space: nowrap;
    flex-wrap: nowrap;
    > li {
      margin: 0 1em;
      &:hover,
      &:focus {
        color: darken($color, 10%);
      }
    }
  }
  @media (max-width: 500px) {
    .hide {
      display: none;
    }
    > .logo {
      margin: 0 auto;
    }
  }
}
</style>
