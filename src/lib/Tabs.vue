<template>
  <div class="eminent-tabs" :class="classes">
    <div class="eminent-tabs-nav" ref="container">
      <div
        class="eminent-tabs-nav-item"
        v-for="(title, index) in titles"
        :ref="
          (el) => {
            if (title === selected) selectedItem = el;
          }
        "
        @click="select(title)"
        :class="navItemClasses(title)"
        :key="index"
      >
        {{ title }}
      </div>
      <div class="eminent-tabs-nav-indicator" ref="indicator"></div>
    </div>
    <div class="eminent-tabs-content">
      <component :is="current" :key="current.props.title" />
    </div>
  </div>
</template>

<script lang="ts">
import Tab from "./Tab.vue";
import { computed, ref, watchEffect, onMounted } from "vue";
declare const props: { selected: String; direction: String };
export default {
  props: {
    selected: {
      type: String,
    },
    direction: {
      type: String,
      default: "horizontal",
    },
  },
  setup(props, context) {
    const classes = computed(() => ({
      [`eminent-direction-${props.direction}`]: props.direction,
    }));
    const navItemClasses = (title) => ({
      [`eminent-tabs-nav-item-disabled`]: disabledItem[title],
      ["selected"]: title === props.selected,
    });
    const selectedItem = ref<HTMLDivElement>(null);
    const indicator = ref<HTMLDivElement>(null);
    const container = ref<HTMLDivElement>(null);
    onMounted(() => {
      watchEffect(
        () => {
          const div = selectedItem.value;
          const { width, height } = div.getBoundingClientRect();
          const left = div.offsetLeft;
          const top = div.offsetTop;
          if (props.direction === "horizontal") {
            indicator.value.style.width = width + "px";
            indicator.value.style.left = left + "px";
          } else if (props.direction === "vertical") {
            indicator.value.style.height = height + "px";
            indicator.value.style.top = top + "px";
          }
        },
        {
          flush: "post",
        }
      );
    });
    const disabledItem = context.slots.default().reduce(
      (obj, tag) =>
        tag.props["disabled"]
          ? {
              ...obj,
              [tag.props["title"]]: true,
            }
          : obj,
      {}
    );
    const defaults = context.slots.default();
    defaults.forEach((tag) => {
      // if (tag.type !== Tab) {
      // @ts-ignore
      if (tag.type.name !== Tab.name) {
        throw new Error("Tabs 子标签必须是 Tab");
      }
    });
    const current = computed(() => {
      return defaults.find((tag) => tag.props.title === props.selected);
    });
    const titles = defaults.map((tag) => {
      return tag.props.title;
    });
    const select = (title: string) => {
      if (Object.keys(disabledItem).indexOf(title) >= 0) return;
      context.emit("update:selected", title);
    };
    return {
      current,
      defaults,
      titles,
      select,
      selectedItem,
      indicator,
      container,
      classes,
      navItemClasses,
      disabledItem,
    };
  },
};
</script>

<style lang="scss">
$blue: #40a9ff;
$color: #333;
$border-color: #d9d9d9;
.eminent-tabs {
  display: flex;
  &-nav {
    display: flex;
    color: $color;
    position: relative;
    &-item {
      padding: 8px 12px;
      cursor: pointer;
      &:first-child {
        margin-left: 0;
      }
      &.selected {
        color: $blue;
      }
      &.eminent-tabs-nav-item-disabled {
        cursor: not-allowed;
        color: #dfdfdf;
      }
    }
    &-indicator {
      position: absolute;
      height: 3px;
      background: $blue;
      bottom: -1px;
      width: 100px;
      transition: all 250ms;
    }
  }
  &-content {
    padding: 8px 0;
  }
  &.eminent-direction-horizontal {
    flex-direction: column;
    & > .eminent-tabs-content {
      padding: 1em;
    }
    & > .eminent-tabs-nav {
      border-bottom: 1px solid rgba(0, 0, 0, 0.1);
      flex-direction: row;
      > .eminent-tabs-indicator {
        height: 2px;
        bottom: -1px;
        left: 0;
      }
    }
  }
  &.eminent-direction-vertical {
    flex-direction: row;
    & > .eminent-tabs-content {
      padding: 0.5em 1em;
    }
    & > .eminent-tabs-nav {
      border-right: 1px solid rgba(0, 0, 0, 0.1);
      flex-direction: column;
      > .eminent-tabs-nav-indicator {
        width: 3px;
        top: 0;
        right: -1px;
      }
    }
  }
}
</style>
