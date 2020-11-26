<template>
  <div class="mt-4">
    <section class="hero is-fullheight container">
      <div>
        <MarqueeText class="is-size-4"
                     :duration="30"
                     :repeat="2"
        >現在の天気は曇り。現在の気温は{{ getTemperature }}°、湿度は{{ getHumidity }}%です。{{ getMarqueeText }}　　　　　　　　　　　　　　　　　　
          　　　　　　　　　　　　　　　　　　　　
        </MarqueeText>
      </div>
      <div class="columns is-centered is-desktop">
        <div class="column is-size-2 mt-6">
          <WindDirection :windDirection="getWindDirection" :windSpeed="getWindSpeed"/>
          <div class="column has-text-centered">{{ getWindSpeed }} m/s</div>
        </div>
        <div class="column is-size-2 has-text-centered">
          <div class="column">{{ getTemperature }} ℃</div>
          <div class="column">{{ getHumidity }} %</div>
          <div class="column">{{ getHectopascal }} hPa</div>
        </div>
        <div class="column is-size-2 mt-6">
          <figure class="image container is-128x128">
            <img src="~/assets/cloudy.svg" height="182" width="182"/>
          </figure>
          <div class="column has-text-centered">{{ get1hRain }} mm/1h</div>
        </div>
      </div>
      <div class="tabs is-centered column">
        <ul>
          <li v-on:click="tabChange('3600')" :class="{ 'is-active': isActive == '3600'}">
            <a>過去1時間</a>
          </li>
          <li v-on:click="tabChange('600')" :class="{ 'is-active': isActive == '600'}">
            <a>過去10分間</a>
          </li>
          <li v-on:click="tabChange('60')" :class="{ 'is-active': isActive == '60'}">
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
    </section>
  </div>
</template>

<script>
import axios from "axios";
import moment from "moment";
import jsonData from "@/data/1h-recent.json";
import MarqueeText from "vue-marquee-text-component";

import WindDirection from "@/components/WindDirection.vue";
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
  created: function () {
    setInterval(async () => {
      const url = process.env.JSON_SERVER_URL;
      const response = await axios.get(url);

      this.meteorological_raw = response.data;

      this.resetFlag = true;
      this.$nextTick(() => {
        this.resetFlag = false;
      });
    }, 5000);
  },
  async asyncData({$axios}) {
    // 環境変数からURLを取得
    const url = process.env.JSON_SERVER_URL;
    // ??????Get?
    const response = await $axios.$get(url);
    // ??????????JSON?????
    return {
      meteorological_raw: response,
    };
  },
  computed: {
    getTemperature() {
      return this.meteorological_raw[0].temperature / 100;
    },
    get1hRain() {
      return (
        (this.meteorological_raw[0].rain - this.meteorological_raw.pop().rain) *
        25.4
      );
    },
    getHumidity() {
      return (
        Math.round((this.meteorological_raw[0].humidity / 1024) * 100) / 100
      );
    },
    getHectopascal() {
      return Math.round(this.meteorological_raw[0].pressure / 25600);
    },
    getWindSpeed() {
      return (
        Math.floor((this.meteorological_raw[0].windSpeed / 2.237) * 10) / 10
      );
    },
    getWindDirection() {
      return this.meteorological_raw[0].windDirection;
    },
    getMarqueeText() {
      const DI = Math.round(
        (0.81 * this.getTemperature + 0.01 * this.getHumidity * (0.99 * this.getTemperature - 14.3) + 46.3) * 10) / 10

      if (DI < 55)
        return `寒いので。厚着をしていきましょう。`
      if (DI >= 55 && DI < 60)
        return `肌寒いので調整できる服装をしていきましょう。`
      if (DI >= 60 && DI < 65)
        return `ちょうど良い気温です。`
      if (DI >= 65 && DI < 70)
        return `暑くはないですが、温度変化などに気をつけましょう。`
      if (DI >= 75 && DI < 80)
        return `やや暑いです調整できる服装をしていきましょう。`
      if (DI >= 80 && DI < 85)
        return `暑いです。水分補給を忘れないようにしましょう。`
      if (DI >= 85)
        return `非常に暑いので傘や日傘などで日をガードしましょう。`
    }
  },
  methods: {
    tabChange(tabNumber) {
      this.isActive = tabNumber;

      // グラフを更新
      this.resetFlag = true;
      this.$nextTick(() => {
        this.resetFlag = false;
      });
    },
    getHourData() {
      return this.meteorological_raw
        .filter(
          (x, y) => y % Math.round(this.meteorological_raw.length / 30) === 0
        )
        .reverse();
    },
    getMinuteData(minutes) {
      const last = moment(this.meteorological_raw[0].updatedAt).subtract(
        minutes,
        "minutes"
      );

      return this.meteorological_raw
        .filter((x, y) => moment(x.updatedAt).isAfter(last))
        .filter((x, y, z) => {
          if (z.length >= 30) {
            // もし要素数が 30 以上なら要素数を減らす
            return y % Math.round(z.length / 30) == 0;
          }

          return true;
        })
        .reverse();
    },
  },
  components: {
    MarqueeText,
  },
};
</script>
