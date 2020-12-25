<template>
  <h1>Tag 示例</h1>
  <Demo :component="TagDemo1"></Demo>
</template>

<script lang="ts">
import { ref } from "vue";
import { Tag } from "../lib/index";
import Demo from "./Demo.vue";
import TagDemo1 from "./Tag/TagDemo1.vue";
export default {
  name: "TagDemo",
  components: {
    Tag,
    Demo,
  },
  setup() {
    return {
      TagDemo1,
    };
  },
};
</script>

<style lang="scss">
.tag-demo {
  .eminent-ui-tag + .eminent-ui-tag {
    margin-left: 16px;
  }
}
</style>
