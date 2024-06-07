; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "My Program"
#define MyAppVersion "1.5"
#define MyAppPublisher "My Company, Inc."
#define MyAppURL "https://www.example.com/"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{C909F4D5-E5AA-4E6D-9890-C4626658D9DD}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DisableDirPage=yes
DefaultGroupName={#MyAppName}
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputBaseFilename=mysetup
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "E:\Programming Code\nodejs_windows_service_inno_setup\winstaller\node-v20.14.0-x64.msi"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\Programming Code\nodejs_windows_service_inno_setup\winstaller\nssm_32.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\Programming Code\nodejs_windows_service_inno_setup\winstaller\nssm_64.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\Programming Code\nodejs_windows_service_inno_setup\app\index.js"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\Programming Code\nodejs_windows_service_inno_setup\app\nodeService.js"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\Programming Code\nodejs_windows_service_inno_setup\app\package.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\Programming Code\nodejs_windows_service_inno_setup\app\service_uninstall.js"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Run]
Filename: "msiexec.exe"; Parameters: "/i ""{app}\node-v20.14.0-x64.msi"" /quiet"; WorkingDir: "{app}"; Flags: waituntilterminated shellexec runhidden; Check: not NodeInstalled

[Run]
Filename: "{cmd}"; Parameters: "/c npm install"; WorkingDir: "{app}"; Flags: runhidden

[Run]
Filename: "{cmd}"; Parameters: "/c node nodeService"; WorkingDir: "{app}"; Flags: runhidden


[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\index.js"

[Code]
function NodeInstalled: Boolean;
var
  ResultCode: Integer;
  Version: String;
begin
  Result := RegQueryStringValue(HKLM, 'SOFTWARE\Node.js', 'CurrentVersion', Version);
end;

function InitializeSetup(): Boolean;
begin
  Result := True;
end;

