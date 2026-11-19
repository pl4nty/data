-- Threat: !InfrastructureShared
-- Name: 45b3926d67eb
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.find(l_0_0, "\\atbroker.exe") then
  return mp.CLEAN
end
local l_0_1 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Image File Execution Options\\atbroker.exe")
if l_0_1 ~= nil then
  local l_0_2 = sysio.GetRegValueAsString(l_0_1, "Debugger")
  if l_0_2 ~= nil and string.len(l_0_2) >= 1 then
    return mp.INFECTED
  end
end
return mp.CLEAN
