<template>
  <div class="mt-4">
    <section class="hero is-fullheight container">
      <div class="columns is-centered is-desktop">
        <div class="column is-size-2">
          <WindDirection :windDirection="getWindDirection" :windSpeed="getWindSpeed"/>
          <div class="column has-text-centered">
            <!--            {{ getWindDirection }}-->
            {{ getWindSpeed }} m/s
          </div>
        </div>
        <div class="column is-size-2 has-text-centered">
          <div class="column">{{ getTemperature }} ℃</div>
          <div class="column">{{ getHumidity }} %</div>
          <div class="column">{{ getHectopascal }} hPa</div>
        </div>
        <div class="column is-size-2">
          <figure class="image container is-128x128">
            <img src="~/assets/cloudy.svg" height="182" width="182" />
          </figure>
          <div class="column has-text-centered">{{ get1hRain }} mm/1h</div>
        </div>
      </div>
      <div class="tabs is-centered column">
        <ul>
          <li v-on:click="change('3600')" :class="{ 'is-active': isActive == '3600'}">
            <a>過去1時間</a>
          </li>
          <li v-on:click="change('600')" :class="{ 'is-active': isActive == '600'}">
            <a>過去10分間</a>
          </li>
          <li v-on:click="change('60')" :class="{ 'is-active': isActive == '60'}">
            <a>リアルタイム</a>
          </li>
        </ul>
        <div v-if="!resetFlag" class="column columns">
          <div class="column">
            <TemperatureChart v-if="isActive == '3600'" :chartdata="getHourData()"/>
            <TemperatureChart v-if="isActive == '600'" :chartdata="getMinuteData(10)"/>
            <TemperatureChart v-if="isActive == '60'" :chartdata="getMinuteData(1)"/>
          </div>
          <div class="column">
            <HumidityChart v-if="isActive == '3600'" :chartdata="getHourData()"/>
            <HumidityChart v-if="isActive == '600'" :chartdata="getMinuteData(10)"/>
            <HumidityChart v-if="isActive == '60'" :chartdata="getMinuteData(1)"/>
          </div>
        </div>
      </div>

      <!--      <LineChart :chartdata="chart_data" :options="options" :height="182"/>-->
      <!--      <LineChart :chartdata="chart_data" :options="options" :height="182"/>-->
    </section>
  </div>
</template>

<script>
import axios from "axios";
import moment from 'moment';
import jsonData from "@/data/1h-recent.json";

import WindDirection from "@/components/WindDirection.vue"
import TemperatureChart from "@/components/TemperatureChart.vue";
import HumidityChart from "@/components/HumidityChart.vue";

const interval = 66;

// function sleep(time) {
//   return new Promise((resolve) => {
//     setTimeout(resolve, time);
//   });
// }

export default {
  data() {
    return {
      isActive: "3600",
      meteorological_raw: jsonData,
      resetFlag: false,
    };
  },
  // created: function () {
  //   setInterval(async () => {
  //     const url = process.env.JSON_SERVER_URL;
  //     const response = await axios.get(url);

  //     this.meteorological_raw = response.data;
      
  //     this.resetFlag = true;
  //     this.$nextTick(() => {
  //       this.resetFlag = false;
  //     })

  //   }, 5000);
  // },
  // async asyncData({ $axios }) {
  //   // while (true) {
  //   // 環境変数からURLを取得
  //   const url = process.env.JSON_SERVER_URL;
  //   // ??????Get?
  //   const response = await $axios.$get(url);
  //   // ??????????JSON?????
  //   return {
  //     meteorological_raw: response,
  //   };
  //   // }
  //   // await sleep(10000);
  // },
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
      // const { windSpeed } =this.meteorological_raw[0]
      const windSpeed = 24.9//Math.floor((5 / 2.237) * 10) / 10;

      let windSpeedIcon = '0'

      // console.log(windSpeed / 5);
      // console.log('switch',Math.floor(windSpeed / 5));

      console.log(windSpeedIcon);

      return (
        Math.floor((this.meteorological_raw[0].windSpeed / 2.237) * 10) / 10
      );
    },
    getWindDirection: function () {
      return this.meteorological_raw[0].windDirection;
    },
    
  },
  methods: {
    change: function (num) {
      this.isActive = num;

      this.resetFlag = true;
      this.$nextTick(() => {
        this.resetFlag = false;
      })
    },
    getHourData() {
      return this.meteorological_raw
        .filter((x, y) => y % Math.round(this.meteorological_raw.length / 30) === 0)
        .reverse();
    },
    getMinuteData(minutes) {
      const last = moment(this.meteorological_raw[0].updatedAt).subtract(minutes, 'minutes')

      return this.meteorological_raw
        .filter((x, y) => moment(x.updatedAt).isAfter(last))
        .filter((x, y, z) => {
          if (z.length >= 30) { // もし要素数が 30 以上なら要素数を減らす
            return y % Math.round(z.length / 30) == 0
          }

          return true;
          })
        .reverse();
    },
  },
  
};
</script>
