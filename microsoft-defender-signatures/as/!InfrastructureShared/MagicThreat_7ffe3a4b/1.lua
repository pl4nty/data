-- Threat: !InfrastructureShared
-- Name: MagicThreat_7ffe3a4b
-- Type: 14

if #Remediation.Threat.Resources == 1 and string.match(Remediation.Threat.Resources[1].Path, "\\LuaRemediation.exe$") then
  if sysio.IsFileExists(Remediation.Threat.Resources[1].Path) then
    Remediation.DefaultSpecialRegistry("HKLM\\Software\\Microsoft\\MpDefaultsTest")
    Remediation.DefaultSpecialRegistry("HKLM\\Software\\Microsoft\\MpDefaultsTest", "HKLM\\Software\\Microsoft\\MpDefaultsTestClone")
  end
  local userKeys = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\MpDefaultsTestUser")
  for _, userKeyName in pairs(userKeys) do
    local hKey = sysio.RegOpenKey(userKeyName)
    if hKey then
      Remediation.DefaultSpecialRegistry("HKLM\\Software\\Microsoft\\MpDefaultsTest", userKeyName)
    end
  end
end
if Info.EngineVersion > 74598 and #Remediation.Threat.Resources == 1 and string.match(Remediation.Threat.Resources[1].Path, "\\LuaBlock.exe$") then
  local rempol = Remediation.Threat.RemovalPolicy
  rempol = rempol + 256
  Remediation.SetRemovalPolicy(rempol)
end
if #Remediation.Threat.Resources == 1 and string.match(Remediation.Threat.Resources[1].Path, "\\LuaExpand.exe$") then
  function DoExpand(expStr)
    mp.mptrace("Expanding " .. expStr)
    
    local expTable = sysio.ExpandFilePath(expStr)
    if expTable then
      for _, expOut in pairs(expTable) do
        mp.mptrace("  " .. expOut)
      end
    end
  end
  
  DoExpand("C:\\windows")
  DoExpand("%systemdrive%")
  DoExpand("%systemroot%\\system32\\drivers")
  DoExpand("%ProgramFiles%\\omg12345")
  DoExpand("%startmenu%")
end
if #Remediation.Threat.Resources == 1 and string.match(Remediation.Threat.Resources[1].Path, "\\LuaPanic.exe$") then
  mp.mptrace(2 * nil)
end
