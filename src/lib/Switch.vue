<template>
  <button class="eminent-switch" @click="toggle" :class="classes">
    <span class="eminent-ball"></span>
  </button>
</template>

<script lang="ts">
import { computed, ref } from "vue";
declare const props: {
  value: Boolean;
  size?: "normal" | "big" | "small";
  disabled: boolean;
};
export default {
  props: {
    value: Boolean,
    size: {
      type: String,
      default: "normal",
    },
    disabled: {
      type: Boolean,
      default: false,
    },
  },
  setup(props, context) {
    const toggle = () => {
      if (props.disabled) return;
      context.emit("update:value", !props.value);
    };
    const classes = computed(() => {
      return {
        [`eminent-size-${props.size}`]: true,
        [`eminent-checked`]: props.value,
        [`eminent-disabled`]: props.disabled,
      };
    });
    return {
      toggle,
      classes,
    };
  },
};
</script>

<style lang="scss">
$h: 22px;
$h2: $h - 4px;
$grey: grey;
.eminent-switch {
  height: $h;
  width: $h * 2;
  border: none;
  background: #bfbfbf;
  border-radius: $h/2;
  position: relative;
  > span {
    position: absolute;
    top: 2px;
    left: 2px;
    height: $h2;
    width: $h2;
    background: white;
    border-radius: $h2 / 2;
    transition: all 250ms;
  }
  &.eminent-checked {
    background: #1890ff;
    > span {
      left: calc(100% - #{$h2} - 2px);
    }
  }
  &[disabled] {
    cursor: not-allowed;
    color: $grey;
    &:hover {
      border-color: $grey;
    }
  }
  &.eminent-size-big {
    $h: $h + 3px;
    $h2: $h;
    height: $h;
    width: $h * 2;
    & > .eminent-ball {
      height: $h2 - 4px;
      width: $h2 - 3px;
    }
    &.eminent-checked > .eminent-ball {
      left: calc(100% - #{$h2} + 1px);
    }
    &:active:not(.eminent-disabled) > .eminent-ball {
      width: $h2 + 4px;
    }
    &.eminent-checked:active:not(.eminent-disabled) > .eminent-ball {
      left: calc(100% - #{$h2} - 6px);
    }
  }
  &.eminent-size-small {
    $h: $h - 5.5px;
    $h2: $h - 4px;
    height: $h;
    width: $h * 2;
    & > .eminent-ball {
      height: $h2;
      width: $h2;
    }
    &.eminent-checked > .eminent-ball {
      left: calc(100% - #{$h2} - 2px);
    }
    &:active:not(.eminent-disabled) > .eminent-ball {
      width: $h2 + 4px;
    }
    &.eminent-checked:active:not(.eminent-disabled) > .eminent-ball {
      left: calc(100% - #{$h2} - 6px);
    }
  }
  &:focus {
    outline: none;
  }
  &:active {
    > span {
      width: $h2 + 4px;
    }
  }
  &.eminent-checked:active {
    > span {
      width: $h2 + 4px;
      margin-left: -4px;
    }
  }
}
</style>
