<template>
  <div>
    <!-- {{ meteorological[0] }}
    <br /> -->
    {{ meteorological[0].temperature / 100 }} ℃
    <br />
    {{ (meteorological[0].rain - meteorological.pop().rain) * 25.4}}mm/1h
    <br />
    {{ meteorological[0].humidity / 1024 }} %
    <br />
    {{ meteorological[0].pressure / 25600 }} hpa
    <br />
    {{ meteorological[0].windSpeed / 2.237 }} m/s
    <br />
    {{ meteorological[0].windDirection }}
  </div>
</template>

<script>
import jsonData from "@/data/1h-recent.json";

export default {
  data() {
    return {
      meteorological: jsonData,
    };
  },
};
</script>