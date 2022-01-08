classdef test_template < matlab.unittest.TestCase
    %TEST_TEMPLATE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        
    end
    
    methods (Test)
        function genericTest(testCase)
            %% Test Description
            % The purpose of this test is to create a generic test so that
            % when a push to Git is made, the Runner will have a test to
            % exercise. This template will execute nothing.
            %% Test Setup
            
            %% Test Execution
            
            
            %% Test Verification
            testCase.verifyEqual(true, true);
            %% Test Teardown
            
        end

    end
end

