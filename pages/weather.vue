<template>
  <div class="mt-4">
    <section class="hero is-fullheight container">
      <div>
        <MarqueeText class="is-size-4"
                     :duration="30"
                     :repeat="2"
        >現在の天気は曇り。現在の気温は{{
            getTemperature !== null ? getTemperature : "--"
          }}°、湿度は{{ getHumidity !== null ? getHumidity : "--" }}%です。{{ getMarqueeText }}　　　　　　　　　　　　　　　　　　
          　　　　　　　　　　　　　　　　　　　　
        </MarqueeText>
      </div>
      <div class="columns is-centered is-desktop">
        <div class="column is-size-2 mt-6">
          <WindDirection :windDirection="getWindDirection" :windSpeed="getWindSpeed"/>
          <div class="column has-text-centered">{{ getWindSpeed !== null ? getWindSpeed : "--" }} m/s</div>
        </div>
        <div class="column is-size-2 has-text-centered">
          <div class="column">{{ getTemperature !== null ? getTemperature : "--" }} ℃</div>
          <div class="column">{{ getHumidity !== null ? getHumidity : "--" }} %</div>
          <div class="column">{{ getHectopascal !== null ? getHectopascal : "--" }} hPa</div>
        </div>
        <div class="column is-size-2 mt-6">
          <figure class="image container is-128x128">
            <img src="~/assets/cloudy.svg" height="182" width="182"/>
          </figure>
          <div class="column has-text-centered">{{ get1hRain ? get1hRain : "--" }} mm/1h</div>
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
            <TemperatureChart v-if="isActive === '3600'" :chartdata="getHourData()"/>
            <TemperatureChart v-if="isActive === '600'" :chartdata="getMinuteData(10)"/>
            <TemperatureChart v-if="isActive === '60'" :chartdata="getMinuteData(1)"/>
          </div>
          <div class="column">
            <HumidityChart v-if="isActive === '3600'" :chartdata="getHourData()"/>
            <HumidityChart v-if="isActive === '600'" :chartdata="getMinuteData(10)"/>
            <HumidityChart v-if="isActive === '60'" :chartdata="getMinuteData(1)"/>
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

const defaultData = [
  {
    "id": 0,
    "soilTemperature": null,
    "soilMoisture": null,
    "windSpeed": null,
    "windDirection": "",
    "temperature": null,
    "pressure": null,
    "humidity": null,
    "altitude": null,
    "rain": null,
    "createdAt": "2020-09-12T00:00:00.000Z",
    "updatedAt": "2020-09-12T10:20:34.000Z"
  },
  {
    "id": 1,
    "soilTemperature": null,
    "soilMoisture": null,
    "windSpeed": null,
    "windDirection": "",
    "temperature": null,
    "pressure": null,
    "humidity": null,
    "altitude": null,
    "rain": null,
    "createdAt": "2020-09-12T00:00:00.000Z",
    "updatedAt": "2020-09-12T10:20:34.000Z"
  }
]

export default {
  data() {
    return {
      isActive: "3600",
      meteorological_raw: defaultData,
      resetFlag: false,
    };
  },
  created: function () {
    setInterval(async () => {
      const url = process.env.JSON_SERVER_URL;
      try {
        const response = await axios.get(url);

        this.meteorological_raw = response.data;
      } catch (e) {
        this.meteorological_raw = defaultData;
      }

      this.resetFlag = true;
      this.$nextTick(() => {
        this.resetFlag = false;
      });
    }, 5000);
  },
  async asyncData({$axios}) {
    // 環境変数からURLを取得
    const url = process.env.JSON_SERVER_URL;
    try {
      const response = await $axios.$get(url);
      return {
        meteorological_raw: response,
      };
    } catch (e) {
      return {
        meteorological_raw: defaultData
      }
    }
  },
  computed: {
    getTemperature() {
      const temperature = this.meteorological_raw[0]?.temperature;

      if (temperature)
        return temperature / 100;

      return null;
    },
    get1hRain() {
      const leastRain = this.meteorological_raw[0]?.rain
      const oneHourAgoRain = this.meteorological_raw[0] ? this.meteorological_raw.pop().rain : null

      if (leastRain && oneHourAgoRain)
        return (leastRain - oneHourAgoRain) * 25.4

      return null;
    },
    getHumidity() {
      const humidity = this.meteorological_raw[0]?.humidity;

      if (humidity)
        return Math.round((humidity / 1024) * 100) / 100;

      return null;
    },
    getHectopascal() {
      const pressure = this.meteorological_raw[0]?.pressure;

      if (pressure)
        return Math.round(pressure / 25600);

      return null;
    },
    getWindSpeed() {
      const windSpeed = this.meteorological_raw[0]?.windSpeed;

      if (windSpeed)
        return Math.floor((windSpeed / 2.237) * 10) / 10;

      return null;
    },
    getWindDirection() {
      return this.meteorological_raw[0]?.windDirection;
    },
    getMarqueeText() {
      const temperature = this.getTemperature;
      const humidity = this.getHumidity ?? null;

      if (!temperature || !humidity) {
        return "現在、値がうまく取得できていません。"
      }

      const DI = Math.round(
        (0.81 * temperature + 0.01 * humidity * (0.99 * temperature - 14.3) + 46.3) * 10) / 10

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
      return this.meteorological_raw ? this.meteorological_raw
        .filter(
          (x, y) => y % Math.round(this.meteorological_raw.length / 30) === 0
        )
        .reverse() : null;
    },
    getMinuteData(minutes) {
      const last = this.meteorological_raw[0] ? moment(this.meteorological_raw[0].updatedAt).subtract(
        minutes,
        "minutes"
      ) : null;

      return this.meteorological_raw[0] ? this.meteorological_raw
        .filter((x, y) => moment(x.updatedAt).isAfter(last))
        .filter((x, y, z) => {
          if (z.length >= 30) {
            // もし要素数が 30 以上なら要素数を減らす
            return y % Math.round(z.length / 30) == 0;
          }

          return true;
        })
        .reverse() : null;
    },
  },
  components: {
    MarqueeText,
  },
};
</script>
