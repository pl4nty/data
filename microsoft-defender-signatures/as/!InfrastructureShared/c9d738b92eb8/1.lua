-- Threat: !InfrastructureShared
-- Name: c9d738b92eb8
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
if #l_0_1 < 50 then
  return mp.CLEAN
end
local l_0_2 = mp.GetParentProcInfo()
if l_0_2 == nil or l_0_2.image_path == nil then
  return mp.CLEAN
end
local l_0_3 = string.lower(l_0_2.image_path)
if l_0_3:match("([^\\]+)$") == "explorer.exe" then
  return mp.INFECTED
end
return mp.CLEAN
