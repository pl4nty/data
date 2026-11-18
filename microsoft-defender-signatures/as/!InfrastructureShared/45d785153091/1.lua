-- Threat: !InfrastructureShared
-- Name: 45d785153091
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil or #l_0_1 <= 60 then
  return mp.CLEAN
end
local l_0_2 = mp.GetParentProcInfo()
if l_0_2 ~= nil then
  local l_0_3 = string.lower(l_0_2.image_path)
  if l_0_3:match("([^\\]+)$") == "cscript.exe" or l_0_3:match("([^\\]+)$") == "wscript.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
