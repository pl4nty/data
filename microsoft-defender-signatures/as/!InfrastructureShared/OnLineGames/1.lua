-- Threat: !InfrastructureShared
-- Name: OnLineGames
-- Type: 15

if string.match(Remediation.Threat.Name, "OnLineGames%.LH") then
  local l_0_0 = false
  for l_0_1, l_0_2 in ipairs(Remediation.Threat.Resources) do
    if l_0_2.Path ~= nil and string.match(l_0_2.Path, "\\system32\\ws2help%.dll") then
      l_0_0 = true
    end
  end
  if l_0_0 then
    local l_0_3 = sysio.RegOpenKey("HKLM\\System\\CurrentControlSet\\Control\\Session Manager")
    if l_0_3 then
      sysio.SetRegValueAsDword(l_0_3, "AllowProtectedRenames", 1)
      sysio.SetRegValueAsMultiString(l_0_3, "PendingFileRenameOperations", {
        "\\??\\%windir%\\system32\\wimedump.dll",
        "!\\??\\%windir%\\system32\\ws2help.dll"
      })
    end
    Remediation.SetRebootRequired()
  end
end
