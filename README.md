# MATLAB-template-for-designing-systems

# MATLAB Project Template for System Design activities
This is a MATLAB project (formerly Simulink Project) that is mainly focussed around System Design activities.

# Table of Contents
* [Text to display](the URL)
* [Text to display](the URL)
* [Text to display](the URL)
* [Text to display](the URL)
* [Text to display](the URL)
* [Text to display](the URL)
* [Text to display](the URL)

# Introduction
## What is a MATLAB (nee Simulink) Project?
In its simplest form a MATLAB Project is simply a tool that can be used as a file organisation system when performing development work. In practice it is so much more than that!

First of all, it enforces a strict boundary. What does this mean? Well for things to work when using a MATLAB Project, all the files necessary must be in the project (there is an exception to this such as when using Reference Projects or the SVN Externals feature, whilst these files are not under the direct control of your project, it means that when the project is used by others, they will benefit from the same set up) as a result everything that a developer needs will be all contained in the project - no more "file missing" errors!

![Image of a Simulink Project](https://github.com/ArmstrongResearchCentre/MATLAB-Project-Template-System-Design/blob/master/Resources/readme_image1.jpg)

Next, it supports standardisation. By using a standard development environment, it can be customised with features to ensure that developers work in a standardised way. This could be as simply as including utilities to perform repretitive actions, such as creating a new model with test harness. Or more usefully including startup and shutdown scripts that apply and remove and customisations needed to get your environment working. Some examples could including loading data into the base workspace so that you can start running your models straight away. Because these scripts are part of the project it will mean that everyone working on the task benefits from these scripts.

![Image of shortcuts within a Simulink Project](https://github.com/ArmstrongResearchCentre/MATLAB-Project-Template-System-Design/blob/master/Resources/readme_image2.jpg)

Thirdly, using Projects enables modularity straight out of the box. Simply put a project can be anything. Let's say a project for a high performance model of a pump. You can then have a separate project that is the controller for that pump. They can be completely separate and under their own configuration controls, but you use project referencing so that the "controller project" imports everything it needs from the "plant project".

![Image of a Project Referencing with Simulink Projects](https://github.com/ArmstrongResearchCentre/MATLAB-Project-Template-System-Design/blob/master/Resources/readme_image3.jpg)

Finally it supports teamwork and version control. This is a two-for-one feature because Simulink Projects comes built it with a repository building feature. This will allow you to create a Subversion (SVN) based repository on a network drive. Why on earth would you want to do that? Well I can promise you that it is the single-biggest feature of Simulink Projects there is. Having an "archive" of every single version of a script or model is priceless. It means that as you are making changes, you can go back and make comparisons to what you have done previously. This is especially powerful when you are making lots of changes to fix a bug because you can keep doing that comparison "OK I changed this to that and no difference, let's try something else …" 

![Image of a Distributed Version Control](https://github.com/ArmstrongResearchCentre/MATLAB-Project-Template-System-Design/blob/master/Resources/readme_image4.jpg)

Now the second part of this perk is that by having a centralised point with all your files in it is that it means you can collaborate with others! So now your team can work together and split up the job and through the use of File Locks you can "check out" files so that you've got the edit permission. Then once you are done with your work you can commit your changed file to the repository so that everyone else can now access the revised file. 

# Understanding the file / folder structure
This MATLAB project has been tuned over several projects and many years, but very much suits a particular development style (one aimed at modularising code, sharing and re-use). So it should be a good foundation for most development activities. Here is the basic folder structure:

1. AutomaticReportGenerators - this contains utilities related to using automatic report generation features within MATLAB
2. AuxiliaryFunctions - this folder contains utilities related to helping you get the job done, e.g. creating a new model, custom model advisor checks, startup and shutdown scripts etc.
3. Resources - this folder contains some config files, as well as the "Project Requirements Specification" and the "Derived Project Requirements Specification", a project Data Dictionary.
4. Models (will be created when the first model is created).
5. CompiledCode (will be created when the project is launched).
6. RunTimeFiles (will be created when the Simulink models are first assembled).

# Understand the utility files
The following section provides some documentation on the use of the utility functions that are pre-packaged with this project under the AuxiliaryFunctions folder.

## Automatic Population of Test Manager (AutoPopulateTestManager)
This function will iterate over all files in the Project and look for files marked as 'Test'. These correlate to test harnesses. The identified Test Harnesses will then be added to the Test Manager in order to be available for execution.

This utility can be triggered in one of two ways.

Firstly, if you navigate to the Project Shortcuts tab on the toolbar, the "autoPopulateTestManager" shortcut will be present  in the One-Time Use section.

![Auto-Populate Test Manager shorcut on the toolbar](https://github.com/ArmstrongResearchCentre/MATLAB-Project-Template-System-Design/blob/master/Resources/readme_image3.jpg)

Alternatively, expanding the AuxiliaryFunctions folder, then AutoPopulateTestManager folder will reveal the autoPopulateTestManager script. Simply right-click and choose "Run" from the context menu.

![Auto-Populate Test Manager script in the Project](https://github.com/ArmstrongResearchCentre/MATLAB-Project-Template-System-Design/blob/master/Resources/readme_image3.jpg)

## Check for reminders in Code (CheckForRemindersInCode)
The purpose of this utility is to check if there are reminders such as "TODO" and "FIXME" that have been left in code files as prompts for future development work. Typically reminders like these would not be allowed in production code.

This utility can be triggered by expanding the AuxiliaryFunctions folder, then CheckForRemindersInCode folder will reveal the CheckForRemindersInCode script. Simply right-click and choose "Run" from the context menu.

![Check For Reminders in Code script in the Project](https://github.com/ArmstrongResearchCentre/MATLAB-Project-Template-System-Design/blob/master/Resources/readme_image3.jpg)

## Compiler Setup (CompilerSetup)
The purpose of this script is to assist with the configuration of the local computer of a developer to ensure that a compiler is available to support code generation and simulation.

This utility can be triggered in one of two ways.

Firstly, if you navigate to the Project Shortcuts tab on the toolbar, the "CompilerSetup" shortcut will be present  in the One-Time Use section.

![Compiler Setup shorcut on the toolbar](https://github.com/ArmstrongResearchCentre/MATLAB-Project-Template-System-Design/blob/master/Resources/readme_image3.jpg)

Alternatively, expanding the AuxiliaryFunctions folder, then CompilerSetup folder will reveal the CompilerSetup script. Simply right-click and choose "Run" from the context menu.

![Compiler Setup script in the Project](https://github.com/ArmstrongResearchCentre/MATLAB-Project-Template-System-Design/blob/master/Resources/readme_image3.jpg)

## Create A New Custom Model Advisor Check (createCustomModelAdvisorCheck)
The purpose of this script is to semi-automate the process for creating a new customised Model Advisor Check because the intial construction of files and functions is very repetitive. This will create a Check Definition file, a Check file and an Action file as well as appending the sl_customization.m file to include the new check.

This utility can be triggered in one of two ways.

Firstly, if you navigate to the Project Shortcuts tab on the toolbar, the "createCustomModelAdvisorCheck" shortcut will be present  in the Utilities section.

![Create Custom Model Advisor Check shorcut on the toolbar](https://github.com/ArmstrongResearchCentre/MATLAB-Project-Template-System-Design/blob/master/Resources/readme_image3.jpg)

Alternatively, expanding the AuxiliaryFunctions folder, then createCustomModelAdvisorCheck folder will reveal the createCustomModelAdvisorCheck script. Simply right-click and choose "Run" from the context menu.

![Compiler Setup script in the Project](https://github.com/ArmstrongResearchCentre/MATLAB-Project-Template-System-Design/blob/master/Resources/readme_image3.jpg)

You will then be given a prompt for a name for this check e.g. Check Requirements Exist. Type the name with spaces like this, this will ensure that the script can create a name that aligns to the naming convention.

![Defining the new check name](https://github.com/ArmstrongResearchCentre/MATLAB-Project-Template-System-Design/blob/master/Resources/readme_image3.jpg)

This will then create three new files in the sl_customization folder with according to a naming convention utilising the provided name, as well as updating the sl_customization.m file to include the new check.

![New files in sl_customization folder and an updated sl_customization.m file](https://github.com/ArmstrongResearchCentre/MATLAB-Project-Template-System-Design/blob/master/Resources/readme_image3.jpg)

From here you will need to add additional code to the template files in order to define the check and the corrective action. First of all the checkDefinition_<name> file is relatively simple - it defines some lable properties i.e. the title of the check and how it appears in the Model Advisor window. But also defines pointers to the functions that contain the code to define the check, as well the code to the function to implement the "fix" (where possible). These are the check_<name> and action_<name> files appropriately.
  
The check function is broken into two halves:
1. The code to get the information to determine the check pass/fail result
2. The code to set the check to a pass or a fail based on #1

![Check code](https://github.com/ArmstrongResearchCentre/MATLAB-Project-Template-System-Design/blob/master/Resources/readme_image5.JPG)

The action function is the code that will execute when commanded that will make changes in order to make the model pass the check as defined in the check_<name> script.
  
There are two basic parts to this script as well.

1. The fix code
2. Reporting the results

![Action code](https://github.com/ArmstrongResearchCentre/MATLAB-Project-Template-System-Design/blob/master/Resources/readme_image5.JPG)

## Create New Model (CreateNewModel)
The basic functionality of this script is to create a new folder in the SubSystemModels folder with a particular name (provided by the developer) then populate that folder with the following files:
The “model” under design - despite the name “model” this is not limited to just a Simulink model, it could be a MATLAB script and or function.
A “model” test harness - a test harness to exercise the “model under design”
A “model” requirements module
A “model” derived requirements module - the requirements modules are used to capture, manage and trace requirements to their implementation in either a Simulink model or MATLAB script. The derived requirements module holds requirements that you create during the development process, whereas the requirements module contains the requirements that were provided at the start of the development process. Then a requirements management update process will need to be undertaken to review all of the derived requirements and consider incorporating them into the primary requirements module.

Current best practice for naming conventions is to use camel case.

To use the CreateNewModel function, it is located on the Project shortcuts bar in the Utilities sectionat the top of the MATLAB window

![Image of a CreateNewModel GUI](https://github.com/ArmstrongResearchCentre/MATLAB-Project-Template-System-Design/blob/master/Resources/readme_image5.JPG)

Or you can simply type CreateNewModel in the Command Window.

You will be greeted with a basic GUI designed to acquire the follow basic information:

1. Do you want to create a MATLAB Script, or a Simulink Model?
2. What name do you want to give the script / model?

Choosing the MATLAB script option will create:
* a function of name that you define
* a MATLAB unit test script to execute the function

CHoosing the Simulink model option will create:
* A Simulink model with the name you define
* A collection of test harnesses (a functional test harness, an equivalence test harness etc)

For both options in addition to the files defined above, a requirements module will also be created.

![New folder with populated files](https://github.com/ArmstrongResearchCentre/MATLAB-Project-Template-System-Design/blob/master/Resources/readme_image5.JPG)

## Generate Requirements Report (generateReqtsReport)
This function will generate one of two reports. 

1. A basic "Requirements Specification" by exporting the requirements in the ProjectRequirements.slreqx requirements module
2. A requirements report showing requirements, their implementation status and their verification status.

INPUTS
  INPUT 1: reqtsModule
    Dimensions and type: 1x1 string
    Description: This is path to the requirements module to generate a specification report for

OUTPUTS
  OUTPUT 1: myReport
    Dimensions and type: 1x1 report object
    Description: This is an object containing the report
    
 This utility can be triggered in one of two ways:
 
 Firstly, by selecting the Shortcuts tab from the toolbar, then clicking the generateReqtsReport in the Reports section
 
 ![Generate Requirements Report shortcut on the toolbar](https://github.com/ArmstrongResearchCentre/MATLAB-Project-Template-System-Design/blob/master/Resources/readme_image5.JPG)
 
 Or by expanding the AuxiliaryFunctions folder in the File Explorer, then the generateReqtsReport folder. Then right-click on the generateReqtsReport.m file and choose "Run" from the context menu.
 
 Inside this folder is the requirementsReportTemplate.dotx file. This file can be customised if you have a company document template

## Modelling Standard - Use of the Disp command within code (ModellingStandard_UseOfDisp)
This script is an example of a coding standard. The coding standard attempted to be implemented is to check that the use of disp (typically for debug reasons) is not present in production code.

## Model Review (ModelReview)
The purpose of this utility function is to poll the status of all models in the project for their review state. If the review state (for either a Peer Review, or Programme Review) is set to "To Review" then the user will be given a warning alerting them to this fact.

## Create a new model from template (newModelFromTemplate)
The purpose of this script is to allow the user to create a new model based upon a collection of pre-made Simulink Model Templates.

## Project Management (ProjectManagement)
This folder contains scripts that are ran are project start and shutdown.

## Execute all unit tests (runAllTests)
Test harnesses will be executed that are present within the Test Manager data file.

## Execute Model Advisor checks (runQualityChecks)
Model Advisor is ran over all models in the Project in order to check the modelling meets standards.

## Simulink Customisations (sl_customization)
The folder sl_customization and the script sl_customization.m contain custom model advisor scripts. Model Advisor scripts are used to enable automated testing of a model to meet criteria.
