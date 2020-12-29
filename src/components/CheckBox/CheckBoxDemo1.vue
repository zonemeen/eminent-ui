<demo>常规用法</demo>
<template>
  <div class="checkbox-wrap">
    <CheckBox label="复选" theme="black" color="black"></CheckBox>
    <CheckBox label="禁用" disabled></CheckBox>
  </div>
</template>

<script lang="ts">
import { CheckBox } from "../../lib/index";
export default {
  name: "CheckBoxDemo1",
  components: { CheckBox },
};
</script>

<style lang="scss" scoped>
.checkbox-wrap {
  > .eminent-checkbox {
    margin: 0 16px;
  }
}
</style>
