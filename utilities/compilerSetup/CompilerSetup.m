%% COMPILERSETUP Setup a compiler
%   The purpose of this script is to assist with the configuration of the
%   local computer of a developer to ensure that a compiler is available to
%   support code generation and simulation.
%% FUNCTION INPUTS
%       None
%% FUNCTION OUTPUTS
%       None
%% OTHER OUTPUTS
%       None
%% LINKS
%       For further information check out: <a href="matlab:web('https://github.com/cavediverchris/MATLAB-Project-Template-System-Design#compiler-setup-compilersetup')">Git documentation</a>.
%% MAIN FUNCTION

try
    mex -setup
catch ME
    
    if strcmp(ME.identifier, 'MATLAB:mex:NoCompilerFound_link_Win64')
        % CASE: The error reported from the mex command is that there is no
        % supported compiler installed
        % ACTION: Load the page to download and install the MinGW C/C++
        % compiler
        
        % Direct to the MATLAB Central page to get MinGW
        web('https://uk.mathworks.com/matlabcentral/fileexchange/52848-matlab-support-for-mingw-w64-c-c-compiler', '-browser')
    else
        disp('unknown error')
        rethrow(ME)
    end
end

% Clean up unneeded variables
clear ME;
%% Remove from startup
% Once the compiler has been configured. It can be removed from the start
% up shortcuts list.

slObj = simulinkproject;

numFiles = length(slObj.StartupFiles);

for iFile = 1:1:numFiles
    currentFile = slObj.StartupFiles(iFile);
    
    if contains(currentFile.File, 'CompilerSetup')
        % This is the index to the shortcut
        removeStartupFile(slObj, currentFile.File);
    end
end

% Clean up unneeded variables
clear slObj numFiles currentFile iFile;