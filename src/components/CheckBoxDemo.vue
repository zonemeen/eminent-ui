<template>
  <h1>CheckBox 示例</h1>
  <div class="eminent-checkbox-doc">
    <Demo :component="CheckBoxDemo1" />
    <Demo :component="CheckBoxDemo2" />
  </div>
</template>

<script lang="ts">
import { CheckBox } from "../lib/index";
import CheckBoxDemo1 from "./CheckBox/CheckBoxDemo1.vue";
import CheckBoxDemo2 from "./CheckBox/CheckBoxDemo2.vue";
import Demo from "./Demo.vue";
export default {
  name: "CheckBoxDemo",
  components: { Demo, CheckBox },
  setup() {
    return {
      CheckBoxDemo1,
      CheckBoxDemo2,
    };
  },
};
</script>

<style lang="scss" scoped>
.eminent-checkbox-doc {
  display: flex;
  flex: 1;
  flex-direction: column;
  .eminent-checkbox-demo {
    text-align: left;
    flex-direction: column;
    border: 1px solid #f6f6f6;
    .eminent-checkbox + .eminent-checkbox {
      margin-left: 16px;
    }
    &-example {
      padding: 16px;
      border: 1px solid #f6f6f6;
    }
    &-code {
      padding: 16px;
    }
  }
}
</style>
