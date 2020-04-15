# Scripts
CI / CD scripts

1. Parse-NUnit-Test-Results.ps1 : parses an outcome TestResult.xml and shows the detailed test info. (1 mandatory param TestResult.xml)
2. Get-Most-Common-Error.ps1    : parses a specified nodes (Message and StackTrace by default) and shows most common text. (1 mandatory param TestResult.xml)
3. Define-XML-NameSpace.ps1     : extracts a namespace value from xml file (xmlns node). (1 param: xml-file)
4. Run-DotNet-Tests.ps1         : executes tests with specified category (using dotnet vstest). (2 params: pathToTestDll (mandatory), category)
5. Send-To-Slack.ps1            : sends message to Slack channel (2 params: title, message)
