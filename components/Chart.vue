<script>
import { Line　} from "vue-chartjs";
import LogoVue from './Logo.vue';

export default {
  extends: Line,
  // mixins: [mixins.reactiveProp],
  props: {
       chartdata: {
      type: Object,
      default: null
    },
    options: {
      type: Object,
      default: null
    }
  },
  mounted() {
    this.renderChart(this.chartdata, this.options);
  },

} 
</script>
