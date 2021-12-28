%% PROJECT SET UP Set up development environment
% This script sets up the environment for the current Simulink Project.
% This script needs to be added to the Shortcuts to Run at Start to ensure
% all the initialisation is conducted at project start.
%% FUNCTION INPUTS
%       None
%% FUNCTION OUTPUTS
%       None
%% OTHER OUTPUTS
%       None
%% LINKS
%   For further information check out: <a href="matlab:web('https://github.com/cavediverchris/MATLAB-Project-Template-System-Design#understand-the-utility-files')">Git documentation</a>.
%% MAIN FUNCTION
%% Clear the workspace and command window
% The workspace is cleared of all current variables and all windows are
% closed.
clc
clear vars
close all

%% Acquire Project Information
% Set up the Project object.

projObj = currentProject;

%% Set Project Paths
% Project paths for code generation and run-time files are stored in
% different places depending upon the release being used.

% Print message to screen.
disp("Initialising Project : " + projObj.Name)

if ~verLessThan('matlab','R2019B')
    % CASE: Within the project for MATLAB R2019B onward it is possible to 
    % define cache and code gen folders. 
    % ACTION: Check if these have been defined
    
    %projObj = currentProject;
    
    % Check code gen folder
    if strcmp(projObj.SimulinkCodeGenFolder, "")
        % CASE: The code gen folder has not been set
        % ACTION: Set it
        
        if ~exist('CompiledCode', 'dir') == 7
            % CASE: the compiledcode folder does not exist
            % ACTION: Make it
            mkdir('CompiledCode')
        end
        
        projObj.SimulinkCodeGenFolder = projObj.RootFolder + "\CompiledCode\";
    end
        
    % Check cache folder
    if strcmp(projObj.SimulinkCacheFolder, "")
        % CASE: The code gen folder has not been set
        % ACTION: Set it
        
        if ~exist('SimulationRunTimeFiles', 'dir') == 7
            % CASE: the compiledcode folder does not exist
            % ACTION: Make it
            mkdir('SimulationRunTimeFiles')
        end
        
        projObj.SimulinkCacheFolder = projObj.RootFolder + "\SimulationRunTimeFiles\";
    end
elseif verLessThan('matlab','R2020A')
    % CASE: Within the project for MATLAB R2019B onward it is possible to 
    % define cache and code gen folders. However R2020A uses a different
    % project API
    % ACTION: Check if these have been defined
    
    % Check for Simulink Cache Folder
    if strcmp(projObj.Information.SimulinkCacheFolder, projObj.RootFolder)
        % CASE: The Simulink Cache folder is the same as the root, this
        % means that the project does not define the Simulink Cache Folder
        % ACTION: specify the Simulink Cache folder
        
        % Create the location of slprj to be the "work" folder of the current project:
        myCacheFolder = fullfile(projObj.RootFolder, 'SimulationRunTimeFiles');
        if ~exist(myCacheFolder, 'dir')
            mkdir(myCacheFolder)
        end
        
        Simulink.fileGenControl('set', 'CacheFolder', myCacheFolder);
    end
    
    % Check for Simulink Code Generation Folder
    if strcmp(projObj.Information.SimulinkCodeGenFolder, projObj.RootFolder)
        % CASE: The Simulink Code Gen folder is the same as the root, this
        % means that the project does not define the Simulink Cache Folder
        % ACTION: specify the Simulink Code Gen folder
        
        % Create the location of slprj to be the "work" folder of the current project:
        myCodeGenFolder = fullfile(projObj.RootFolder, 'CompiledCode');
        if ~exist(myCodeGenFolder, 'dir')
            mkdir(myCodeGenFolder)
        end
        
        Simulink.fileGenControl('set', 'CodeGenFolder', myCodeGenFolder);
    end
end
%% Refresh SIMULINK Browser
% This is used to make sure that custom libraries are re-loaded from the
% project workspace

sl_refresh_customizations;

%% Refresh Model Advisor Customisations
% This is used to ensure that Model Advisor has the latest customised
% tests.

Advisor.Manager.refresh_customizations();
%% Back Up - Project Folder
% This schedules an aut-export of the Simulink project every day, it simply
% checks whether a folder with the project name / date exists in the export
% location

% Print message to screen.
disp('Back Up Process');

% Set this flag to false to disable archiving
BackUpFlag = true;

% Define the location for export. This is based upon the userpath
exportLocation = userpath +  "\SLProjBackUps\";

% Check that exportLocation is a valid path
if exist(exportLocation, 'dir') == 0
    % CASE: exportLocation does not exist as a path
    % ACTION: create folder at exportLocation
    try
        mkdir(exportLocation);
    catch ME
        % TODO
        if strcmp(ME.identifier, 'MATLAB:MKDIR:OSError')
            disp(["Cannot create folder at path: ", exportLocation]);
        end
    end
end

backupFile = strcat(exportLocation, projObj.Name, '_backup_', date,'.zip');

% Check if the backup file exists for today, if not, create it.
if BackUpFlag == false
    % Print message to screen.
    disp('... Secondary back-up disabled.')
elseif exist(backupFile , 'file') == 0 && (BackUpFlag == true)
    % Print message to screen.
    disp("... No archive file found, exporting project to " + backupFile)
    
    %dbstop if caught error
    export(projObj, backupFile);
    %dbclear all
    
    % Print message to screen.
    disp('... Back up completed.')
elseif exist(backupFile , 'file') == 2
    % Print message to screen.
    disp ('... Archive file found for current project - skipping export')
end

%% Update Template Folder
% In this section the path that contains templates for use by other projects is defined.
myTemplate = Simulink.exportToTemplate(projObj, projObj.Name, ...
                 'Group', 'Simulink', ...
                 'Author', getenv('username'), ...
                 'Description', projObj.Description, ...
                 'Title', projObj.Name, ...
                 'ThumbnailFile', projObj.RootFolder + "\AuxiliaryFunctions\ProjectManagement\TemplateThumbnailImage.png");

% Move the newly created template to the communal templates folder
movefile(myTemplate, userpath, 'f');

%% Clean Up
% clear up the workspace
clear vars