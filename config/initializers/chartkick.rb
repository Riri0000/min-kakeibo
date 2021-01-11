Chartkick.options = {
  donut: true,
  width: '400px',

  colors: [ "#eb8b74",
            "#f3bdb0",
            "#FABC96",
            "#FAD19E",
            "#FAE0A7",
            "#FAEFBE",
            "#F6E7BE",
            "#F7EAC6",
            "#F8EDCE",
            "#F9F0D6",
            "#FAF3DE",
            "#FBF6E6",
            "#FCF9EE",
            "#FDFCF6",
            "#FBFADF",
            "#FBFADF",
            "#FBFADF",
            "#FBFADF",
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
            fontWeight: 300,
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
