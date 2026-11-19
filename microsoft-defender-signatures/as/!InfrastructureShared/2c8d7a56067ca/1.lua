-- Threat: !InfrastructureShared
-- Name: 2c8d7a56067ca
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
l_0_1 = l_0_1 and string.lower(l_0_1)
local l_0_2 = {"mshta", "http"}
if not contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = mp.GetParentProcInfo()
if l_0_3 ~= nil and l_0_3.image_path ~= nil then
  local l_0_4 = string.lower(l_0_3.image_path)
  if l_0_4:match("([^\\]+)$") == "explorer.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
