-- Threat: !InfrastructureShared
-- Name: 5dd7f2f72e6d
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if not isIEXfound(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = mp.GetParentProcInfo()
if l_0_2 ~= nil and l_0_2.image_path ~= nil then
  local l_0_3 = string.lower(l_0_2.image_path)
  if l_0_3:match("([^\\]+)$") == "explorer.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
