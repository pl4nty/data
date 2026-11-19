-- Threat: !InfrastructureShared
-- Name: HijackedTrustedInstaller
-- Type: 15

if not Remediation.Threat.Active then
  return
end
local l_0_0 = sysio.RegOpenKey("hklm\\system\\currentcontrolset\\services\\trustedinstaller")
if l_0_0 then
  sysio.SetRegValueAsStringExpand(l_0_0, "ImagePath", "%SystemRoot%\\servicing\\TrustedInstaller.exe")
end
