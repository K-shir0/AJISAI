<template>
  <figure class="image container is-128x128">
    <img :src="imgSrc" height="182" width="182" />
  </figure>
</template>

<script>
export default {
  props: ["windDirection", "windSpeed"],
  data() {
    return {
      imgSrc: require(`@/assets/Icon/${this.windDirection ?? "N"}5.svg`),
    };
  },
  mounted() {
    let windSpeedIcon = "0";

    switch (Math.floor(this.windSpeed / 5)) {
      case 0:
        windSpeedIcon = "5";
        break;
      case 1:
        windSpeedIcon = "10";
        break;
      case 2:
        windSpeedIcon = "15";
        break;
      case 3:
        windSpeedIcon = "20";
        break;
      case 4:
        windSpeedIcon = "25";
        break;
      default:
        windSpeedIcon = "5";
        break;
    }

    this.imgSrc = require(`@/assets/Icon/${this.windDirection ?? "N"}${windSpeedIcon}.svg`);
  },
  watch: {
    windDirection: function () {
      let windSpeedIcon = "0";

      switch (Math.floor(this.windSpeed / 5)) {
        case 0:
          windSpeedIcon = "5";
          break;
        case 1:
          windSpeedIcon = "10";
          break;
        case 2:
          windSpeedIcon = "15";
          break;
        case 3:
          windSpeedIcon = "20";
          break;
        case 4:
          windSpeedIcon = "25";
          break;
        default:
          windSpeedIcon = "25+";
          break;
      }

      this.imgSrc = require(`@/assets/Icon/${this.windDirection}${windSpeedIcon}.svg`);
    },
    windSpeed: function () {
      let windSpeedIcon = "0";

      switch (Math.floor(this.windSpeed / 5)) {
        case 0:
          windSpeedIcon = "5";
          break;
        case 1:
          windSpeedIcon = "10";
          break;
        case 2:
          windSpeedIcon = "15";
          break;
        case 3:
          windSpeedIcon = "20";
          break;
        case 4:
          windSpeedIcon = "25";
          break;
        default:
          windSpeedIcon = "25+";
          break;
      }

      this.imgSrc = require(`@/assets/Icon/${this.windDirection}${windSpeedIcon}.svg`);
    },
  },
};
</script>
