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
    {{ getHectopascal }} hpa
    <br />
    {{ getWindSpeed }} m/s
    <br />
    {{ getWindDirection }}
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
  async asyncData({ $axios }) {
    // ????URL
    const url = process.env.JSON_SERVER_URL;
    // ??????Get?
    const response = await $axios.$get(url);
    // ??????????JSON?????
    return {
      meteorological_raw: response,
    };
  },

  computed: {
    getTemperature: function () {
      return this.meteorological_raw[0].temperature / 100;
    },
    get1hRain: function () {
      return (
        (this.meteorological_raw[0].rain - this.meteorological_raw.pop().rain) *
        25.4
      );
    },
    getHumidity: function () {
      return (
        Math.round((this.meteorological_raw[0].humidity / 1024) * 100) / 100
      );
    },
    getHectopascal: function () {
      return Math.round(this.meteorological_raw[0].pressure / 25600);
    },
    getWindSpeed: function () {
      return (
        Math.floor((this.meteorological_raw[0].windSpeed / 2.237) * 10) / 10
      );
    },
    getWindDirection: function () {
      return this.meteorological_raw[0].windDirection;
    },
  },
};
</script>