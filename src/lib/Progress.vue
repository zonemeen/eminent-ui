<template>
  <div
    class="eminent-progress"
    ref="progressRef"
    @mousedown="onMouseDown($event)"
    @mouseenter="showIcon"
  >
    <div class="eminent-progress-wrap">
      <div class="eminent-progress-bar" :style="barStyle"></div>
    </div>
  </div>
</template>

<script lang="ts">
import { computed, nextTick, reactive, ref, watch, watchEffect } from "vue";
declare const props: { percentage: Number };
export default {
  props: {
    percentage: {
      type: Number,
      default: 20,
    },
  },
  setup(props) {
    const percentage = ref(props.percentage);
    const progressRef = ref(null);
    const moveData = {
      progressStart: 0,
      mouseStart: 0,
      times: 0,
      isPress: false,
      offsetLeft: 0,
    };
    nextTick(() => {
      moveData.times = progressRef.value.offsetWidth / 100;
      moveData.offsetLeft = progressRef.value.getBoundingClientRect().left;
    });
    let barStyle = computed(() => {
      return {
        transform: `translateX(-${100 - percentage.value}%)`,
      };
    });
    const onMouseMove = (e) => {
      e.preventDefault();
      if (moveData.isPress) {
        let x =
          moveData.progressStart +
          (e.clientX - moveData.mouseStart) / moveData.times;
        percentage.value = x;
        if (percentage.value < 0) percentage.value = 0;
        if (percentage.value > 100) percentage.value = 100;
      }
    };
    const onMouseDown = (e) => {
      moveData.isPress = true;
      moveData.mouseStart = e.clientX;
      moveData.progressStart =
        (moveData.mouseStart - moveData.offsetLeft) / moveData.times;
      percentage.value = moveData.progressStart;
    };
    const onMouseUp = () => {
      moveData.isPress = false;
    };
    watchEffect(() => {
      document.addEventListener("mousemove", onMouseMove);
      document.addEventListener("mouseup", onMouseUp);
    });
    return {
      barStyle,
      onMouseDown,
      progressRef,
      percentage,
    };
  },
};
</script>

<style lang="scss">
.eminent-progress {
  position: relative;
  width: 100%;
  height: 4px;
  border-radius: 10px;
  cursor: pointer;
  &:hover,
  &:active {
    transform: scaleY(1.5);
  }
  &:hover &-icon {
    transform: scaleX(1.5) translateY(-50%) translateX(50%);
  }
  &-wrap {
    overflow: hidden;
    width: 100%;
    height: 100%;
    border-radius: 10px;
    background: rgba(173, 176, 190, 0.4);
  }
  &-bar {
    width: 100%;
    height: 100%;
    background: #00a1d6;
  }
  @media (max-width: 500px) {
    .eminent-progress-icon {
      transform: scale(1) translateY(-50%) translateX(50%);
    }
  }
}
</style>
