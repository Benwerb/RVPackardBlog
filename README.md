# Packard Cruise Tracker

A real-time tracking visualization for the RV Packard research vessel operated by MBARI (Monterey Bay Aquarium Research Institute).

## Features

- **Real-time Data**: Fetches live tracking data from MBARI's data server
- **Interactive Map**: Beautiful map visualization using Leaflet.js with ocean basemap
- **Last 3 Hours**: Displays the most recent 36 data points (assuming 5-minute intervals)
- **Boat Icon**: Current position marked with a distinctive boat emoji
- **PST Timezone**: Converts Unix timestamps to Pacific Standard Time
- **Auto-refresh**: Updates every 5 minutes automatically
- **Responsive Design**: Works on desktop and mobile devices

## Data Source

The application fetches data from: `https://www3.mbari.org/lobo/Data/GliderVizData/rvpackard.txt`

Data format:
```
latitude,longitude,unixtime
36.80229635,-121.786693033333,1749599715
```

## Live Site

Visit the live tracking site: [Packard Cruise Tracker](https://benwerb.github.io/RVPackardBlog/)

## Technical Details

- **Frontend**: HTML5, CSS3, JavaScript (ES6+)
- **Mapping**: Leaflet.js with OpenStreetMap and Esri Ocean Basemap
- **Styling**: Modern CSS with gradients and glassmorphism effects
- **Data Processing**: Client-side CSV parsing and Unix timestamp conversion
- **Deployment**: GitHub Pages

## Setup for GitHub Pages

1. Push this repository to GitHub
2. Go to repository Settings > Pages
3. Select "Deploy from a branch" and choose "main"
4. The site will be available at `https://benwerb.github.io/RVPackardBlog/`

## Browser Compatibility

- Chrome/Edge: Full support
- Firefox: Full support  
- Safari: Full support
- Mobile browsers: Responsive design supported

## Data Update Frequency

The application automatically refreshes every 5 minutes to fetch the latest tracking data. The data source appears to update approximately every 5 minutes based on the vessel's reporting schedule.
