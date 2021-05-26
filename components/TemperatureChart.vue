<template>
  <LineChart :chartdata="getDates" :options="options" :height="182" />
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
        // responsiveAnimationDuration: 0, // サイズ変更後のアニメーションの長さ
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
    getDates: function () {
      return {
        labels: this.chartdata ? this.chartdata.map((data) => data.updatedAt) : null,
        datasets: [
          {
            label: ["気温"],
            backgroundColor: "#f87979",
            data: this.chartdata ? this.chartdata.map((data) => data.temperature / 100) : null,
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
