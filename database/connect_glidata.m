function conn = connect_glidata(databaseName,username,password,server,port)
    % Step 1: Add the PostgreSQL JDBC driver to MATLAB's Java path
    % Download the PostgreSQL JDBC driver from https://jdbc.postgresql.org/download/
    % For example: postgresql-42.5.0.jar

    % Add the JDBC driver to the Java path
    % Find project root (parent of "database" folder)
    projectRoot = fileparts(mfilename('fullpath'));  
    
    % If this class is not in the root but in src/, adjust:
    projectRoot = fileparts(projectRoot);  
    % Build full path to the JAR in "database"
    jarFile = fullfile(projectRoot,'database','postgresql-42.7.7.jar');
    
    % Only add if not already on classpath
    if ~any(strcmp(javaclasspath('-dynamic'), jarFile))
        javaaddpath(jarFile);
    end
    
    % Create the JDBC connection URL
    jdbcUrl = ['jdbc:postgresql://', server, ':', port, '/', databaseName];
    
    % Create the database connection
    conn = database(databaseName, username, password, 'org.postgresql.Driver', jdbcUrl);
    
    % Step 3: Check if connection was successful
    if ~isopen(conn)
        error('Database Connection Failed: %s', conn.Message);
    else
        disp('Successfully connected to PostgreSQL database');
    end
end

