-- Threat: !InfrastructureShared
-- Name: 277d7798b8afd
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil or #l_0_1 < 900 then
  return mp.CLEAN
end
local l_0_2 = mp.GetParentProcInfo()
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = string.lower(l_0_2.image_path)
if l_0_3:match("([^\\]+)$") == "wmiprvse.exe" then
  if versioning.GetCloudBlockLevel() >= 4 then
    return mp.INFECTED
  end
  return mp.LOWFI
end
return mp.CLEAN
