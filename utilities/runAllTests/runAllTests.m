% RUNALLTESTS Executes all of the unit tests defined within the Project
%   Test harnesses will be executed that are present within the Test
%   Manager data file.
%
%   FUNCTION INPUTS
%       None
%
%   FUNCTION OUTPUTS
%       None
%
%   OTHER OUTPUTS
%       None
%
%   LINKS
%   For further information check out: <a href="matlab:web('https://github.com/cavediverchris/MATLAB-Project-Template-System-Design#understand-the-utility-files')">Git documentation</a>.
%
function runAllTests()


%projObj = currentProject;

% TODO - Find the test case file
tc = 'TestFile.mldatx';
tfObj = sltest.testmanager.load(tc);
resultsObj = run(tfObj);

% Generate a report from the results data
filePath = 'test_report.pdf';
sltest.testmanager.report(resultsObj,filePath,...
          'Author','Test Engineer',...
          'IncludeSimulationSignalPlots',true,...
          'IncludeComparisonSignalPlots',true);
end

