-- Threat: !InfrastructureShared
-- Name: 3bd7c2debc0a
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 == nil or l_0_1.image_path == nil then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1.image_path)
if l_0_2:match("([^\\]+)$") ~= "explorer.exe" then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_0)
if not l_0_3 or #l_0_3 <= 60 then
  return mp.CLEAN
end
local l_0_4 = l_0_3:sub(-6)
if not l_0_4:match("%a") then
  return mp.INFECTED
end
return mp.CLEAN
