<template>
  <div>
    <slot />
  </div>
</template>

<script lang="ts">
export default {
  name: "EminentTab",
  props: {
    disabled: {
      type: Boolean,
      default: false,
    },
  },
};
</script>
