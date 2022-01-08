%% LAUNCH SIMULINK REQUIREMENTS Open the editor to view Simulink Requirements
%   There is not a convenient link to being able to see Simulink
%   Requirements. This function will launch the requirements editor on
%   startup.
%% FUNCTION INPUTS
%       None
%% FUNCTION OUTPUTS
%       None
%% OTHER OUTPUTS
%       None
%% LINKS
%       For further information check out: <a href="matlab:web('https://github.com/cavediverchris/MATLAB-Project-Template-System-Design#understand-the-utility-files')">Git documentation</a>.
%% MAIN FUNCTION
%% Launch Simulink Requirements Editor

% Need to check if Simulink Requirements licence even exists
% TODO - Need the product name
% status = license('test','slrequirements');

% Alternatively catch the error message (if one)
try
    slreq.open('ProjectRequirements');
catch ME
    if strcmp(ME.identifier, 'Slvnv:slreq:FailedToOpen')
        disp('Simulink Requirements not installed.')
    end
end