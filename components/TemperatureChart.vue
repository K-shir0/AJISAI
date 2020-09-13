<template>
  <LineChart :chartdata="getDatas" :options="options" :height="182" />
</template>

<script>
import LineChart from "@/components/Chart.vue";
export default {
  props: ["chartdata"],
  data() {
    return {
      options: {
        scales: {
          xAxes: [
            {
              scaleLabel: {
                display: true,
              },
              ticks: {
                display: false,
              },
            },
          ],
          yAxes: [
            {
              ticks: {
                // beginAtZero: true,
                // stepSize: 10,
                // max: 50,
                // min: 30,
              },
            },
          ],
        },
        animation: {
          duration: 0
        },
        hover: {
          animationDuration: 0, // アイテムのマウスオーバー時のアニメーションの長さ
        },
        responsiveAnimationDuration: 0, // サイズ変更後のアニメーションの長さ
      },
    };
  },
  computed: {
    getOptions: function () {
      return {
        scales: {
          xAxes: [
            {
              scaleLabel: {
                display: true,
              },
              ticks: {
                display: false,
              },
            },
          ],
          yAxes: [
            {
              ticks: {
                // beginAtZero: true,
                // stepSize: 10,
                // max: 50,
                // min: 30,
              },
            },
          ],
        },
      };
    },
    getDatas: function () {
      const interval = Math.round(this.chartdata.length / 30);

      // console.log(interval);

      return {
        labels: this.chartdata.map((data) => data.updatedAt),
        datasets: [
          {
            label: ["1時間の気温"],
            backgroundColor: "#f87979",
            data: this.chartdata.map((data) => data.temperature / 100),
            fill: false,
            lineTension: 0.3,
          },
        ],
      };
    },
  },
  components: {
    LineChart,
  },
};
</script>