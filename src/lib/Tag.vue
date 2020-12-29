<template>
  <div
    :class="[
      'eminent-ui-tag',
      `eminent-ui-tag-${size}`,
      `eminent-ui-tag-${type}`,
    ]"
    :style="{ color: color }"
  >
    <slot />
  </div>
</template>

<script lang="ts">
import {
  computed,
  ref,
  watchEffect,
  onMounted,
  SetupContext,
  Component,
} from "vue";
export default {
  name: "EminentTag",
  props: {
    size: {
      type: String,
      default: "normal",
    },
    color: {
      type: String,
      default: "#1ABE96",
    },
    type: {
      type: String,
      default: "",
    },
    closeable: {
      type: Boolean,
      default: false,
    },
    effect: {
      type: String,
      default: "light",
    },
  },
  setup(props, context) {
    console.log(props, context);
    console.log(Object.entries(props));
  },
};
</script>

<style lang="scss">
$success: #1abe96;
$warn: #bc1a42;
$info: #38879b;
.eminent-ui-tag {
  background-color: #ecf5ff;
  display: inline-block;
  height: 32px;
  padding: 0 10px;
  line-height: 30px;
  font-size: 12px;
  color: #409eff;
  border: 1px solid #d9ecff;
  border-radius: 4px;
  box-sizing: border-box;
  white-space: nowrap;
  &-success {
  }
  &-waring {
    background-color: #fdf6ec;
    border-color: #faecd8;
    color: $warn;
  }
  &-danger {
    color: red;
  }
  &-info {
    background-color: #f4f4f5;
    border-color: #e9e9eb;
    color: #909399;
  }
  &-medium {
    height: 28px;
    line-height: 26px;
  }
  &-small {
    height: 24px;
    padding: 0 8px;
    line-height: 22px;
  }
}
</style>
