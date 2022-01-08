# Documentation
This documentation folder contains key project-level documentation. Typically this will contain files (MATLAB Live Scripts) that describe the project folder structure, the purpose of each folder and the rationale for its use.

## General files at the project root
At the root of the project are a handful of files, these are:

1 - .gitattributes. This file is used to instruct git on how to handle specific file types. This is particularly important when working with binary files so that Git does not try to handle them as text which can result in the file becoming corrupted
2 - .gitignore. This file is used to instruct git to prevent committing particular file types into the repository.
3 - LICENCE. This is the licence file that describes the limitations of usage.
4 - *.prj. This is the MATLAB Project file. Use this as the "link" to launch a MATLAB Project
5 - README.md. This is the project-level markdown file.

## .github
This folder is used to contain artefacts related to managing the source control system.

## Documentation
This folder contains detailed documentation.

## Requirements
This folder is used to store requirements. You may have Excel and Word files that are sources of requirements, the recommended approach is that you then import those requirements into a Simulink Requirements requiremenets module to manage the requirements and traceability.

## Resources
This folder contains artefacts that MATLAB Project updates in order to maintain accurate records of the files being maintained, the main circumstances that you will see new / modified files here are:
1. Adding / Removing files from the project
2. Updating shortcuts
3. Updating file labels

## Results
This folder is used as the destination for artefacts generated as part of the Git Runner.

## Tests
This folder contains all of the unit tests for code within the MATLAB Project.

## Toolbox
This folder is used to contain all of the artefacts that you intend to distribute / deliver. So when creating an app that you will share with your team, you only want to package the files that are required to run the app, not necessarily all the extra "infrastructure" you may create such as the "build into a new toolbox" script, or all of the unit tests to ensure your code is robust. Hence why the toolbox code is in a seperate and dedicated folder.

## Utilities
This folder contains sub-folder which contain dedicated utilities that you may create in order to help automate your work.