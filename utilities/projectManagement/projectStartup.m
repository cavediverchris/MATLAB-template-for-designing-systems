%% Project Set Up
% This script sets up the environment for the current MATLAB Project.
% This script needs to be added to the Shortcuts to Run at Start to ensure
% all the initialisation is conducted at project start.

%% Clear the workspace and command window
% The workspace is cleared of all current variables and all windows are
% closed this done to prevent any collisions with models or scripts that
% operate on data in the base workspace.

clc
clear variables global
close all

%% Set working directories
% In this section we will set the directory of any simulation files and any
% code generation files to be stored in a particular work directory so as
% not to clutter the working folder.
projObj = currentProject;

% Check if the project settings have the work folder set
fields = fieldnames(projObj);

if ~any(contains(fields, "simulinkCacheFolder"))
    % CASE: the project object does not have a definition of cache folder
    % ACTION: TODO
    disp(["Simulink Cache Property does not exist in: " + projObj.Name])
else
    % Create the location of slprj to be the "work" folder of the current project:
    myCacheFolder = fullfile(projObj.RootFolder, 'simulinkCacheFolder');

    if strcmp(myCacheFolder, projObj.SimulinkCacheFolder)
        % CASE: The cache folder is set in the project
        % ACTION: Do nothing?
        % TODO: Check that this is always the case
    else
        % CASE: The project does not have the Simulink Cache Folder set
        % ACTION: Create the folder and set it
        
        if ~exist(myCacheFolder, 'dir')
            % CASE: The cache folder doesn't already exist
            % ACTION: Create it and also add it to the project.
            mkdir(myCacheFolder)
            
        end
        addFile(projObj, myCacheFolder);
        %        addPath(projObj, myCacheFolder); % CAN'T ADD TO PATH DURING PROJECT START UP
        projObj.SimulinkCacheFolder = myCacheFolder;
        
    end
end

% Create the location for any files generated during build for code
% generation.


% Check if the project settings have the work folder set
if ~any(contains(fields, "simulinkCodeGen"))
    % CASE: the project object does not have a definition of cache folder
    % ACTION: TODO
    disp(["Simulink Code Gen Property does not exist in: " + projObj.Name])
else
    % Create the location of slprj to be the "work" folder of the current project:
    myCodeGenFolder = fullfile(projObj.RootFolder, 'simulinkCodeGen');
    
    if strcmp(myCodeGenFolder, projObj.SimulinkCodeGenFolder)
        % CASE: The cache folder is set in the project
        % ACTION: Do nothing?
        % TODO: Check that this is always the case
    else
        % CASE: The project does not have the Simulink Cache Folder set
        % ACTION: Create the folder and set it
        
        if ~exist(myCodeGenFolder, 'dir')
            % CASE: The cache folder doesn't already exist
            % ACTION: Create it and also add it to the project.
            mkdir(myCodeGenFolder)
            
        end
        
        addFile(projObj, myCodeGenFolder);
        %        addPath(projObj, myCodeGenFolder); % CAN'T ADD TO PATH DURING PROJECT START UP
        projObj.SimulinkCodeGenFolder = myCodeGenFolder;
        
    end
end

clear myCacheFolder myCodeGenFolder;

%% Back Up - Project Folder
% Use the Manager for MATLAB Project built-in utility for backing up the
% project.

% Set this flag to false to disable archiving
runBackUp = true;

if runBackUp == true
    % CASE: User wants to backup
    % ACTION : check if the Manager for MATLAB Projects app is installed.
    installedTbxes = matlab.addons.toolbox.installedToolboxes;
end

if isempty(installedTbxes)
    % CASE: The user has absolutely no toolboxes installed
    % ACTION: Return a warning to advise the user to install the app
    warning('projectStartup:ManagerNotInstalled', 'Manager for MATLAB Projects not installed, backups will not run.')
    isManagerInstalled = false;
else
    % CASE: User has installed toolboxes
    % ACTION: Search for the Manager app
    
    installedTbxes = struct2table(installedTbxes);

    isManagerInstalled = contains(installedTbxes.Name, "Manager for MATLAB Projects");
end

% Run Back Up

if isManagerInstalled && runBackUp
    % Print message to screen.
    disp('Running backup');
    [backupDirectory, ~, ~] = fileparts(pwd);
    backup(string(backupDirectory))
end

% Clean up
clear runBackUp installedTbxes isManagerInstalled backupDirectory

%% Clean Up
% clear up the workspace
clear variables global;