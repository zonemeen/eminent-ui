<template>
  <h1>Progress 示例</h1>
  <Demo :component="ProgressDemo1" />
</template>

<script lang="ts">
import ProgressDemo1 from "./Progress/Progress1.demo.vue";
import Demo from "./Demo.vue";
export default {
  components: {
    Demo,
  },
  setup() {
    return {
      ProgressDemo1,
    };
  },
};
</script>
