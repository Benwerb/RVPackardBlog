function [lat, lon, unixtime] = getPackardLocation()
    % Initialize output variables
    % Grab Parckard lat/lon from ODSS. Pulls in last 5 points. Function only
    % outputs last point. Ben Werb 10/24/24
    lat = NaN;
    lon = NaN;
    unixtime = {};

    try
        % Define the URL
        url = 'https://odss.mbari.org/odss/tracks?platformID=68434e697dc11a156e3ed25e&returnSRS=4326&lastNumberOfFixes=5&returnFormat=html';
        % Read the HTML content from the website
        html = webread(url);
        % Use the htmlTree class to parse the HTML content
        tree = htmlTree(html);
        % Extract the table rows
        rows = findElement(tree, 'tr');
        % Initialize cell arrays to store the extracted data
        dates = {};
        lats = {};
        lons = {};
        % Loop through the rows to extract the date, lat, and lon
        for i = 2:length(rows)  % Start from 2 to skip the header row
            % Extract cells from the row
            cells = findElement(rows(i), 'td');
            % Extract date, lat, and lon
            date = extractHTMLText(cells(1));
            lon = extractHTMLText(cells(2));
            lat = extractHTMLText(cells(3));
            % Store the extracted data in cell arrays
            dates{end+1} = date;
            lats{end+1} = lat;
            lons{end+1} = lon;
        end
        % Assign output values
        dateStr = dates{1};
        % Parse to datetime object
        dt = datetime(dateStr, 'InputFormat', 'yyyy-MM-dd''T''HH:mm:ss.SSS''Z''', 'TimeZone', 'UTC');

        % Convert to Unix time (seconds since Jan 1, 1970)
        unixtime = posixtime(dt);
        lat = str2double(lats{1});
        lon = str2double(lons{1});
    catch
        % If an error occurs, display a message
        disp('Error: Unable to retrieve data from the website.');
    end
end
