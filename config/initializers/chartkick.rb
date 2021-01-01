Chartkick.options = {
  donut: true,
  width: '400px',
  colors: [ "#769fcd",
            "#b9d7ea",
            "#d6e6f2",
            "#f7fbfc",
          ],
  message: {empty: "データがありません"},
  thousands: ",",
  suffix: "円",
  legend: false,
  library: {
    title: {
      align: 'center',
      verticalAlign: 'middle',
    },
    chart: {
      backgroundColor: 'none',
      plotBorderWidth: 0,
      plotShadow: false
    },
    plotOptions: {
      pie: {
        dataLabels: {
          enabled: true,
          distance: -40,
          allowOverlap: false,
          style: {
            color: '#555',
            textAlign: 'center',
            textOutline: 0,
          }
        },
        size: '110%',
        innerSize: '60%',
        borderWidth: 0,
      }
    },
  }
}
