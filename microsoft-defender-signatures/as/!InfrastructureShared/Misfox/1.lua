-- Threat: !InfrastructureShared
-- Name: Misfox
-- Type: 14

function RemovePayloadFromRegistry(l_1_0, l_1_1)
  local l_1_2 = sysio.RegOpenKey(l_1_0)
  
  if l_1_2 then
    local l_1_3 = string.lower(sysio.GetRegValueAsString(l_1_2, l_1_1))
    if l_1_3 then
      sysio.DeleteRegKey(l_1_2, nil)
    end
  end
end

function RemoveMisfoxASEPs(l_2_0)
  local l_2_1 = sysio.RegOpenKey(l_2_0)
  if l_2_1 then
    local l_2_2 = sysio.RegEnumValues(l_2_1)
    for l_2_3, l_2_4 in pairs(l_2_2) do
      local l_2_5 = string.lower(sysio.GetRegValueAsString(l_2_1, l_2_4))
      if not l_2_5 then
        return false
      end
      local l_2_6, l_2_7 = string.match(l_2_5, "%(%[text%.encoding%]::ascii%.getstring%(%[convert%]::frombase64string%(%(gp.*(hk%w%w:\\\\?software\\\\?classes\\\\?%w%w%w%w+).*%.(%w%w%w%w+)%)")
      if l_2_6 then
        sysio.DeleteRegValue(l_2_1, l_2_4)
        l_2_6 = string.gsub(l_2_6, "\\\\", "\\")
        l_2_6 = string.gsub(l_2_6, ":\\", "\\")
        local l_2_8 = sysio.RegExpandUserKey(l_2_6)
        for l_2_9, l_2_10 in pairs(l_2_8) do
          RemovePayloadFromRegistry(l_2_10, l_2_7)
        end
      end
    end
  end
end

if string.match(Remediation.Threat.Name, "Win32/Misfox") or string.match(Remediation.Threat.Name, "PowerShell/Misfox") then
  RemoveMisfoxASEPs("HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run")
  local l_0_0 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run")
  for l_0_1, l_0_2 in pairs(l_0_0) do
    RemoveMisfoxASEPs(l_0_2)
  end
end
