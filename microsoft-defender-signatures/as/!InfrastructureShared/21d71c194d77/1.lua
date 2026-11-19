-- Threat: !InfrastructureShared
-- Name: 21d71c194d77
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 ~= nil and MpCommon.StringRegExpSearch("[u0010-u00ff][u0100-uffff][u0010-u00ff]", l_0_1) == true then
  local l_0_2 = mp.GetParentProcInfo()
  if l_0_2 ~= nil then
    local l_0_3 = string.lower(l_0_2.image_path)
    if l_0_3 ~= nil and string.find(l_0_3, "explorer.exe", 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
