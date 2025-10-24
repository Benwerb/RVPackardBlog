# Packard Cruise Tracker - GitHub Pages Setup

## Quick Setup Instructions

1. **Push to GitHub**: Upload this repository to GitHub
2. **Enable Pages**: Go to Settings > Pages in your GitHub repository
3. **Select Source**: Choose "GitHub Actions" as the source
4. **Deploy**: The workflow will automatically deploy when you push to main

## Repository Structure

```
RVPackardBlog/
├── index.html              # Main application
├── README.md               # Documentation
├── .github/workflows/      # GitHub Actions
│   └── pages.yml          # Deployment workflow
├── data/                   # Sample data
│   └── rvpackard.txt      # Reference data file
└── [existing MATLAB files] # Your existing project files
```

## Features Implemented

✅ **Title**: "Packard Cruise Tracker"  
✅ **Data Source**: Fetches from https://www3.mbari.org/lobo/Data/GliderVizData/rvpackard.txt  
✅ **Last 36 Points**: Displays most recent 3 hours of data  
✅ **PST Conversion**: Unix timestamps converted to Pacific Standard Time  
✅ **Interactive Map**: Beautiful map with ocean basemap  
✅ **Boat Icon**: Current position marked with boat emoji 🚢  
✅ **Auto-refresh**: Updates every 5 minutes  
✅ **Responsive Design**: Works on all devices  

## Customization Options

- **Refresh Interval**: Change the `setInterval` value in `index.html`
- **Data Points**: Modify the slice value to show more/fewer points
- **Map Style**: Switch between different tile layers
- **Colors**: Update CSS variables for different themes
- **Center Location**: Adjust map center coordinates

## Troubleshooting

If the site shows "Error loading data":
1. Check if the data URL is accessible
2. Verify CORS headers allow browser requests
3. Check browser console for specific error messages

The application handles the CSV format:
```
latitude,longitude,unixtime
36.80229635,-121.786693033333,1749599715
```
