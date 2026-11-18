-- Threat: !InfrastructureShared
-- Name: 35b358de60ba
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.find(l_0_0, "\\atbroker.exe$") then
  return mp.CLEAN
end
local l_0_1 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Image File Execution Options\\atbroker.exe")
if l_0_1 ~= nil then
  local l_0_2 = sysio.GetRegValueAsString(l_0_1, "Debugger")
  if l_0_2 ~= nil and string.len(l_0_2) >= 1 and sysio.IsFileExists(l_0_2) then
    mp.ReportLowfi(l_0_2, 202313540)
  end
end
return mp.INFECTED
