repoPath = fileparts(mfilename('fullpath'));  
addpath(genpath(repoPath));

[lat, lon, unixtime] = getPackardLocation();

databaseName = 'glidata';
username = 'glidata_user';
password = 'IoFUTBeaQDppSYcmBebA4rV8SJOEMCFI';
server = 'dpg-d2jobg3e5dus738ce5vg-a.oregon-postgres.render.com';
port = '5432';
tableName = 'rvpackardcruise';

% Create the database connection
conn = database(databaseName, username, password, 'org.postgresql.Driver', jdbcUrl);

newRow = table(lat,lon,unixtime,VariableNames={'latitude','longitude','unixtime'});
sqlwrite(conn, tableName, newRow);
sprintf('wrote new row to RVPackardCruise: %d, %d, %d', lat,lon,unixtime)

T = sqlread(conn,tableName);
fname = fullfile("\\sirocco\wwwroot\lobo\Data\GliderVizData","rvpackard.txt");
writetable(T,fname);