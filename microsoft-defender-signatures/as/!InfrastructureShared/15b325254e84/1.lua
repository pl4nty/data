-- Threat: !InfrastructureShared
-- Name: 15b325254e84
-- Type: 21

local l_0_0 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Image File Execution Options\\sethc.exe")
if l_0_0 ~= nil then
  local l_0_1 = sysio.GetRegValueAsString(l_0_0, "Debugger")
  if l_0_1 ~= nil and string.len(l_0_1) > 1 then
    if sysio.IsFileExists(l_0_1) then
      mp.ReportLowfi(l_0_1, 2782132239)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
