<template>
  <div>
    <!-- {{ meteorological[0] }} -->
    <br />
    {{ getTemperature }} ℃
    <br />
    {{ get1hRain }} mm/1h
    <br />
    {{ getHumidity }} %
    <br />
    {{ meteorological_raw[0].pressure / 25600 }} hpa
    <br />
    {{ meteorological_raw[0].windSpeed / 2.237 }} m/s
    <br />
    {{ meteorological_raw[0].windDirection }}
  </div>
</template>

<script>
import jsonData from "@/data/1h-recent.json";

export default {
  data() {
    return {
      meteorological_raw: jsonData,
    };
  },
  computed: {
    getTemperature: function () {
      return this.meteorological_raw[0].temperature / 100;
    },
    get1hRain: function () {
      return (
        (this.meteorological_raw[0].rain - this.meteorological_raw.pop().rain) * 25.4
      );
    },
    getHumidity: function () {
      return Math.round(this.meteorological_raw[0].humidity / 1024 * 100) / 100
    },
  },
};
</script>