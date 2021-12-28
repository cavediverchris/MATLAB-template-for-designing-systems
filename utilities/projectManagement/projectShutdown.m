%% PROJECT SHUTDOWN Tear down environment
%   The projectShutdown script is designed to run on Project Close to clean
%   up (remove) the local customisations made to the MATLAB Interactive
%   Development Environment (IDE).  
%% FUNCTION INPUTS
%       None
%% FUNCTION OUTPUTS
%       None
%% OTHER OUTPUTS
%       None
%% LINKS
%       For further information check out: <a href="matlab:web('https://github.com/cavediverchris/MATLAB-Project-Template-System-Design#understand-the-utility-files')">Git documentation</a>.
%% MAIN FUNCTION
% Clear up workspace for dialog message
clc;

% Close down project
disp('Closing down project.');

% Close any open data dictionaries
Simulink.data.dictionary.closeAll;
disp('Closed data dictionarys');

% Reset the location where generated code and other temporary files are
% created (slprj) to the default:
Simulink.fileGenControl('reset');
disp('Reverted default paths for code generation');