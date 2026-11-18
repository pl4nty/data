-- Threat: !InfrastructureShared
-- Name: Morto
-- Type: 15

if string.match(Remediation.Threat.Name, "Morto") then
  local l_0_0 = sysio.RegOpenKey("HKLM\\SYSTEM\\CurrentControlSet\\Services\\6to4")
  if l_0_0 then
    local l_0_1 = sysio.GetRegValueAsString(l_0_0, "ServiceDll")
    if l_0_1 ~= nil and string.match(l_0_1, "ntshrui") then
      local l_0_2 = sysio.RegOpenKey("HKLM\\SYSTEM\\CurrentControlSet\\Services")
      if l_0_2 then
        sysio.DeleteRegKey(l_0_2, "6to4")
      end
    end
  end
  local l_0_3 = sysio.RegOpenKey("HKLM\\SYSTEM\\CurrentControlSet\\Services\\Sens\\Parameters")
  if l_0_3 then
    local l_0_4 = sysio.GetRegValueAsString(l_0_3, "ServiceDll")
    if l_0_4 ~= nil and string.match(l_0_4, "sens32") then
      sysio.SetRegValueAsString(l_0_3, "ServiceDll", "sens.dll")
    end
  end
  local l_0_5 = sysio.RegOpenKey("HKLM\\SYSTEM\\CurrentControlSet\\Control\\Session Manager")
  if l_0_5 then
    local l_0_6 = sysio.GetRegValueAsString(l_0_5, "PendingFileRenameOperations")
    if l_0_6 ~= nil and string.match(l_0_6, "offline.*cache") then
      sysio.DeleteRegValue(l_0_5, "PendingFileRenameOperations")
    end
  end
end
